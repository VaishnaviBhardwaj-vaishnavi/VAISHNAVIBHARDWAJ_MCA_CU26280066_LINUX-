#!/bin/bash

if mountpoint -q /mnt/labdisk; then
    sudo umount /mnt/labdisk
    echo "Filesystem unmounted."
else
    echo "Filesystem is not mounted."
fi

echo
findmnt /mnt/labdisk || echo "No filesystem mounted at /mnt/labdisk."