#!/bin/bash

read -p "Enter test partition: " partition

if [ ! -b "$partition" ]; then
    echo "Invalid partition."
    exit 1
fi

sudo mkdir -p /mnt/labfs

if mountpoint -q /mnt/labfs; then
    echo "/mnt/labfs is already mounted."
    exit 1
fi

sudo mount -t ext4 "$partition" /mnt/labfs

echo
echo "Mount Verification:"
findmnt /mnt/labfs