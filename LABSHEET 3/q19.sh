#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: ./backup_check.sh <directory>"
    exit 1
fi

directory="$1"

if [ ! -d "$directory" ]; then
    echo "Directory does not exist."
    exit 1
fi

count=0

echo "Searching for backup files in $directory"

for file in "$directory"/*.bak
do
    if [ -f "$file" ]; then
        echo "Backup found: $file"
        count=$((count + 1))
    fi
done

echo "Total backup files: $count"

if [ "$count" -eq 0 ]; then
    echo "No backup files found" >> logs/backup_log.txt
    echo "No backup files found. Message added to log."
fi