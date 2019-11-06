#!/bin/bash

######################################
# This script traps the kill signals #
# and prints the kill signal         #
######################################

# Print PID
echo $$

# Definition

LOG=/tmp/`basename $0`.log

# Trap all kill signals
# I don't no why I included SIGKILL -9 ;)

trap 'dothis SIGHUP'      SIGHUP
trap 'dothis SIGINT'      SIGINT
trap 'dothis SIGQUIT'     SIGQUIT
trap 'dothis SIGILL'      SIGILL
trap 'dothis SIGTRAP'     SIGTRAP
trap 'dothis SIGABRT'     SIGABRT
trap 'dothis SIGBUS'      SIGBUS
trap 'dothis SIGFPE'      SIGFPE
trap 'dothis SIGKILL'     SIGKILL
trap 'dothis SIGUSR1'     SIGUSR1
trap 'dothis SIGSEGV'     SIGSEGV
trap 'dothis SIGUSR2'     SIGUSR2
trap 'dothis SIGPIPE'     SIGPIPE
trap 'dothis SIGALRM'     SIGALRM
trap 'dothis SIGTERM'     SIGTERM
trap 'dothis SIGSTKFLT'   SIGSTKFLT
trap 'dothis SIGCHLD'     SIGCHLD
trap 'dothis SIGCONT'     SIGCONT
trap 'dothis SIGSTOP'     SIGSTOP
trap 'dothis SIGTSTP'     SIGTSTP
trap 'dothis SIGTTIN'     SIGTTIN
trap 'dothis SIGTTOU'     SIGTTOU
trap 'dothis SIGURG'      SIGURG
trap 'dothis SIGXCPU'     SIGXCPU
trap 'dothis SIGXFSZ'     SIGXFSZ
trap 'dothis SIGVTALRM'   SIGVTALRM
trap 'dothis SIGPROF'     SIGPROF
trap 'dothis SIGWINCH'    SIGWINCH
trap 'dothis SIGIO'       SIGIO
trap 'dothis SIGPWR'      SIGPWR
trap 'dothis SIGSYS'      SIGSYS
trap 'dothis SIGRTMIN'    SIGRTMIN
trap 'dothis SIGRTMIN+1'  SIGRTMIN+1
trap 'dothis SIGRTMIN+2'  SIGRTMIN+2
trap 'dothis SIGRTMIN+3'  SIGRTMIN+3
trap 'dothis SIGRTMIN+4'  SIGRTMIN+4
trap 'dothis SIGRTMIN+5'  SIGRTMIN+5
trap 'dothis SIGRTMIN+6'  SIGRTMIN+6
trap 'dothis SIGRTMIN+7'  SIGRTMIN+7
trap 'dothis SIGRTMIN+8'  SIGRTMIN+8
trap 'dothis SIGRTMIN+9'  SIGRTMIN+9
trap 'dothis SIGRTMIN+10' SIGRTMIN+10
trap 'dothis SIGRTMIN+11' SIGRTMIN+11
trap 'dothis SIGRTMIN+12' SIGRTMIN+12
trap 'dothis SIGRTMIN+13' SIGRTMIN+13
trap 'dothis SIGRTMIN+14' SIGRTMIN+14
trap 'dothis SIGRTMIN+15' SIGRTMIN+15
trap 'dothis SIGRTMAX-14' SIGRTMAX-14
trap 'dothis SIGRTMAX-13' SIGRTMAX-13
trap 'dothis SIGRTMAX-12' SIGRTMAX-12
trap 'dothis SIGRTMAX-11' SIGRTMAX-11
trap 'dothis SIGRTMAX-10' SIGRTMAX-10
trap 'dothis SIGRTMAX-9'  SIGRTMAX-9
trap 'dothis SIGRTMAX-8'  SIGRTMAX-8
trap 'dothis SIGRTMAX-7'  SIGRTMAX-7
trap 'dothis SIGRTMAX-6'  SIGRTMAX-6
trap 'dothis SIGRTMAX-5'  SIGRTMAX-5
trap 'dothis SIGRTMAX-4'  SIGRTMAX-4
trap 'dothis SIGRTMAX-3'  SIGRTMAX-3
trap 'dothis SIGRTMAX-2'  SIGRTMAX-2
trap 'dothis SIGRTMAX-1'  SIGRTMAX-1
trap 'dothis SIGRTMAX'    SIGRTMAX

function dothis()
{
echo "`date +"%Y-%m-%d %T"` - Intercepted signal $1"| tee -a $LOG
#SIG=`trap -l|sed -nr 's/.*( |^)([0-9]+)(\)) SIGBUS.*/\2/p'`
#SIG=`trap -l | awk '{for(i=1;i<=NF;i++)if($i~/^<SIG\+>$/)print $(i-1)}' | awk -F ")" '{print $1}'`
#exit $SIG
}

# Infinite loop

while [ true ]
do
sleep 2
done
