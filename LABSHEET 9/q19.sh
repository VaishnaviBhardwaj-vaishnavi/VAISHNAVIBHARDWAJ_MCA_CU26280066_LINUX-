#!/bin/bash

echo "Before Unmounting:"
findmnt /mnt/labdisk

if mountpoint -q /mnt/labdisk; then
    sudo umount /mnt/labdisk
    echo
    echo "Filesystem unmounted."
else
    echo "Filesystem is already unmounted."
fi

echo
echo "Mount Point Status:"
if mountpoint -q /mnt/labdisk; then
    echo "Still mounted."
else
    echo "Not mounted."
fi

echo
echo "Mount Point Directory:"
ls -ld /mnt/labdisk

echo
echo "Block Device Information:"
lsblk -f