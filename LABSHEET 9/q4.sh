#!/bin/bash

echo "Directory Sizes:"
du -h --max-depth=1 . 2>/dev/null | sort -h

echo
echo "Largest directories are shown at the bottom."