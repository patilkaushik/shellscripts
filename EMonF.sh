#/bin/bash
###########################################################################
# This is Email Monitoring Framework. This provides template for writing   
# Email monitoring scripts                                                 
###########################################################################
# Author:                                                                  
# Title:                                                                 
# Description:   
# Email:                                                          
# Version:                                                                 
###########################################################################

# Definition

MAILLIST=name@email.com,yourname@email.com
EMAILBODY="This is your email alert"
LOGDIR="/path/to/logdir"
TMPDIR="/path/to/tmpdir"

USAGE="Usage: command -ihv args"


# Validation

# Options Processing
if [ $# == 0 ] || [! -f /path/to/file] ; then
    echo $USAGE
    exit 1;
fi

# Check if file exists
if [ ! -f $1 ]
then
	echo "File $1 does not exist" > /tmp/`basename $0`.err
	exit 1
fi

#Check not null
if [ -z $VARIABLE ] ; then
    echo "VAR/FILE cannot be null"
    exit 1;
fi

# Check if last command wa successful
if [ $? -eq 0 ]; then
  echo "Last command was successful" 
  exit 0
fi

# command fails
if ! df $mount > /dev/null 2>&1; then
	echo "Bad mount"
	exit 1
fi


# Color lib

Colors() {
	
    Escape="\033";

    BlackF="${Escape}[30m";RedF="${Escape}[31m";GreenF="${Escape}[32m";
    YellowF="${Escape}[33m";BlueF="${Escape}[34m";Purplef="${Escape}[35m";
    CyanF="${Escape}[36m";WhiteF="${Escape}[37m";

    BlackB="${Escape}[40m";RedB="${Escape}[41m";GreenB="${Escape}[42m";
    YellowB="${Escape}[43m";BlueB="${Escape}[44m";PurpleB="${Escape}[45m";
    CyanB="${Escape}[46m";WhiteB="${Escape}[47m";

    Reset="${Escape}[0m";
	
	if [ $# -gt 0 ]; then
		echo -e "Below variables are available for respective colour \n ${BlackF}BlackF\t${RedF}RedF\t${GreenF}GreenF\t${YellowF}YellowF\t${BlueF}BlueF\t${Purplef}Purplef\t${CyanF}CyanF\t${WhiteF}WhiteF\t\n ${Reset}${BlackB}BlackB\t${RedB}RedB\t${GreenB}GreenB\t${YellowB}YellowB\t${BlueB}BlueB\t${PurpleB}PurpleB\t${CyanB}CyatB\t${WhiteB}WhiteB\t${Reset}"
	fi
}

#


## Create lock file 

LOCK_FILE=/tmp/$SUBJECT.lock
if [ -f "$LOCK_FILE" ]; then
   echo "Script is already running"
   exit
fi

trap "rm -f $LOCK_FILE" EXIT
touch $LOCK_FILE


rm -rf $LOCK_FILE # at the time of exit
##





# Parse command inputs to comman line

while getopts ":i:vh" optname
  do
    case "$optname" in
      "v")
        echo "Version $VERSION"
        exit 0;
        ;;
      "i")
        echo "-i argument: $OPTARG"
        ;;
      "h")
        echo $USAGE
        exit 0;
        ;;
      "?")
        echo "Unknown option $OPTARG"
        exit 0;
        ;;
      ":")
        echo "No argument value for option $OPTARG"
        exit 0;
        ;;
      *)
        echo "Unknown error while processing options"
        exit 0;
        ;;
    esac
  done

#


# Your logic goes here

#if [ true ]
#then
#fi


# Send email

echo "$EMAILBODY"|mail -s "Alert subject goes here" -r "Name<name@mail.com>" -a /path/to/attachment $MAILLIST
