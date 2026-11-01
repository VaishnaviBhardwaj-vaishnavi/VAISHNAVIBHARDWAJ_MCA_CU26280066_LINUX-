#!/bin/bash

echo "WARNING: Use only a dedicated EMPTY test disk."
echo "Never select your system disk."

lsblk -o NAME,SIZE,TYPE,MOUNTPOINTS

read -p "Enter dedicated test disk (example: /dev/sdb): " disk

if [ ! -b "$disk" ]; then
    echo "Invalid disk."
    exit 1
fi

read -p "Confirm this is an empty test disk. Type YES to continue: " confirm

if [ "$confirm" != "YES" ]; then
    echo "Operation cancelled."
    exit 1
fi

echo "Opening fdisk for $disk..."
sudo fdisk "$disk"

echo
echo "Updated Partition Information:"
lsblk "$disk"