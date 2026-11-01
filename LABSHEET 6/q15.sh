#!/bin/bash

echo "Displaying ACL of aclfile.txt"

getfacl aclfile.txt

echo ""
echo "ACL information includes:"
echo "1. File owner"
echo "2. File group"
echo "3. User permissions"
echo "4. Group permissions"
echo "5. Mask permissions"
echo "6. Other permissions"