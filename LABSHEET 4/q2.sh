#!/bin/bash

echo "Account Entry of labuser1:"
grep "^labuser1:" /etc/passwd

echo ""
echo "Fields in /etc/passwd:"
echo "1. Username"
echo "2. Password placeholder (x)"
echo "3. User ID (UID)"
echo "4. Primary Group ID (GID)"
echo "5. User Information (GECOS)"
echo "6. Home Directory"
echo "7. Login Shell"

echo ""
echo "Displaying individual fields:"
getent passwd labuser1