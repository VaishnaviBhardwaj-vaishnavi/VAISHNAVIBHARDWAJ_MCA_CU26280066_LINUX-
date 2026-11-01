#!/bin/bash

echo "Starting test process."

sleep 300 &

PID=$!

echo "Process ID: $PID"

echo "Terminating process."

kill "$PID"

sleep 1

echo ""
echo "Verifying process."

if kill -0 "$PID" 2>/dev/null
then
    echo "Process is still running."
else
    echo "Process terminated successfully."
fi