#!/usr/bin/env bash
# Created Date: 10-28-2022                                                    # 
# Discription:                                                                # 
# Author: Sean Weng                                                           # 
# -----                                                                       # 
# HISTORY:                                                                    # 
# 


if [ -z $1 ]
then
echo "Usage: $0 <hostname>"
exit 1
fi

ping -c 1 -W $1 &> /dev/null
if [ -z $? ]
then
echo "$1 is not reachable."
exit 1
fi

ssh $1 "sudo useradd ansible-admin -p 123 -s /bin/bash"
ssh $1 "echo 'ansible-admin ALL=(ALL) NOPASSWD: ALL' | sudo tee -a /etc/sudoers &> /dev/null"
