#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: ./multiplication.sh <number>"
    exit 1
fi

num=$1

for i in {1..10}
do
    echo "$num x $i = $((num * i))"
done