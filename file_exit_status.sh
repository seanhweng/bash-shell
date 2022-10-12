#!/bin/bash

FILE=$1


if [ -f $FILE ]
then
    echo "Regular file."
    exit 0
elif [ -d $FILE ]
then
    echo "Directory."
    exit 1
else
    echo "Other types."
    exit 2
fi