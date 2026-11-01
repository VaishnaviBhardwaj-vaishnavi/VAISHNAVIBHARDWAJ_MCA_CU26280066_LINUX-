#!/bin/bash

echo "Changing home directory without moving contents:"

sudo usermod -d /home/labuser2_new labuser2

echo "Updated Home Directory:"
getent passwd labuser2 | cut -d: -f6

echo ""
echo "Changing home directory with moving contents:"

sudo usermod -d /home/labuser2_final -m labuser2

echo "Final Home Directory:"
getent passwd labuser2 | cut -d: -f6

echo "Verifying Directory:"
ls -ld /home/labuser2_final