#! /bin/bash

RED="\e[31m"
GREEN="\e[1;32m"
# GREEN="\e[33m"
ENDCOLOR="\e[0m"

# read -p "Please input a hostname: " HOSTNAME

while true
do
    read -p "Please input a hostname: " HOSTNAME
    ping -c 1 -W 3 $HOSTNAME &>/dev/null
    if [ $? -eq 0 ]
    then
        echo -e "$(date +%F" "%R" "%Z) ${HOSTNAME} is ${GREEN}online${ENDCOLOR}.\n"
        continue
    else
        echo -e "$(date +%F" "%R" "%Z) ${HOSTNAME} is ${RED}offline${ENDCOLOR}.\n"
        continue
    fi
done
