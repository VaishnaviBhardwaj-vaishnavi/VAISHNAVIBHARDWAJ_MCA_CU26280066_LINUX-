#!/bin/bash

echo "===== RPM AND DNF LAB CLEANUP ====="

echo ""
echo "STEP 1: Display installed test packages"

for PACKAGE in nano tree
do
    if rpm -q "$PACKAGE" >/dev/null 2>&1
    then
        echo "$PACKAGE is installed."
    else
        echo "$PACKAGE is not installed."
    fi
done

echo ""
echo "STEP 2: Remove test packages if required"

read -p "Do you want to remove nano and tree? (yes/no): " choice

if [ "$choice" = "yes" ]; then

    for PACKAGE in nano tree
    do
        if rpm -q "$PACKAGE" >/dev/null 2>&1
        then
            echo "Removing $PACKAGE..."
            sudo dnf remove "$PACKAGE"
        else
            echo "$PACKAGE is not installed."
        fi
    done

else
    echo "Packages were not removed."
fi

echo ""
echo "STEP 3: Verify package status"

rpm -q nano
rpm -q tree

echo ""
echo "STEP 4: Verify repository configuration"

dnf repolist --all

echo ""
echo "STEP 5: Display DNF history"

sudo dnf history

echo ""
echo "STEP 6: Final verification"

echo "RPM version:"
rpm --version

echo ""
echo "DNF version:"
dnf --version

echo ""
echo "Lab cleanup verification completed."
echo "No repository configuration was intentionally changed."