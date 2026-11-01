#!/bin/bash

ls data unknown_directory > logs/combined.log 2>&1

echo "Combined Output and Error Log:"
cat logs/combined.log