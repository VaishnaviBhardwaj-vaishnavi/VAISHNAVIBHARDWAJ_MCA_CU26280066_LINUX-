#!/bin/bash

echo "Mounting filesystems listed in /etc/fstab:"
sudo mount -a

echo
echo "Checking /mnt/labfs:"
findmnt /mnt/labfs

if mountpoint -q /mnt/labfs; then
    echo "Filesystem automatically mounted using /etc/fstab."
else
    echo "Filesystem is not mounted. Check the fstab entry."
fi