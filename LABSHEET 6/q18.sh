#!/bin/bash

echo "Modifying ACL entry."

# Change acluser permission to read only
sudo setfacl -m u:acluser:r-- aclfile.txt

echo ""
echo "Modified ACL:"
getfacl aclfile.txt

echo ""
echo "Removing acluser ACL entry."

sudo setfacl -x u:acluser aclfile.txt

echo ""
echo "Final ACL:"
getfacl aclfile.txt