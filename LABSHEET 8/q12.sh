#!/bin/bash

PACKAGE="tree"

echo "Installing package: $PACKAGE"

sudo dnf install -y "$PACKAGE"

echo ""
echo "Checking installed version using RPM:"

rpm -q "$PACKAGE"

echo ""
echo "Checking installed version using DNF:"

dnf info installed "$PACKAGE"