#!/bin/bash

echo "Changing password of labuser1:"
sudo passwd labuser1

echo "Updated Password Status:"
sudo passwd -S labuser1