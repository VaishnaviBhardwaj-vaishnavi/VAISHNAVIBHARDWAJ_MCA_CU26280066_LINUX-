#!/bin/bash

FILE="/bin/bash"

echo "Finding package that owns: $FILE"

rpm -qf "$FILE"