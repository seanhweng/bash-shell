#!/usr/bin/env bash
#
# Usage: generate_password.sh [password_number] [password_length]
# Default value to password_number is 1 if this field is not specified.
# Default value to password_length is 14 if this field is not specified.
# Example:
# generate_password.sh 3 10
#
# Author: Sean
# Date: 10/11/2022
# Revision: V1.0.0
PASSWORD_NUM=$1
PASSWORD_LENGTH=$2

if [ -z "$1" ]; then
    read -p "Use default configuration to generate one password length 14?[y]" CHOICE
    if [[ $CHOICE =~ [yY]+[eE]{0,1}[sS]{0,1} || $CHOICE == '' ]]; then

        PASSWORD_NUM=1
        PASSWORD_LENGTH=14
        PASSWORD=$(openssl rand -base64 48 | cut -c1-${PASSWORD_LENGTH})
        echo -e "1\t$PASSWORD"
    else
        echo "Run the command again for other options"
        exit 0
    fi
elif [ $1 == "-h" ] || [ $1 == "--help" ]; then
    echo "Usage $0 [password_number] [password_length]"
    exit 1
else
    [[ -n $PASSWORD_LENGTH ]] || PASSWORD_LENGTH=14

    for i in $(seq 1 $PASSWORD_NUM); do
        PASSWORD=$(openssl rand -base64 48 | cut -c1-${PASSWORD_LENGTH})
        echo -e "$i\t$PASSWORD"
    done
fi


