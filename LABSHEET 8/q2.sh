#!/bin/bash

echo "Checking DNF command availability:"

if command -v dnf >/dev/null 2>&1
then
    echo "DNF command is available."
    echo ""
    echo "Installed DNF version:"
    dnf --version
else
    echo "DNF command is not installed."
fi