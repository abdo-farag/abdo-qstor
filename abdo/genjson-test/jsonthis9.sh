#!/usr/local/bin/zsh
#logs="curlogs.log"
logs="../../currenttraffic.log"
Device=$1
Date=$2
device=`grep $Device $logs`
#header=`echo '{"device":[{"name":"'$Device'","stats":[{"Dates":[{"Date":"'$Date'","times":['`;
date=`echo $device | grep "$Date"`;
###curlogs.log###
#stats=` echo $date | awk -F '[}{]' '{printf"{%s},",$6}'`;
###currenttraffic.log###
# stats=` echo $date | awk -F '[][]' '{printf"%s",$7}'`;
#end=`echo $stats']}]}]}]}' `
#echo -n $header ; echo $end
echo $stats
