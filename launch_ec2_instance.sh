#!/usr/bin/env bash
# Created Date: 10-23-2022                                                    #
# Discription:                                                                #
# Author: Sean Weng                                                           #
# -----                                                                       #
# HISTORY:                                                                    #
#

read -p "How many instances to launch?" COUNT
aws ec2 run-instances --count ${COUNT} \
    --image-id ami-06640050dc3f556bb \
    --instance-type t2.micro \
    --key-name "InstanceKey0509" \
    --security-group-ids sg-0b91b5c6388d0c1f2 \
    --subnet-id subnet-05967a9797370f719
