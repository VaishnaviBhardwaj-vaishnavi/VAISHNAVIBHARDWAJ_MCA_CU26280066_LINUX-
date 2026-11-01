#!/bin/bash

sudo useradd -m labuser2

echo "User labuser2 created successfully."

echo "Home Directory:"
ls -ld /home/labuser2

echo "Ownership:"
stat -c "%U %G %n" /home/labuser2