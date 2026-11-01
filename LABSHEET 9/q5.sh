#!/bin/bash

read -p "Enter directory path: " dir

if [ -d "$dir" ]; then
    echo "Size of $dir:"
    du -sh "$dir"
else
    echo "Directory does not exist."
fi