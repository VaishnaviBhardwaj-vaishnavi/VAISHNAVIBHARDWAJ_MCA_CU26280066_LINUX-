#!/bin/bash

echo "Starting a background job."

sleep 300 &

echo "Background job started."
jobs -l

echo ""
echo "Bringing job to foreground."

fg %1

echo "Job terminated."