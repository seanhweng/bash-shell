#!/usr/bin/env bash

# Show host basic hardware and system information.
# Use -c to generate csv format output

# Author: Sean
# Date:10/13/2022
# Version: 1.0.0

[ $EUID -eq 0 ] || {
    echo "Need user root to run this script."
    exit 1
}

FIELD_DELIMITER=": "

[[ $1 == "-c" ]] && FIELD_DELIMITER=", "

# Hostname
echo "Hostname${FIELD_DELIMITER}$(hostname)"

dmidecode -t system | grep -e "Manufacturer|Product Name|Serial Number" |
    sed 's/^\s*//' | sed 's/:/,/'

echo "OS${FIELD_DELIMITER}$(cat /etc/redhat-release)"
echo "Kernel${FIELD_DELIMITER}$(uname -r)"
echo "Architecture${FIELD_DELIMITER}$(uname -m)"

MEMORY_IN_GB=$(dmidecode --type memory | awk '/^\s*Size/{print $2}')
echo "MEMORY_IN_GB${FIELD_DELIMITER}${MEMORY_IN_GB}"

echo "CPU Model${FIELD_DELIMITER}$(awk -F: '/model name/{print $2}' /proc/cpuinfo | sed 's/^\s*//')"
echo "Physical CPU quantity${FIELD_DELIMITER}$(awk '/^processor/' /proc/cpuinfo | uniq | wc -l)"
echo "CPU Cores${FIELD_DELIMITER}$(awk '/^core/' /proc/cpuinfo | uniq | wc -l)"
echo "Network Interface${FIELD_DELIMITER}$(ip addr | awk -F '[: ]' '/^[0-9]/{print $3}' | grep -v lo)"
echo "IP Address${FIELD_DELIMITER}$(ip addr | awk -F '[ /]' '/^\s+inet\s/{print $6}' | grep -v -E "^127")"
echo -e "Time Zone${FIELD_DELIMITER}$(timedatectl | grep "Time zone" | sed 's/^\s*//')\n"
