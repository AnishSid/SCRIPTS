#!/bin/sh

SYSCTLCONF=/etc/sysctl.conf

function replace {
	cat ${SYSCTLCONF}|grep -v "$1" >${SYSCTLCONF}.last
	echo "$2" >>${SYSCTLCONF}.last
	cp ${SYSCTLCONF}.last ${SYSCTLCONF}
	echo "$2"
}

echo "# HACKED changes." >>$SYSCTLCONF

#LIKE BELOW ADD ANY CHANGES YOU WANNA HACK
replace vm.swappiness "vm.swappiness = 10"

/sbin/sysctl -p $SYSCTLCONF
echo "sysctl.conf loaded..."
