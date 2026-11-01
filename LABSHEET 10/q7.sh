#!/bin/bash

echo "Disk Usage of /mnt/labfs:"
df -h /mnt/labfs

echo
echo "Filesystem Details:"
findmnt /mnt/labfs