#!/bin/bash

echo "Creating ACL directory."

mkdir -p acldirectory

echo ""
echo "Setting default ACL."

sudo setfacl -m d:u:acluser:rw,d:g:aclgroup:r,d:o::--- acldirectory

echo ""
echo "Creating a test file."

touch acldirectory/testfile.txt

echo ""
echo "Directory Default ACL:"
getfacl acldirectory

echo ""
echo "Inherited ACL of new file:"
getfacl acldirectory/testfile.txt