#!/bin/bash

echo "Device and Filesystem Information:"
findmnt -T /mnt/labfs -o SOURCE,TARGET,FSTYPE,OPTIONS

echo
echo "Storage Usage:"
df -h /mnt/labfs