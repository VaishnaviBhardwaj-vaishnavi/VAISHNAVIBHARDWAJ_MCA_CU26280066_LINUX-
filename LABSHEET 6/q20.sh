#!/bin/bash

echo "Starting complete permissions and ACL workflow."

# Step 1: Create directory
mkdir -p lab6_workflow

# Step 2: Create file
touch lab6_workflow/workflow.txt

# Step 3: Change permissions using chmod
chmod 640 lab6_workflow/workflow.txt

echo ""
echo "File permissions:"
ls -l lab6_workflow/workflow.txt

# Step 4: Change umask
umask 027

touch lab6_workflow/newfile.txt

echo ""
echo "New file permissions:"
ls -l lab6_workflow/newfile.txt

# Step 5: Create ACL file
touch lab6_workflow/aclfile.txt

# Step 6: Give user ACL permission
if id acluser > /dev/null 2>&1; then
    setfacl -m u:acluser:rw lab6_workflow/aclfile.txt
else
    echo "acluser does not exist. Run Q14 first."
fi

# Step 7: Display ACL
echo ""
echo "ACL details:"
getfacl lab6_workflow/aclfile.txt

# Step 8: Verify directory
echo ""
echo "Directory permissions:"
ls -ld lab6_workflow

# Step 9: Cleanup ACL entries
setfacl -b lab6_workflow/aclfile.txt

echo ""
echo "ACL entries removed."

getfacl lab6_workflow/aclfile.txt

echo ""
echo "Workflow completed successfully."