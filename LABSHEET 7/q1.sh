#!/bin/bash

echo "Processes of current user:"

ps -u "$USER"

echo ""
echo "PID = Process ID"
echo "TTY = Terminal"
echo "STAT = Process Status"
echo "CMD = Command"