#!/bin/bash

INSTANCE_ID="i-03a96ccb9b4930c4e"
INSTANCE_DATA="aws ec2 describe-instances --instance-ids $INSTANCE_ID"
INSTANCE_STATUS=$($INSTANCE_DATA | awk '$1 ~ /\"Name/{print $2}' | sed 's/\"//g')

if [[ $INSTANCE_STATUS == "running" ]]
then
        echo "Instance $INSTANCE_ID is running, public dns name as below:"
        $INSTANCE_DATA | grep -m 1 -o -E "ec2[-0-9]{3,4}.*.com"
else
        echo "Instance $INSTANCE_ID is NOT running."
fi