#!/bin/bash
# Author: Sean
# Date: 10/07/2022

read -p "Input Yes or No: " ANSWER

case $ANSWER in
    [yY]|[yY][eE][sS])
        echo "Yes! You did it."
    ;;
    [nN]|[nN][oO])
        echo "No! What do you need?"
    ;;
    *)
        echo "Invalid answer."
        exit 1
esac