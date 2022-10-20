#!/bin/bash

INSTANCE_ID="i-03a96ccb9b4930c4e"
TEMP_FILE=$(mktemp)
aws ec2 describe-instances --instance-ids ${INSTANCE_ID} >${TEMP_FILE}
INSTANCE_STATUS=$(awk '$1 ~ /\"Name/{print $2}' $TEMP_FILE | sed 's/\"//g')

if [ $# -eq 0 ]; then
    if [[ $INSTANCE_STATUS == "running" ]]; then
        echo "Instance $INSTANCE_ID is running, public dns name as below:"
        grep -m 1 -o -E "ec2[-0-9]{3,4}.*.com" ${TEMP_FILE}
    else
        echo "Instance $INSTANCE_ID is NOT running."
    fi

elif [[ $1 =~ [sS](tart|TART) ]]; then
    aws ec2 start-instances --instance-ids ${INSTANCE_ID} &>/dve/null &&
        echo "Instance started."

elif [[ $1 =~ [sS](top|TOP) ]]; then
    aws ec2 stop-instances --instance-ids ${INSTANCE_ID} &>/dve/null &&
        echo "Instance stopped."

fi

rm $TEMP_FILE
