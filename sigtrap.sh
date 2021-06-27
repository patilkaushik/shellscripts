#!/bin/bash
######################################
# This script traps the kill signals #
# and prints the kill signal         #
######################################

# Print PID
echo $$

# Definition
LOG=/tmp/$(basename $0).log

# Gather a list of the signals, then trap them
# I don't know why I included SIGKILL -9 ;)
for sig in $(kill -l | sed -r 's/[0-9]{1,2}\)//g')
do
	trap "dothis $sig" $sig
done

# Print intercepted kill signal and log it
function dothis()
{
	cmd="echo "$(trap -l|sed 's/)//g')"|sed -n 's/$1.*//p'|awk '{print \$NF}'"
	SIGNUM=$(eval $cmd)
	printf "$(date +"%Y-%m-%d %T") - Intercepted signal $SIGNUM $1"| tee -a $LOG
	exit $SIGNUM
}

# Infinite loop
while true
do
	sleep 2
done
