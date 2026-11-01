#!/bin/bash

echo "Starting a background job."

sleep 300 &

echo "Stopping the job."

kill -STOP $!

echo "Resuming the job in background."

kill -CONT $!

echo "Checking process status."

ps -o pid,stat,cmd -p $!