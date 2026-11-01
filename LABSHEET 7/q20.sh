#!/bin/bash

echo "===== PROCESS MANAGEMENT WORKFLOW ====="

echo ""
echo "STEP 1: Inspect current processes"

ps -u "$USER"

echo ""
echo "STEP 2: Start a foreground job"

echo "Starting sleep process for 300 seconds."

sleep 300

echo ""
echo "STEP 3: Start a background job"

sleep 400 &

PID=$!

echo "Background Process PID: $PID"

jobs -l

echo ""
echo "STEP 4: Suspend and resume demonstration"

echo "Use Ctrl+Z while a foreground sleep command is running."
echo "Then use bg to resume the stopped job."

echo ""
echo "STEP 5: Terminate background process"

kill -TERM "$PID"

wait "$PID" 2>/dev/null

echo "Background process terminated."

echo ""
echo "STEP 6: Verify process status"

if kill -0 "$PID" 2>/dev/null
then
    echo "Process is still running."
else
    echo "Process has ended."
fi

echo ""
echo "STEP 7: Display remaining processes"

ps -u "$USER"

echo ""
echo "Process management workflow completed."