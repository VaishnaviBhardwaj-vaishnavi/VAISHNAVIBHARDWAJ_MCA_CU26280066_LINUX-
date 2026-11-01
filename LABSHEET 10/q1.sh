#!/bin/bash

echo "Available Block Devices:"
lsblk -o NAME,SIZE,TYPE,FSTYPE,MOUNTPOINTS

echo
echo "Identify a dedicated test partition from the list."