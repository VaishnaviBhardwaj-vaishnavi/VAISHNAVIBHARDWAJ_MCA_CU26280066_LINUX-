#!/bin/bash

echo "Starting test process."

sleep 300 &

PID=$!

echo "Process ID: $PID"

echo "Sending SIGKILL signal."

kill -KILL "$PID"

wait "$PID" 2>/dev/null

echo ""
echo "Verifying process."

if kill -0 "$PID" 2>/dev/null
then
    echo "Process is still running."
else
    echo "Process killed successfully."
fi