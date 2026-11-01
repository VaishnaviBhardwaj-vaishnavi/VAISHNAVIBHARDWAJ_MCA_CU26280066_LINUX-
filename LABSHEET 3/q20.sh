#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: ./file_report.sh <filename>"
    exit 1
fi

filename="$1"

if [ ! -f "$filename" ]; then
    echo "Error: File does not exist."
    exit 1
fi

if [ ! -r "$filename" ]; then
    echo "Error: File is not readable."
    exit 1
fi

echo "File Report"
echo "----------------------"

echo "Filename: $filename"

echo "Line, Word and Character Counts:"
wc "$filename"

echo "$(date '+%Y-%m-%d %H:%M:%S') - Processed file: $filename" >> logs/execution_history.log

echo "Processing record added successfully."