#!/bin/bash

instance_id="i-03a96ccb9b4930c4e"
instance_data="aws ec2 describe-instances --instance-ids $instance_id"
instance_status=$($instance_data | awk '$1 ~ /\"Name/{print $2}' | sed 's/\"//g')

if [[ $instance_status == "running" ]]
then
        echo "Instance $instance_id is running, public dns name as below:"
        $instance_data | grep -m 1 -o -E "ec2[-0-9]{3,4}.*.com"
else
        echo "Instance $instance_id is NOT running."
fi
