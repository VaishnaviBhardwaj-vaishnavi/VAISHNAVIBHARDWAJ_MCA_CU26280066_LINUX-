#!/bin/bash

PACKAGE="bash"

echo "Files installed by package: $PACKAGE"

rpm -ql "$PACKAGE"