#!/bin/bash

umask 027

echo "New umask value:"
umask

touch umaskfile.txt

mkdir -p umaskdir

echo ""
echo "File permissions:"
ls -l umaskfile.txt

echo ""
echo "Directory permissions:"
ls -ld umaskdir