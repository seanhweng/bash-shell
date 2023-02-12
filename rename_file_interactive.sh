#!/bin/bash

read -p "What type of file extension you want to rename: " file_extension

file_list=$(ls *.${file_extension} 2>/dev/null)
DATE=$(date +%F)

if [ -z $file_list ]
then
    echo "No file with extension .${file_extension}"
    exit 1
fi

read -p "What prefix to use on new file name[default: YYYY-MM-DD]: " PREF

if [ -z $PREF ]
then
    for FILE in $file_list
    do
        echo "Changing ${FILE} to ${DATE}-${FILE}..."
        mv $FILE ${DATE}-${FILE}
    done
else
    for FILE in $file_list
    do
        echo "Changing ${FILE} to ${PREF}-${FILE}..."
        mv $FILE ${PREF}-${FILE}
    done
fi
