#!/bin/bash

PACKAGE="tree"

echo "Checking package installation:"

if rpm -q "$PACKAGE" >/dev/null 2>&1
then
    echo "Package is installed."

    echo ""
    echo "Removing package: $PACKAGE"

    sudo dnf remove -y "$PACKAGE"

    echo ""
    echo "Verifying package removal:"

    if rpm -q "$PACKAGE" >/dev/null 2>&1
    then
        echo "Package is still installed."
    else
        echo "Package removed successfully."
    fi
else
    echo "Package is not installed."
fi