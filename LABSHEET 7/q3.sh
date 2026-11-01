#!/bin/bash

echo "Detailed process listing:"

ps aux

echo ""
echo "CPU Usage and Memory Usage:"

ps aux | head -10

echo ""
echo "%CPU = CPU usage"
echo "%MEM = Memory usage"
echo "PID = Process ID"
echo "USER = Process owner"