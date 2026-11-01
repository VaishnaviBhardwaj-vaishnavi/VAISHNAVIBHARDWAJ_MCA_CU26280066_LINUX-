#!/bin/bash

read -p "Enter test partition: " partition

if [ ! -b "$partition" ]; then
    echo "Invalid partition."
    exit 1
fi

echo "Detailed Filesystem Information:"
sudo tune2fs -l "$partition"

echo
echo "UUID Information:"
sudo blkid "$partition"