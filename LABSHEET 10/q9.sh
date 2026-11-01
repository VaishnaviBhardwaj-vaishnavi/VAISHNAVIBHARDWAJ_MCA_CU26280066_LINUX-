#!/bin/bash

if mountpoint -q /mnt/labfs; then
    sudo umount /mnt/labfs
    echo "Filesystem unmounted."
else
    echo "Filesystem is not mounted."
fi

echo
if mountpoint -q /mnt/labfs; then
    echo "Mount point is still active."
else
    echo "/mnt/labfs is no longer an active mount point."
fi