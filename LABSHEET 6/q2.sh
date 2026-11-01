#!/bin/bash

echo "Long listing of permissions.txt:"

ls -l lab6/permissions.txt

echo ""
echo "Owner:"
stat -c "%U" lab6/permissions.txt

echo "Group:"
stat -c "%G" lab6/permissions.txt

echo "Permissions:"
stat -c "%A" lab6/permissions.txt