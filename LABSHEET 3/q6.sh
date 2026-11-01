#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: ./even_odd.sh <number>"
    exit 1
fi

if ! [[ "$1" =~ ^-?[0-9]+$ ]]; then
    echo "Please enter a valid integer."
    exit 1
fi

if [ $(( $1 % 2 )) -eq 0 ]; then
    echo "$1 is Even."
else
    echo "$1 is Odd."
fi