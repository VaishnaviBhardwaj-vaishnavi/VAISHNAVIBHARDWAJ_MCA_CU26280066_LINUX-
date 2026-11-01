#!/bin/bash

echo "Processes sorted by CPU usage:"

ps aux --sort=-%cpu | head -10

echo ""
echo "Processes sorted by memory usage:"

ps aux --sort=-%mem | head -10

echo ""
echo "Record the PID of a process with high usage."