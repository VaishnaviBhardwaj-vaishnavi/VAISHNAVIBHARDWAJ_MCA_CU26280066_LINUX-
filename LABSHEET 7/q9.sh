#!/bin/bash

echo "Starting background process."

sleep 300 &

echo "Background process started."

echo "PID: $!"

echo "Job information:"

jobs -l