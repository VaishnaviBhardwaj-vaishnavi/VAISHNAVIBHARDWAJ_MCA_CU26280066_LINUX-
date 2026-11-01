#!/bin/bash

lsblk -f

read -p "Enter practice partition (example: /dev/sdb1): " partition

if [ ! -b "$partition" ]; then
    echo "Invalid partition."
    exit 1
fi

read -p "Formatting will erase data. Type FORMAT to continue: " confirm

if [ "$confirm" != "FORMAT" ]; then
    echo "Operation cancelled."
    exit 1
fi

sudo mkfs.ext4 "$partition"

sudo mkdir -p /mnt/labdisk
sudo mount "$partition" /mnt/labdisk

echo
echo "Filesystem Details:"
df -h /mnt/labdisk

echo
echo "Block Device Details:"
lsblk -f "$partition"

echo
echo "Mount Information:"
findmnt /mnt/labdisk