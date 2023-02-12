#! /bin/bash

RED="\e[31m"
# RED="\033[31m"
GREEN="\e[1;32m"
# GREEN="\e[33m"
ENDCOLOR="\e[0m"
# ENDCOLOR="\033[0m"

echo -e "${RED}This is some red text, ${ENDCOLOR}"
echo -e "${GREEN}And this is some green text${ENDCOLOR}"
