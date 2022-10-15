#!/usr/bin/env bash

# Author: Sean
# Date: 10/15/2022
# Version: 1.0.0

COUNT=1
FILE_LIST=$(find . -type f -regextype egrep -iregex ".*\.(jpg|png)$")
for IMG in $FILE_LIST
do
    NEW_IMG=new_image_${COUNT}.${IMG##*.}
    echo "Renaming $IMG to $NEW_IMG.."
    mv "$IMG" "$NEW_IMG"
    # let COUNT++
    (( COUNT++ )) || true
done