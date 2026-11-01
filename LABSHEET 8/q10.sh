#!/bin/bash

PACKAGE="nano"

echo "Searching repositories for package: $PACKAGE"

dnf search "$PACKAGE"