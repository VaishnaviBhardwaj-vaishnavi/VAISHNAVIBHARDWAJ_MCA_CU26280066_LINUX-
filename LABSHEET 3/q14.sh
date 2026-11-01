#!/bin/bash

echo "Enter your message:"
read message

echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" >> logs/activity.log

echo "Log entry added successfully."

echo "Activity Log:"
cat logs/activity.log