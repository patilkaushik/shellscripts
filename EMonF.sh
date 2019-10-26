#/bin/bash
######################################
# This is Email Monitoring Framework #
# This provides template for writing #
# Email monitoring scripts           #
######################################
# Author:                            #
# Contact:                           #
# Description:                       #
# Version:                           #
######################################

# Definition

MAILLIST=name@email.com,yourname@email.com
EMAILBODY="This is your email alert"
LOGDIR="/path/to/logdir"
TMPDIR="/path/to/tmpdir"

# Your logic goes here

#if [ true ]
#then
#fi


# Send email

echo "$EMAILBODY"|mail -s "Alert subject goes here" -r "Name<name@mail.com>" -a /path/to/attachment $MAILLIST
