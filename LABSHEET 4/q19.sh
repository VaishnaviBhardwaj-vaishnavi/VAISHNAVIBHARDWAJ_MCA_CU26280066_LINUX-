#!/bin/bash

echo "STEP 1: Creating User"

sudo useradd -m -s /bin/bash labworkflow

echo "User created successfully."

echo ""
echo "STEP 2: Setting Password"

sudo passwd labworkflow

echo ""
echo "STEP 3: Assigning Login Shell"

sudo usermod -s /bin/bash labworkflow

echo "Login shell assigned."

echo ""
echo "STEP 4: Creating Supplementary Group"

getent group labworkflowgroup || sudo groupadd labworkflowgroup

sudo usermod -aG labworkflowgroup labworkflow

echo "Supplementary group assigned."

echo ""
echo "STEP 5: Locking Account"

sudo usermod -L labworkflow

sudo passwd -S labworkflow

echo ""
echo "STEP 6: Unlocking Account"

sudo usermod -U labworkflow

sudo passwd -S labworkflow

echo ""
echo "STEP 7: Verifying All Settings"

echo "User Details:"
id labworkflow

echo ""
echo "Login Shell:"
getent passwd labworkflow | cut -d: -f7

echo ""
echo "Group Membership:"
groups labworkflow

echo ""
echo "Password Status:"
sudo passwd -S labworkflow

echo ""
echo "Home Directory:"
ls -ld /home/labworkflow

echo ""
echo "User Management Workflow Completed."