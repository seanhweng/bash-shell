#!/bin/bash
# Date: 10/06/2022
# Author: Sean
# Descirption: Change files names from *.jpg to *.jpg_mmddyyyy.

PIC_FILE_LIST=$(ls *.jpg)
DATE=$(date +%d%m%Y)

for FILE in $PIC_FILE_LIST
do
# !Need to use "{}" to enclose variables FILE and DATE.
    echo "Changing file $FILE name to ${FILE}_${DATE}."
    mv $FILE ${FILE}_${DATE}
done
