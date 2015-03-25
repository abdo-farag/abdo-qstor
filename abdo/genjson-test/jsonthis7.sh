#! /usr/local/bin/zsh
if [ $# -lt 1 ]
then
  echo "diskname argument not specified!"
  exit
fi
Device=$1;
output=`./script6.sh $Device | awk -F"|" 'NR==1{printf("%s%s",$1,$2)}'`;
name=`echo $output|awk '{printf $1}'`;
Date=`echo $output|awk '{printf $2}'`;
header=`echo '{"device":['`;
echo -n $header
if (($name!=$name)) then
stats=`echo '{"name":"'$name'","stats":['`;
echo -n $stats
elif (($Date!=$Dates)) then
Dates=`echo '{"Dates":[{"Date":"'$Date'","times":['`;
echo -n $Dates
fi
#echo -n $header
	output=`./script6.sh $Device | awk -F"|" 'NR==1{printf("%s%s%s%s%s%s",$3,$4,$5,$6,$7,$8)}'`;
        Time=`echo $output|awk '{printf $1}'`;
	bw=`echo $output|awk '{printf $2}'`;
	rs=`echo $output|awk '{printf $3}'`;
	ws=`echo $output|awk '{printf $4}'`;
	svct=`echo $output|awk '{printf $5}'`;
	qlen=`echo $output|awk '{printf $6}'`;
	oper=($(echo ${Time}) ;$(echo ${bw}) ;$(echo ${rs}) ;$(echo ${ws}) ;$(echo ${svct}) ;$(echo ${qlen}));
	streamo=`echo '{"time":"'$oper[1]'","bw":"'$oper[2]'","rs":"'$oper[3]'","ws":"'$oper[4]'","svct":"'$oper[5]'","qlen":"'$oper[6]'"'`;
	streamo=`echo $streamo"}]}]}]}]}"`;
	any=`echo -n  $header ; echo $streamo`
		echo $any 
