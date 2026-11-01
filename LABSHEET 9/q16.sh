#!/bin/bash

read -p "Enter disk name (example: /dev/sda): " disk

if [ ! -b "$disk" ]; then
    echo "Invalid disk."
    exit 1
fi

echo "Partition Table:"
sudo fdisk -l "$disk"

echo
echo "Partition Details:"
lsblk "$disk"