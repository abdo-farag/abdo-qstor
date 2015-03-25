#! /usr/local/bin/zsh
# needed the operands to be like : one vaule1 two value2 three value3 four value4
str=$@;
#oper=($(echo ${Time}) ;$(echo ${bw}) ;$(echo ${rs}) ;$(echo ${ws}) ;$(echo ${svct}) ;$(echo ${qlen}));
oper=($(echo ${str}));
#n=`echo ${#oper[@]}`
        #oper=($(echo ${Time}) ;$(echo ${bw}) ;$(echo ${rs}) ;$(echo ${ws}) ;$(echo ${svct}) ;$(echo ${qlen}));
        streamo=`echo '{"time":"'$oper[1]'","bw":"'$oper[2]'","rs":"'$oper[3]'","ws":"'$oper[4]'","svct"::w:"'$oper[5]'","qlen":"'$oper[6]'"'`;
streamo=`echo $streamo"}"`;
echo $streamo ;
