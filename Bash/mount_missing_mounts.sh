#!/usr/local/bin/bash

M1=/tmp/m1.$$
M2=/tmp/m2.$$

uptime=`/bin/awk '{printf "%d",$1}' /proc/uptime`;
if [ $uptime -lt 1800 ];then
    echo "Uptime less than 30 minutes, exiting"
      exit 0
fi

#Fix stale NFS handles
for i in `grep nfs /proc/mounts | awk '{print $2}'`
  do
  ls -l $i &> /dev/null
      if [ ! "$?" = "0" ]
      then
      echo "$i mount is bad"
      umount -l $i
     fi
     done

 #Mount missing mounts
 awk '/nfs/{print $2}' /etc/fstab | sort > $M1
 mount | grep 'type nfs' | sed -e 's/.* on //' -e 's/ type nfs.*//' | sort > $M2
 diff $M1 $M2 | grep '<' > /dev/null 2>&1
     if [ $? -eq 0 ];then
       echo "fixing missing mounts"
       sudo mount -Fat nfs
     else
       echo "all mounts found"
     fi
 rm -r $M1 $M2
