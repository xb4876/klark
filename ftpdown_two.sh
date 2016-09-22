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

Save_Dir=/data/icann/${Date_Time}

if [ ! -d $Save_Dir ];then

  mkdir -p $Save_Dir

fi

cd $Save_Dir

# #down org============================start 
#       echo "org_starttime------`date`" >>/home/ftpdata/ftp_zone.log
#       #create new file
#       riqi=`date +%Y-%m-%d`
#       dir_org="/home/ftpdata/org/$riqi"
#       mkdir -p $dir_org
#       cd $dir_org
       wget -c  -a /home/ftpdata/shell/log/wget-log.log  -t 0 ftp://dn1.publicinterestregistry.net/zonefile/org.zone.gz --ftp-user=zorg1081 --ftp-password=gykdtCRX995 -O ${Date_Time_yes}-org-zone-data.txt.gz

       touch ${Date_Time_yes}-org-zone-data.txt.gz.end
#       wget -c -b -a /home/ftpdata/shell/log/wget-log.log  -t 0 ftp://dn1.publicinterestregistry.net/zonefile/org.zone.gz.md5 --ftp-user=zorg1081 --ftp-password=gykdtCRX9
# 
#    #down org=============================end
#
#    #down biz============================start 
#       echo "biz_starttime------`date`" >>/home/ftpdata/ftp_zone.log
#       #create new file
#       riqi=`date +%Y-%m-%d`
#       dir_biz="/home/ftpdata/biz/$riqi"
#       mkdir -p $dir_biz
#       cd $dir_biz
       wget -c -a /home/ftpdata/shell/log/wget-log.log  -t 0 ftp://ftp.neustar.biz/biz.zone.gz --ftp-user=bizzone425 --ftp-password=cNEP88Lj -O ${Date_Time_yes}-biz-zone-data.txt.gz 
       
       touch ${Date_Time_yes}-biz-zone-data.txt.gz.end



#    #down biz============================end
#
#    #down mobi============================start
#       echo "mobi_starttime------`date`" >>/home/ftpdata/ftp_zone.log
#       #create new file
#       riqi=`date +%Y-%m-%d`
#       dir_mobi="/home/ftpdata/mobi/$riqi"
#       mkdir -p $dir_mobi
#       cd $dir_mobi
       wget -c -a /home/ftpdata/shell/log/wget-log.log -t 0 ftp://ftp.dotmobiregistry.net/zonefile/mobi.zone.gz  --ftp-user=zmobi335 --ftp-password=3p5v4ERu2T -O ${Date_Time_yes}-mobi-zone-data.txt.gz

       touch ${Date_Time_yes}-mobi-zone-data.txt.gz.end
#       wget -c -b -a /home/ftpdata/shell/log/wget-log.log -t 0 ftp://ftp.dotmobiregistry.net/zonefile/mobi.zone.gz.md5  --ftp-user=zmobi335 --ftp-password=3p5v4ERu2T
#    #down mobi============================end




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
#
#
#
##org ----------------------------------------------------------------
#org_Name=${Date_Time_yes}-org-zone-data.txt
#
#cp -p ${Save_Dir}/${org_Name}.gz ${save_Unzip_Dir}
#
#mkdir  org
#
#gunzip -c ${org_Name}.gz > ./org/${org_Name}
#
#
#file_org_Size=`du ./org/${org_Name} |awk '{print $1}'`
#
#
#
#if [ $file_org_Size -ge 1048576  ];then
#
#split -50000 -a 5 ./org/${org_Name} ./org/part_
#
#rm -f ./org/${org_Name}
#
#fi
#
#
#rm -f ./${org_Name}.gz
#
#
#
#touch org.end
#
#
##biz--------------------------------------------------------------------
#
#
#
##biz----------------------------------------------------------------
#biz_Name=${Date_Time_yes}-biz-zone-data.txt
#
#cp -p ${Save_Dir}/${biz_Name}.gz ${save_Unzip_Dir}
#
#mkdir  biz
#
#gunzip -c ${biz_Name}.gz > ./biz/${biz_Name}
#
#
#file_biz_Size=`du ./biz/${biz_Name} |awk '{print $1}'`
#
#
#
#if [ $file_biz_Size -ge 1048576  ];then
#
#split -50000 -a 5 ./biz/${biz_Name} ./biz/part_
#
#rm -f ./biz/${biz_Name}
#
#fi
#
#
#rm -f ./${biz_Name}.gz
#
#
#
#touch biz.end
#
#
##biz--------------------------------------------------------------------
#
#
##mobi----------------------------------------------------------------
#mobi_Name=${Date_Time_yes}-mobi-zone-data.txt
#
#cp -p ${Save_Dir}/${mobi_Name}.gz ${save_Unzip_Dir}
#
#mkdir  mobi
#
#gunzip -c ${mobi_Name}.gz > ./mobi/${mobi_Name}
#
#
#file_mobi_Size=`du ./mobi/${mobi_Name} |awk '{print $1}'`
#
#
#
#if [ $file_mobi_Size -ge 1048576  ];then
#
#split -50000 -a 5 ./mobi/${mobi_Name} ./com/part_
#
#rm -f ./mobi/${mobi_Name}
#
#fi
#
#
#rm -f ./${mobi_Name}.gz
#
#
#
#touch mobi.end
#
#
##mobi--------------------------------------------------------------------
#


fi
