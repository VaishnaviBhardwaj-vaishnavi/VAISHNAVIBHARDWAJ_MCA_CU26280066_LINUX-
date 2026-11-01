#!/bin/bash

sudo useradd -m -s /bin/bash labuser3

echo "User labuser3 created successfully."

echo "Assigned Login Shell:"
getent passwd labuser3 | cut -d: -f7