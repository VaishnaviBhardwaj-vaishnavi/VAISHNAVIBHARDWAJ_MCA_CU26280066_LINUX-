#!/bin/bash

echo "Restoring previous umask."

umask 0022

echo "Current umask value:"

umask

umask -S