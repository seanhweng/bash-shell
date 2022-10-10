#!/bin/bash

backup_file() {
    if [ -f $1 ]
    then
        local BACKUP_FILE=/tmp/$(basename $1).$(date +%m-%d-%y).$$
        echo "Creating back up file for $1 ..."
        cp $1 $BACKUP_FILE
    else
        return 1
    fi
}

backup_file /etc/passwd

if [ $? -eq 0 ]
then
    echo "Back up file successfully."
else
    echo "Back up file failed."
    exit 1
fi