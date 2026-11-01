#!/bin/bash

PACKAGE="tree"

echo "STEP 1: Check RPM version"

rpm --version

echo ""
echo "STEP 2: Check DNF version"

dnf --version

echo ""
echo "STEP 3: Check package installation"

if rpm -q "$PACKAGE" >/dev/null 2>&1
then
    echo "Package is already installed."
else
    echo "Package is not installed."
fi

echo ""
echo "STEP 4: Install package"

sudo dnf install -y "$PACKAGE"

echo ""
echo "STEP 5: Verify installation"

rpm -q "$PACKAGE"

echo ""
echo "STEP 6: Display package information"

dnf info installed "$PACKAGE"

echo ""
echo "STEP 7: Update package"

sudo dnf upgrade -y "$PACKAGE"

echo ""
echo "STEP 8: Verify updated version"

rpm -q "$PACKAGE"

echo ""
echo "STEP 9: Remove test package"

read -p "Remove $PACKAGE now? (yes/no): " choice

if [ "$choice" = "yes" ]; then
    sudo dnf remove -y "$PACKAGE"
    echo "Package removal completed."
else
    echo "Package retained."
fi

echo ""
echo "STEP 10: Final verification"

if rpm -q "$PACKAGE" >/dev/null 2>&1
then
    echo "$PACKAGE is still installed."
else
    echo "$PACKAGE is not installed."
fi

echo ""
echo "RPM and DNF workflow completed."