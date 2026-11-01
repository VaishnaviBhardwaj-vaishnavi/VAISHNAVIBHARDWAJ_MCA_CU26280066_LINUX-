#!/bin/bash

echo "Starting HTOP."

if command -v htop >/dev/null 2>&1
then
    htop
else
    echo "HTOP is not installed."
    echo "Install using: sudo apt install htop"
fi