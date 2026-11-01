#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: ./status.sh <directory>"
    exit 1
fi

if [ -d "$1" ]; then
    echo "Directory exists."
    exit 0
else
    echo "Directory does not exist."
    exit 1
fi