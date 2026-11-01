#!/bin/bash

PACKAGE="nano"

echo "Identifying repository for package: $PACKAGE"

dnf provides "*/nano"

echo ""
echo "Searching package information:"

dnf info "$PACKAGE"