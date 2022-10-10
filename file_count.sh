#!/bin/bash

file_count() {
    local FILE_NUM=$(ls $1 | wc -l)
    echo -e "${1}: \n ${FILE_NUM}"
}

for DIR in "/etc" "/var" "/usr/bin"
do
file_count $DIR
done