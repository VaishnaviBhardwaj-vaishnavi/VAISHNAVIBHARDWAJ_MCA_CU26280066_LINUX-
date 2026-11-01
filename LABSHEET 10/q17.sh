#!/bin/bash

read -p "Enter test partition: " partition

if [ ! -b "$partition" ]; then
    echo "Invalid partition."
    exit 1
fi

echo "1. Checking mounted status:"

if findmnt -rn -S "$partition" >/dev/null; then
    echo "Partition is mounted."
    findmnt -S "$partition"
    df -h "$partition"

    echo
    echo "Unmounting before filesystem check..."
    sudo umount "$partition"
else
    echo "Partition is already unmounted."
fi

if findmnt -rn -S "$partition" >/dev/null; then
    echo "Unmount failed. Close programs using the filesystem."
    exit 1
fi

echo
echo "2. Checking unmounted filesystem:"
sudo e2fsck -fn "$partition"

echo
echo "Read-only filesystem check completed."