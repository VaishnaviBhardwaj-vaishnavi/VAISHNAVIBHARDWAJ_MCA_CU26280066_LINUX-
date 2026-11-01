#!/bin/bash

PACKAGE="bash"

echo "Searching for package: $PACKAGE"

rpm -q "$PACKAGE"

if rpm -q "$PACKAGE" >/dev/null 2>&1
then
    echo "Package is installed."
else
    echo "Package is not installed."
fi