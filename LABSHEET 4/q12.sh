#!/bin/bash

echo "Locking labuser3:"
sudo usermod -L labuser3

echo "Verifying Locked Account:"
sudo passwd -S labuser3

echo ""
echo "Unlocking labuser3:"
sudo usermod -U labuser3

echo "Verifying Unlocked Account:"
sudo passwd -S labuser3