#!/bin/bash

echo "Configured DNF repositories:"

dnf repolist --all

echo ""
echo "Enabled repositories:"

dnf repolist --enabled