#!/bin/bash

echo "Starting background processes."

sleep 300 &
sleep 400 &

echo ""
echo "Displaying job numbers and PIDs."

jobs -l

echo ""
echo "Background process details."

ps -u "$USER" -o pid,stat,cmd | grep '[s]leep'