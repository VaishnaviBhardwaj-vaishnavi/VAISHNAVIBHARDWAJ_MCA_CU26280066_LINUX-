#!/bin/bash

echo "Displaying DNF transaction history:"

sudo dnf history

echo ""
echo "Displaying recent transaction details:"

sudo dnf history info last