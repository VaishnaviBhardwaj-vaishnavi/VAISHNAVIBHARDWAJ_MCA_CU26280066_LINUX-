#!/bin/bash

PACKAGE="nano"

echo "Installing package: $PACKAGE"

sudo dnf install -y "$PACKAGE"

echo ""
echo "Verifying installation:"

rpm -q "$PACKAGE"

echo ""
dnf info installed "$PACKAGE"