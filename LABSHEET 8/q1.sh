#!/bin/bash

echo "Checking RPM command availability:"

if command -v rpm >/dev/null 2>&1
then
    echo "RPM command is available."
    echo ""
    echo "Installed RPM version:"
    rpm --version
else
    echo "RPM command is not installed."
fi