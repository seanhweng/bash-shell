#!/usr/bin/env bash
#
# Author: Sean
# Date: 10/15/2022
# Revision: V1.0.0

if [ $# -ne 1 ]; then
    echo "Usage: $0 [directory]"
fi

# Do not use "PATH" as variable name! It's bash reserved key words.
# PATH=$1
FILE_PATH=$1

declare -A stat_array

while read FILE; do
    FILE_TYPE=$(file -b "$FILE" | cut -d, -f1)
    ((stat_array[$FILE_TYPE]++))
done < <(find $FILE_PATH -type f -print)

echo "==== File Types and Counts ===="
for FILE_TYPE in "${!stat_array[@]}"; do
    echo "$FILE_TYPE: ${stat_array[$FILE_TYPE]}"
done
