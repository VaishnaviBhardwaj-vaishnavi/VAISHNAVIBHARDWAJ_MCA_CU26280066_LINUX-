#!/bin/bash

echo "Original Names:"
cat data/names.txt

echo "Sorted Names:"
sort < data/names.txt

echo "Sorted Names Without Duplicates:"
sort -u < data/names.txt