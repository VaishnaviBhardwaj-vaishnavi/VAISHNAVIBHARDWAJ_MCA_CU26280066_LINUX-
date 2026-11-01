#!/bin/bash

current_date=$(date)
current_directory=$(pwd)
username=$(whoami)

echo "System Information"
echo "----------------------"

echo "Current Date: $current_date"
echo "Current Directory: $current_directory"
echo "Logged-in Username: $username"