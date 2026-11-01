#!/bin/bash

echo "Logged-in Username:"
whoami

echo "User ID and Group ID:"
id

echo "Primary GID:"
id -g

echo "Supplementary Groups:"
id -G