#!/bin/bash

echo "Checking /etc/fstab syntax:"
sudo findmnt --verify --verbose

echo
echo "Testing the lab mount:"
sudo mount /mnt/labfs

echo
echo "Mount Verification:"
findmnt /mnt/labfs