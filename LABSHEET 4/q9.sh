#!/bin/bash

sudo usermod -s /bin/bash labuser2

echo "Login shell changed successfully."

echo "Verifying Login Shell:"
getent passwd labuser2 | cut -d: -f7