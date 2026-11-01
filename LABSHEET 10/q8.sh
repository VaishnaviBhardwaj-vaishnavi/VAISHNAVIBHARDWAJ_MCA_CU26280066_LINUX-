#!/bin/bash

if ! mountpoint -q /mnt/labfs; then
    echo "/mnt/labfs is not mounted."
    exit 1
fi

echo "Linux File System Lab Test" | sudo tee /mnt/labfs/testfile.txt

echo
echo "Test File Details:"
ls -l /mnt/labfs/testfile.txt

echo
echo "Filesystem Containing the File:"
df -h /mnt/labfs/testfile.txt