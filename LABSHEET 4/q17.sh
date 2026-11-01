#!/bin/bash

echo "Deleting labuser1 without removing home directory:"

sudo userdel labuser1

echo ""
echo "Checking User Account:"

if getent passwd labuser1; then
    echo "User still exists."
else
    echo "User account deleted successfully."
fi

echo ""
echo "Checking Home Directory:"

if [ -d /home/labuser1 ]; then
    echo "Home directory still exists."
    ls -ld /home/labuser1
else
    echo "Home directory does not exist."
fi