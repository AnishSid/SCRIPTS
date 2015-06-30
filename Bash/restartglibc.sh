#!/bin/sh
export servicelist=""
for problemservice in `sudo lsof 2> /dev/null |  awk '/libc/{print $1}' | sort -u`
do
  for service in `ls /etc/init.d/* | awk -F "/etc/init.d/" '{print $2}'`
    do
      if [ "$problemservice" == "$service" ]
      then
        if [ -n "`service $problemservice status | grep running`" ]
          then servicelist+=" $problemservice"
          else echo "$problemservice found but service is not running"
        fi
      fi
    done
done
count=`tr -dc ' ' <<<"$servicelist" | wc -c`
echo -n $servicelist | xargs
echo "$count services have to be restarted ($servicelist):"
for service in $servicelist
  do sudo /etc/init.d/$service restart
  done
