#!/bin/bash

MY_SHELL="bash"
# !Caution: A space is needed after "[" and before "]"
if [ $MY_SHELL = "bash" ]; then
    echo "You like bash."
    elif [ $MY_SHELL = "csh" ]; then
    echo "You seems like csh."
else
    echo "You do not like any shell."
fi
