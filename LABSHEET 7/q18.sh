#!/bin/bash

echo "Starting test process."

bash -c 'exec -a labtest18 sleep 300' &

sleep 1

echo "Finding test process."

pgrep -af '^labtest18'

echo ""
echo "Terminating process using pkill."

pkill -f '^labtest18'

sleep 1

echo ""
echo "Verifying process termination."

if pgrep -f '^labtest18' >/dev/null
then
    echo "Process is still running."
else
    echo "Process terminated successfully."
fi