#!/bin/bash

#disknum=`df -lh /home|grep /|grep %|awk '{print $4}' |sed 's/%//g'`
disknum=`df |grep '\/$'|awk {'print $5'}|awk  -F'%'  {'print $1'}`
#look home disknum
#echo $disknum
if [ $disknum -ge 98 ];then    
    wall "=============The disk is full============="    
    echo "=============The disk is full=============" >>/home/ftpdata/ftp_error.log
else

#create dir
Date_Time=`date +%Y-%m-%d`

Date_Time_yes=`date -d yesterday +%Y%m%d`

Save_Dir=/data/watcherlab/

if [ ! -d $Save_Dir ];then

  mkdir -p $Save_Dir

fi

cd $Save_Dir

# #down watcherlab============================start 
       wget -c  -a /home/ftpdata/shell/log/wget-log.log  -t 0 http://feed.watcherlab.com/watcherlab-${Date_Time_yes}.tgz

       tar -xf watcherlab-${Date_Time_yes}.tgz
#    #down org=============================end


fi
