#! /bin/bash

RED="\e[31m"
GREEN="\e[1;32m"
# GREEN="\e[33m"
ENDCOLOR="\e[0m"

# read -p "Please input a hostname: " HOSTNAME

for HOST in 192.168.1.{1..255}; do
    (
        ping -c 1 -W 1 $HOST &>/dev/null
        if [ $? -eq 0 ]; then
            echo -e "$(date +%F" "%R" "%Z) ${HOSTNAME} is ${GREEN}online${ENDCOLOR}.\n"
        else
            echo -e "$(date +%F" "%R" "%Z) ${HOSTNAME} is ${RED}offline${ENDCOLOR}.\n"
        fi
    ) &
done
wait
