#!/bin/bash

#disknum=`df -lh /home|grep /|grep %|awk '{print $4}' |sed 's/%//g'`
#disknum=`df |grep '\/data$'|awk {'print $5'}|awk  -F'%'  {'print $1'}`
disknum=$(df -h |grep /dev/sda1 | awk '{print $5}'|cut -d "%" -f 1)
#look home disknum
echo $disknum
if [ $disknum -ge 80 ];then    
    wall "=============The disk is full============="    
    echo "=============The disk is full=============" >>/home/ftpdata/ftp_error.log
else


#create dir
Date_Time=`date +%Y-%m-%d`

Date_Time_yes=`date -d yesterday +%Y%m%d`

Save_Dir=/data/icann/${Date_Time}

if [ ! -d $Save_Dir ];then

  mkdir -p $Save_Dir

fi

cd $Save_Dir



 #down com=============================start
       echo "com_starttime------`date`" >>/home/ftpdata/ftp_zone.log
       #create new file
       #riqi=`date +%Y-%m-%d`
       #dir_com="/home/ftpdata/com/$riqi"
       #mkdir -p $dir_com
       #cd $dir_com
       wget -c  -a /home/ftpdata/shell/log/wget-log.log -t 0 ftp://rz.verisign-grs.com/com.zone.gz --ftp-user=szhang --ftp-password=Fukang873 -O ${Date_Time_yes}-com-zone-data.txt.gz

       touch ${Date_Time_yes}-com-zone-data.txt.gz.end

    #down com=============================end
    
#    #down net============================start 
#       echo "net_starttime------`date`" >>/home/ftpdata/ftp_zone.log
#       #create new file
#       riqi=`date +%Y-%m-%d`
#       dir_net="/home/ftpdata/net/$riqi"
#       mkdir -p $dir_net
#       cd $dir_net
       wget -c -a /home/ftpdata/shell/log/wget-log.log -t 0 ftp://rz.verisign-grs.com/net.zone.gz --ftp-user=szhang --ftp-password=Fukang873 -O ${Date_Time_yes}-net-zone-data.txt.gz

       touch ${Date_Time_yes}-net-zone-data.txt.gz.end
#    #down net=============================end
#
#    #down root============================start 
#       echo "root_starttime------`date`" >>/home/ftpdata/ftp_zone.log
#       #create new file
#       riqi=`date +%Y-%m-%d`
#       dir_root="/home/ftpdata/root/$riqi"
#       mkdir -p $dir_root
#       cd $dir_root
       wget -c  -a /home/ftpdata/shell/log/wget-log.log  -t 0 ftp://rz.verisign-grs.com/root.zone.gz --ftp-user=szhang --ftp-password=Fukang873 -O ${Date_Time_yes}-root-zone-data.txt.gz 
       touch ${Date_Time_yes}-root-zone-data.txt.gz.end
#    #down root=============================end
#
#    #down arpa============================start 
#       echo "arpa_starttime------`date`" >>/home/ftpdata/ftp_zone.log
#       #create new file
#       riqi=`date +%Y-%m-%d`
#       dir_arpa="/home/ftpdata/arpa/$riqi"
#       mkdir -p $dir_arpa
#       cd $dir_arpa
       wget -c -b -a /home/ftpdata/shell/log/wget-log.log  -t 0 ftp://rz.verisign-grs.com/arpa.zone.gz --ftp-user=szhang --ftp-password=Fukang873 -O ${Date_Time_yes}-arpa-zone-data.txt.gz

       touch ${Date_Time_yes}-arpa-zone-data.txt.gz.end
#    #down arpa=============================end







##run unzip program
#
#save_Unzip_Dir=/data/icannunpack/${Date_Time}
#
#if [ ! -d $save_Unzip_Dir ];then
#
#  mkdir -p $save_Unzip_Dir
#
#fi
#
#cd $save_Unzip_Dir
#
#
##run net----------------------------------------------------------------
#net_Name=${Date_Time_yes}-net-zone-data.txt
#
#cp -p ${Save_Dir}/${net_Name}.gz ${save_Unzip_Dir}
#
#mkdir  net
#
#gunzip -c ${net_Name}.gz > ./net/${net_Name}
#
#if [ $? -eq 0 ];then
#
#file_net_Size=`du ./net/${net_Name} |awk '{print $1}'`
#
#
#
#if [ $file_net_Size -ge 1048576  ];then
#
#split -50000 -a 5 ./net/${net_Name} ./net/part_
#
#rm -f ./net/${net_Name}
#
#fi
#
#
#rm -f ./${net_Name}.gz
#
#
#touch net.end
#
#else
#
#touch net.error
#
#fi
#
##net--------------------------------------------------------------------
#
#
##com net----------------------------------------------------------------
#com_Name=${Date_Time_yes}-com-zone-data.txt
#
#cp -p ${Save_Dir}/${com_Name}.gz ${save_Unzip_Dir}
#
#mkdir  com
#
#gunzip -c ${com_Name}.gz > ./com/${com_Name}
#
#
#if [ $? -eq 0 ];then
#
#file_com_Size=`du ./com/${com_Name} |awk '{print $1}'`
#
#
#
#if [ $file_com_Size -ge 1048576  ];then
#
#split -50000 -a 5 ./com/${com_Name} ./com/part_
#
#rm -f ./com/${com_Name}
#
#fi
#
#
#rm -f ./${com_Name}.gz
#
#
#
#touch com.end
#
#else
#touch com.error
#
#fi
##com--------------------------------------------------------------------
#
#
##root net----------------------------------------------------------------
#root_Name=${Date_Time_yes}-root-zone-data.txt
#
#cp -p ${Save_Dir}/${root_Name}.gz ${save_Unzip_Dir}
#
#mkdir  root
#
#gunzip -c ${root_Name}.gz > ./root/${root_Name}
#
#
#if [ $? -eq 0 ];then
#
#file_root_Size=`du ./root/${root_Name} |awk '{print $1}'`
#
#
#
#if [ $file_root_Size -ge 1048576  ];then
#
#split -50000 -a 5 ./root/${root_Name} ./root/part_
#
#rm -f ./root/${root_Name}
#
#fi
#
#
#rm -f ./${root_Name}.gz
#
#
#
#touch root.end
#else
#
#touch root.error
#
#fi
#
##root--------------------------------------------------------------------
#
#
##arpa net----------------------------------------------------------------
#arpa_Name=${Date_Time_yes}-arpa-zone-data.txt
#
#cp -p ${Save_Dir}/${arpa_Name}.gz ${save_Unzip_Dir}
#
#mkdir  arpa
#
#gunzip -c ${arpa_Name}.gz > ./arpa/${arpa_Name}
#
#
#if [ $? -eq 0 ];then
#
#file_arpa_Size=`du ./arpa/${arpa_Name} |awk '{print $1}'`
#
#
#
#if [ $file_arpa_Size -ge 1048576  ];then
#
#split -50000 -a 5 ./arpa/${arpa_Name} ./arpa/part_
#
#rm -f ./arpa/${arpa_Name}
#
#fi
#
#
#rm -f ./${arpa_Name}.gz
#
#
#
#touch arpa.end
#else
#
#touch arpa.error
#
#fi
#
##net--------------------------------------------------------------------
#


fi
