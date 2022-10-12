#! /bin/bash
# Author: Sean
# Date: 10/11/2022
# Description: Use vmstat to monitor CPU utilizaiton rate,
# if greater than 50% send alarm to email address.
#

DATE=$(date +%F" "%R)
IP_ADDR=$(ip addr | awk -F'[ /]' '/^\s+inet\s/{print $6}' | grep -v 127)
US=$(vmstat | awk 'NR==3{print $13}')
SY=$(vmstat | awk 'NR==3{print $14}')
# Change email address before use this script.
EMAIL="name@example.com"

which vmstat &>/dev/null
if [ $? -ne 0 ]; then
    echo "vmstat is not installed, please install it."
    exit 1
fi

USAGE=$(($US + $SY))
if [ $USAGE -gt 50 ]; then
    echo "Date: $DATE\nHost: $IP_ADDR\nAlarm: CPU usage rate > $USAGE.\n"
    #echo "Date: $DATE\nHost: $IP_ADDR\nAlarm: CPU usage rate > $USAGE.\n" \
    # | mail -s "CPU high utilization " $EMAIL
else
    echo "Date: $DATE\nHost: $IP_ADDR\nAlarm: CPU usage rate normal.\n"
fi

exit 0
