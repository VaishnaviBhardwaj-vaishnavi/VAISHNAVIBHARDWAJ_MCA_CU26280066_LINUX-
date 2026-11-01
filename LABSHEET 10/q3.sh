#!/bin/bash

lsblk -f

read -p "Enter dedicated test partition: " partition

if [ ! -b "$partition" ]; then
    echo "Invalid partition."
    exit 1
fi

echo "Selected partition:"
lsblk -f "$partition"

read -p "This will erase data. Type FORMAT to continue: " confirm

if [ "$confirm" != "FORMAT" ]; then
    echo "Operation cancelled."
    exit 1
fi

if findmnt -rn -S "$partition" >/dev/null; then
    echo "Partition is mounted. Unmount it before formatting."
    exit 1
fi

sudo mkfs.ext4 "$partition"

echo
echo "Filesystem Verification:"
sudo blkid "$partition"