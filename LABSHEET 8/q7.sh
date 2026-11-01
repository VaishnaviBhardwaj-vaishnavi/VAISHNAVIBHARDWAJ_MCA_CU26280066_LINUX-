#!/bin/bash

PACKAGE="bash"

echo "Package installation information:"

rpm -qi "$PACKAGE"

echo ""
echo "Installation Date:"

rpm -q --last "$PACKAGE"