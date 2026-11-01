#!/bin/bash

echo "Setting password for labuser1:"
sudo passwd labuser1

echo "Verifying Password Status:"
sudo passwd -S labuser1