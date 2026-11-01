#!/bin/bash

echo "Checking current mount:"
findmnt /mnt/labfs

if mountpoint -q /mnt/labfs; then
    sudo umount /mnt/labfs
    echo "Filesystem unmounted."
fi

echo
echo "Removing lab-specific fstab entry..."

sudo sed -i '/^# LABFS_ENTRY$/,+1d' /etc/fstab

echo
echo "Updated /etc/fstab:"
cat /etc/fstab

echo
echo "Checking mount status:"
if mountpoint -q /mnt/labfs; then
    echo "Filesystem is still mounted."
else
    echo "Filesystem is not mounted."
fi

echo
echo "Lab entry removed."