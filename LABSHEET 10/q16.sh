#!/bin/bash

read -p "Enter test partition: " partition

if [ ! -b "$partition" ]; then
    echo "Invalid partition."
    exit 1
fi

if findmnt -rn -S "$partition" >/dev/null; then
    echo "Partition is mounted. Unmount it first."
    exit 1
fi

echo "Running filesystem check..."
sudo e2fsck -f "$partition"

echo
echo "Filesystem check completed."