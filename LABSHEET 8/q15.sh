#!/bin/bash

echo "Checking available updates:"

sudo dnf check-update
STATUS=$?

if [ "$STATUS" -eq 100 ]; then
    echo ""
    echo "Updates are available."
elif [ "$STATUS" -eq 0 ]; then
    echo "No updates are available."
else
    echo "Unable to check updates. Check your repositories."
    exit 1
fi

echo ""
read -p "Do you want to update all packages? (yes/no): " choice

if [ "$choice" = "yes" ]; then
    sudo dnf upgrade -y

    echo ""
    echo "Package update completed."
    sudo dnf check-update
else
    echo "System update cancelled."
fi