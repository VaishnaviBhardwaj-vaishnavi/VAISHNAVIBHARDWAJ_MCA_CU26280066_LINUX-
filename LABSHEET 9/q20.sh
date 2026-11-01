#!/bin/bash

echo "1. Inspecting disks and partitions:"
lsblk -f

echo
echo "2. Checking disk usage:"
df -h

echo
read -p "Enter an existing formatted test partition (example: /dev/sdb1): " partition

if [ ! -b "$partition" ]; then
    echo "Invalid block device."
    exit 1
fi

echo
echo "3. Checking filesystem:"
sudo blkid "$partition"

read -p "Mount this test partition at /mnt/labdisk? (y/n): " choice

if [ "$choice" != "y" ]; then
    echo "Operation cancelled."
    exit 1
fi

sudo mkdir -p /mnt/labdisk

if mountpoint -q /mnt/labdisk; then
    echo "Mount point is already in use. Unmount it first."
    exit 1
fi

sudo mount "$partition" /mnt/labdisk

if [ $? -ne 0 ]; then
    echo "Mount failed."
    exit 1
fi

echo
echo "4. Verifying mounted filesystem:"
df -h /mnt/labdisk
lsblk -f "$partition"
findmnt /mnt/labdisk

echo
echo "5. Creating a test file:"
echo "Linux Disk Management Lab Test" | sudo tee /mnt/labdisk/lab_test.txt

echo
echo "6. Verifying test file:"
ls -l /mnt/labdisk/lab_test.txt
df -h /mnt/labdisk/lab_test.txt

echo
read -p "Unmount /mnt/labdisk now? Close any programs using it first. (y/n): " unmount_choice

if [ "$unmount_choice" = "y" ]; then
    sudo umount /mnt/labdisk

    if mountpoint -q /mnt/labdisk; then
        echo "Unmount failed. Check for processes using the mount."
    else
        echo "7. Filesystem successfully unmounted."
    fi
else
    echo "Filesystem left mounted. Unmount it manually after the lab."
fi

echo
echo "8. Final storage state:"
lsblk -f
df -h
findmnt /mnt/labdisk || echo "No filesystem mounted at /mnt/labdisk."