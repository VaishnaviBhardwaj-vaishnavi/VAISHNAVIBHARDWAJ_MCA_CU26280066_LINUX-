#!/bin/bash

echo "Starting multiple test processes."

sleep 300 &
PID1=$!

sleep 400 &
PID2=$!

sleep 500 &
PID3=$!

echo ""
echo "Process IDs:"
echo "Process 1: $PID1"
echo "Process 2: $PID2"
echo "Process 3: $PID3"

echo ""
echo "Displaying process details."

ps -p "$PID1","$PID2","$PID3" -o pid,ppid,stat,cmd

echo ""
echo "Displaying background jobs."

jobs -l

echo ""
echo "Terminating test processes."

kill -TERM "$PID1" "$PID2" "$PID3"

wait "$PID1" "$PID2" "$PID3" 2>/dev/null

echo ""
echo "All test processes cleaned up."