#! /bin/bash
# Author: Sean
# Date: 10/10/2022

echo "Executing archiving tool: $0"
echo "Locking password of user $1"

passwd -l $1 &> /dev/null

ARCHIVE_DIR="/tmp/archive/"

if [ ! -d $ARCHIVE_DIR ]; then
    echo "No directory $ARCHIVE_DIR, creating it..."
    mkdir $ARCHIVE_DIR
fi

# User -P to disable information output to screen from tar.
cd $ARCHIVE_DIR && tar czf ${1}.tar.gz -P /home/${1}

# User -e to enable "\n" to create new line.
echo -e "Done!\n"
# printf "Done!\n"
