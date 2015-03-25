#!/usr/local/bin/zsh
logs="curlogs.log"
Device=$1
Date=$2
device=`grep $Device $logs`
#devices=` echo $device | awk -F '[[{]' '{printf("%s",$2)}'`
header=`echo '{"device":[{"name":"'$Device'","stats":[{"Dates":[{"Date":"'$Date'","times":['`;
date=`echo $device | grep "$Date"`;
#####date=` echo $date | awk -F '[,{]' '{printf"{%s},",$7}'`
stats=` echo $date | awk -F '[}{]' '{printf"{%s},",$6}'`;
end=`echo $stats ']}]}]}]}' `
#stat=`echo $stat`;
##| awk -F "," '{printf"%s",$2}'`
#date=`echo $date | grep "$Date"`
#date=`echo $date | awk -F '[}[]' '{printf"%s",$4}'`
#date=`echo $date | awk -F '[{,]' '{printf"%s",$2}'`
echo -n $header ; echo $end
