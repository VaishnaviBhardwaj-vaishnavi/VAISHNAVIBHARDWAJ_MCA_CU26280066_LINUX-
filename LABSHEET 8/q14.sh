#!/bin/bash

PACKAGE="nano"

echo "Checking installed package: $PACKAGE"

if rpm -q "$PACKAGE" >/dev/null 2>&1
then
    echo "Current installed version:"
    rpm -q "$PACKAGE"

    echo ""
    echo "Updating package:"
    sudo dnf upgrade -y "$PACKAGE"

    echo ""
    echo "Verifying updated version:"
    rpm -q "$PACKAGE"
else
    echo "Package is not installed. Install it first."
fi