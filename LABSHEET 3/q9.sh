#!/bin/bash

echo "Text files inside data directory:"

found=0

for file in data/*.txt
do
    if [ -f "$file" ]; then
        echo "Found text file: $file"
        found=1
    fi
done

if [ "$found" -eq 0 ]; then
    echo "No text files found."
fi