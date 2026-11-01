#!/bin/bash

mkdir -p practice

touch practice/testfile.txt

echo "File permission demonstration:"

chmod 644 practice/testfile.txt

ls -l practice/testfile.txt

echo ""
echo "Directory permission demonstration:"

chmod 750 practice

ls -ld practice

echo ""
echo "Explanation:"
echo "File read (r): Allows reading file contents."
echo "File write (w): Allows modifying file contents."
echo "File execute (x): Allows executing a file as a program."
echo "Directory read (r): Allows listing directory entries."
echo "Directory write (w): Allows creating and deleting entries."
echo "Directory execute (x): Allows accessing and traversing the directory."