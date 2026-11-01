#!/bin/bash

read -p "Enter test partition (example: /dev/sdb1): " partition

if [ ! -b "$partition" ]; then
    echo "Invalid partition."
    exit 1
fi

if findmnt -rn -S "$partition" >/dev/null; then
    echo "Unmount the partition before continuing."
    exit 1
fi

uuid=$(sudo blkid -s UUID -o value "$partition")

if [ -z "$uuid" ]; then
    echo "No filesystem UUID found. Create a filesystem first."
    exit 1
fi

sudo mkdir -p /mnt/labfs

if grep -q "LABFS_ENTRY" /etc/fstab; then
    echo "A lab entry already exists in /etc/fstab."
    exit 1
fi

sudo cp /etc/fstab "/etc/fstab.backup.$(date +%Y%m%d%H%M%S)"

echo "# LABFS_ENTRY" | sudo tee -a /etc/fstab
echo "UUID=$uuid /mnt/labfs ext4 defaults,nofail 0 2" | sudo tee -a /etc/fstab

echo
echo "Lab entry added:"
tail -n 2 /etc/fstab