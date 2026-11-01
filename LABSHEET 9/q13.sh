#!/bin/bash

if ! mountpoint -q /mnt/labdisk; then
    echo "/mnt/labdisk is not mounted."
    exit 1
fi

echo "This is a Linux storage lab test file." | sudo tee /mnt/labdisk/testfile.txt

echo
echo "File Details:"
ls -l /mnt/labdisk/testfile.txt

echo
echo "Filesystem Containing the File:"
df -h /mnt/labdisk/testfile.txt