#!/bin/bash

read -p "Enter test partition (example: /dev/sdb1): " device

if [ ! -b "$device" ]; then
    echo "Invalid block device."
    exit 1
fi

sudo mkdir -p /mnt/labdisk
sudo mount "$device" /mnt/labdisk

echo
echo "Mount Information:"
findmnt /mnt/labdisk