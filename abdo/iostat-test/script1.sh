#!/usr/local/bin/zsh
#-------------------------------------------------------------------------#
#- Author  of this  Program: Abdo Farag 				 -#
#- E-Mail Address of Author: abdofarag85@gmail.com    	                 -#
#- Program Name and Release: IOPs Status Monitoring                      -#
#- Date and Time of Release: 10-2-2015		                         -#
#-                                                                       -#
#- Description and Usage:                                                -#
#-        This script should be run from "Cron Jop" every 10 minutes	 -#
#- to create reports based on statistics  gathered  from   IOSTAT	 -#
#- IOSTAT  is  used  to report about disk I/O activity and throughput.	 -#
#--------------------------BEGIN PROGRAM----------------------------------#

which iostat > /dev/null 2>&1
if [ $? -ne 0 ]
then
  echo "iostat command not found!"
  exit 0
fi

#if [ $# -lt 1 ]
#then
#  echo "diskname argument not specified!"
#  exit
#fi
os=`uname`
Device=$1
if [ "$os" = "Linux" ] || [ "$os" = "linux" ]
then
ostat -xd 1 $Device|
awk -F" " '
 BEGIN {
   cmd="date +%Y-%m-%d..%H:%M:%S"
   print "================================================= IOPs Status Monitoring Linux ================================================="
   print "================================================================================================================================"
   printf "%-10s %-10s %-4s %-4s %-4s %-4s %-4s %-4s %-4s %-4s\n", \
   "   <<Date-|-Time>>  |", "<<Device>>|","<<kBr/s>>|","<<kBw/s>>|","<<IO r/s>>|","<<IO w/s>>|",\
   "<<await>>|","<<r_wait>>|","<<w_wait>>|","<<CPU%util>>|"
   print "================================================================================================================================"}
   NR>=4{ cmd|getline now; \ 
   printf("%s| %-10s| %-9.2f| %-9.2f| %-10.2f| %-10.2f| %-9.2f| %-10.2f| %-10.2f| %-12d|\n", \
   now,$1,$6,$7,$4,$5,$10,$11,$12,$14)
   close(cmd) 
}'


elif [ "$os" = "FreeBSD" ] || [ "$os" = "freebsd" ]
then
iostat -xw 1  $Device|
awk -F" " '
	BEGIN {
		cmd="date +%Y-%m-%d..%H:%M:%S"
		print "======================================= IOPs Status Monitoring ======================================="
		print "======================================================================================================"
		printf "%-10s %-8s %-4s %-4s %-4s %-4s %-4s %-4s\n", \
		"  <<Date-|-Time>>   |","<<Device>>|","<<kr/s>>  |","<<kw/s>>  |", \
		"<<IO r/s>>|","<<IO w/s>>|","<<srv_c>>|","<<qlen>>|"
		print "======================================================================================================"}
		NF==8,NR==NR{ cmd|getline now; \
		printf("%s| %-10s| %-10.2f| %-10.2f| %-10.2f| %-10.2f| %-9.2f| %-8d|\n",now,$1,$4,$5,$2,$3,$7,$6)
		close(cmd) 
	     }'

fi
