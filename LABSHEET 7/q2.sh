#!/bin/bash

echo "All processes running on the system:"

ps -e

echo ""
echo "Detailed process information:"

ps -eo pid,user,comm