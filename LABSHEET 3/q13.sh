#!/bin/bash

echo "First: Overwriting the file using >"
ls data > output/files.txt

cat output/files.txt

echo "Second: Appending to the file using >>"
ls data >> output/files.txt

echo "Final file contents:"
cat output/files.txt