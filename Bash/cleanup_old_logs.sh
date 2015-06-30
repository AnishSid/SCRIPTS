#!/bin/bash

#NOT A GENERIC ONE. CHANGE YOUR PATHS TO USE TO CLEANUP YOUR LOG FILES IF YOUR CERTAIN PARTITIONS FILLUP

logs="/var/log,/var/crash"
date=$(/bin/date +"%Y%m%d")
logpath="/var/log/delete.log"


echo "FYI: `date +%d-%b-%Y` audit started" >> $logpath


delete_function() {
        path=$1
        days=$2
        find $path -mtime +$days -type f -delete -print
}


    for i in $(echo "$logs" | sed 's/,/\n/')
        do
        day="30"
        delete_function $i $day >> $logpath
        avai=$(df -l | grep '/var' | awk '{print $5}' | sed 's/%//')
    if [ $avai -gt "75" ]
           then
           day="20"
           delete_function $i $day >> $logpath
    if [ $avai -gt "70" ]
              then
              day="10"
              delete_function $i $day >> $logpath
    if [ $avai -gt "80" ]
                 then
                 day="1"
                 delete_function $i $day >> $logpath
              fi
           fi
        fi
    done

   find /var/log/ -mtime +10 -size +500M -type f -delete -print >> $logpath
   find /var/log/ -mtime +2 -size +1000M -type f -delete -print >> $logpath
   find /var/crash -type f -delete -print >> $logpath

