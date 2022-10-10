#! /bin/bash

read -p "Please input user name to archive: " USER

id $USER
if [ $? -ne 0 ]; then
    exit 1
fi

# echo "Executing archiving tool: $0"
echo "Locking password of user $USER"

passwd -l $USER &> /dev/null

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
