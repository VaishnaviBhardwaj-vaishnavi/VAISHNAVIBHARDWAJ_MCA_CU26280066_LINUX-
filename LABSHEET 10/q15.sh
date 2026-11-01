#!/bin/bash

read -p "Enter test partition (example: /dev/sdb1): " partition

if [ ! -b "$partition" ]; then
    echo "Invalid partition."
    exit 1
fi

uuid=$(sudo blkid -s UUID -o value "$partition")

echo "Actual Filesystem UUID:"
echo "$uuid"

echo
echo "UUID Entry in /etc/fstab:"
grep -F "$uuid" /etc/fstab

if grep -Fq "UUID=$uuid /mnt/labfs " /etc/fstab; then
    echo
    echo "UUID matches the /etc/fstab entry."
else
    echo
    echo "Matching /etc/fstab entry not found."
fi