#!/bin/bash

echo "Creating ACL practice user and group."

# Create group if it does not exist
if ! getent group aclgroup > /dev/null; then
    sudo groupadd aclgroup
fi

# Create user if it does not exist
if ! id acluser > /dev/null 2>&1; then
    sudo useradd -m acluser
fi

# Add user to supplementary group
sudo usermod -aG aclgroup acluser

# Create ACL testing file
touch aclfile.txt

echo "User and group created successfully."

echo "User Details:"
id acluser

echo ""
echo "Group Details:"
getent group aclgroup

echo ""
echo "ACL Testing File:"
ls -l aclfile.txt