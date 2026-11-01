#!/bin/bash

echo "Giving aclgroup read permission."

sudo setfacl -m g:aclgroup:r aclfile.txt

echo ""
echo "Verifying ACL:"

getfacl aclfile.txt