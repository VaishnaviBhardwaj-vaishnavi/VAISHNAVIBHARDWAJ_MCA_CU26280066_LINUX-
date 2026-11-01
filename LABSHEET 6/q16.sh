#!/bin/bash

echo "Giving acluser read and write permissions."

sudo setfacl -m u:acluser:rw aclfile.txt

echo ""
echo "Verifying ACL:"

getfacl aclfile.txt