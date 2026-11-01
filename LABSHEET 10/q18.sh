#!/bin/bash

read -p "Enter test partition: " partition

if [ ! -b "$partition" ]; then
    echo "Invalid partition."
    exit 1
fi

uuid=$(sudo blkid -s UUID -o value "$partition")

if [ -z "$uuid" ]; then
    echo "No UUID found."
    exit 1
fi

if findmnt -rn -S "$partition" >/dev/null; then
    echo "Unmount the partition first."
    exit 1
fi

if grep -q "LABFS_ENTRY" /etc/fstab; then
    echo "Remove the previous lab entry first."
    exit 1
fi

sudo cp /etc/fstab "/etc/fstab.backup.$(date +%Y%m%d%H%M%S)"

echo "# LABFS_ENTRY" | sudo tee -a /etc/fstab
echo "UUID=$uuid /mnt/wrongfs ext4 defaults,nofail 0 2" | sudo tee -a /etc/fstab

echo
echo "Incorrect entry added:"
tail -n 2 /etc/fstab

echo
echo "Correcting the mount point..."

sudo sed -i '/^UUID=.* \/mnt\/wrongfs ext4 /s|/mnt/wrongfs|/mnt/labfs|' /etc/fstab

sudo mkdir -p /mnt/labfs

echo
echo "Corrected entry:"
grep -A1 "LABFS_ENTRY" /etc/fstab

echo
echo "Verifying fstab:"
sudo findmnt --verify --verbose

echo
echo "Testing the corrected mount:"
sudo mount /mnt/labfs

findmnt /mnt/labfs