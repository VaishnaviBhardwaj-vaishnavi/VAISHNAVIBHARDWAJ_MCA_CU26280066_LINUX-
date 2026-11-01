#!/bin/bash

echo "Deleting labuser2 with home directory:"

sudo userdel -r labuser2

echo ""
echo "Verifying User Deletion:"

getent passwd labuser2 || echo "User deleted successfully."

echo ""
echo "Verifying Home Directory:"

if [ -d /home/labuser2_final ]; then
    echo "Home directory still exists."
else
    echo "Home directory removed successfully."
fi