#!/bin/bash

echo "Checking processes using /mnt/labdisk:"
sudo fuser -vm /mnt/labdisk

echo
echo "Close terminals or programs using this directory."
echo "Do not kill processes blindly."

read -p "Try unmounting now? (y/n): " choice

if [ "$choice" = "y" ]; then
    sudo umount /mnt/labdisk

    if mountpoint -q /mnt/labdisk; then
        echo "Unmount failed. Check which process is still using it."
    else
        echo "Unmount successful."
    fi
else
    echo "Unmount cancelled."
fi