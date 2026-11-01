#!/bin/bash

echo "User Information using id:"
id labuser1

echo ""
echo "Group Information using groups:"
groups labuser1

echo ""
echo "User Account using getent:"
getent passwd labuser1

echo ""
echo "Group Account using getent:"
getent group userlabgroup