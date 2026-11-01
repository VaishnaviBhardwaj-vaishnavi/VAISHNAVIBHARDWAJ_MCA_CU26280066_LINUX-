#!/bin/bash

read -p "Enter test partition (example: /dev/sdb1): " partition

if [ ! -b "$partition" ]; then
    echo "Invalid partition."
    exit 1
fi

echo "Filesystem Information:"
sudo blkid "$partition"

echo
echo "Mount Information:"
lsblk -f "$partition"