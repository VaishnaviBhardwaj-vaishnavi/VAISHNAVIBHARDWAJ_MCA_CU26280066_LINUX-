#!/bin/bash

echo "Starting Lab Cleanup..."

echo "Deleting Lab Users:"

for user in labuser1 labuser2 labuser3 labworkflow
do
    if id "$user" &>/dev/null; then
        sudo userdel -r "$user"
        echo "$user deleted successfully."
    else
        echo "$user does not exist."
    fi
done

echo ""
echo "Deleting Lab Groups:"

for group in userlabgroup labprimarygroup labworkflowgroup
do
    if getent group "$group" &>/dev/null; then
        sudo groupdel "$group"
        echo "$group deleted successfully."
    else
        echo "$group does not exist."
    fi
done

echo ""
echo "Verifying Lab Users:"

for user in labuser1 labuser2 labuser3 labworkflow
do
    if id "$user" &>/dev/null; then
        echo "$user still exists."
    else
        echo "$user removed."
    fi
done

echo ""
echo "Verifying Lab Groups:"

for group in userlabgroup labprimarygroup labworkflowgroup
do
    if getent group "$group" &>/dev/null; then
        echo "$group still exists."
    else
        echo "$group removed."
    fi
done

echo ""
echo "Lab Cleanup Completed."
echo "No other system accounts were intentionally modified."