#!/bin/bash

######################################
# This script traps the kill signals #
# and prints the kill signal         #
######################################

# Print PID
echo $$

# Definition

LOG=/tmp/`basename $0`.log

# Gather a list of the signals, then trap them
# I don't know why I included SIGKILL -9 ;)
for sig in `kill -l | sed -r 's/[0-9]{1,2}\)//g'`
do
	dothis "$1"
done

function dothis()
{
	printf "%(%Y-%m-%d %T)T - Intercepted signal %s\n" -1 "$1" >> "$LOG"
	#SIG=`trap -l|sed -nr 's/.*( |^)([0-9]+)(\)) SIGBUS.*/\2/p'`
	#SIG=`trap -l | awk '{for(i=1;i<=NF;i++)if($i~/^<SIG\+>$/)print $(i-1)}' | awk -F ")" '{print $1}'`
	#exit $SIG
}

# Infinite loop

while true
do
	sleep 2
done
