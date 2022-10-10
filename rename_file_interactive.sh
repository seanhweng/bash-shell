#!/bin/bash

read -p "What type of file extension you want to rename: " EXTENSION

FILE_LIST=$(ls *.${EXTENSION} 2>/dev/null)
DATE=$(date +%F)

if [ -z $FILE_LIST ]
then
    echo "No file with extension .${EXTENSION}"
    exit 1
fi

read -p "What prefix to use on new file name[default: YYYY-MM-DD]: " PREF

if [ -z $PREF ]
then
    for FILE in $FILE_LIST
    do
        echo "Changing ${FILE} to ${DATE}-${FILE}..."
        mv $FILE ${DATE}-${FILE}
    done
else
    for FILE in $FILE_LIST
    do
        echo "Changing ${FILE} to ${PREF}-${FILE}..."
        mv $FILE ${PREF}-${FILE}
    done
fi