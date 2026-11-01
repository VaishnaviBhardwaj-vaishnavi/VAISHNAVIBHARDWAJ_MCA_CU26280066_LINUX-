#!/bin/bash

sudo groupadd userlabgroup

sudo usermod -aG userlabgroup labuser1

echo "User added to supplementary group."

echo "Verifying Group Membership:"
groups labuser1

echo "Group Details:"
getent group userlabgroup