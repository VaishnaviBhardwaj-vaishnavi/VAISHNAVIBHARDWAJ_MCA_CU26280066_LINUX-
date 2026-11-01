#!/bin/bash

sudo useradd labuser1

echo "User labuser1 created successfully."

echo "Verifying User:"
id labuser1

echo "Account Entry:"
getent passwd labuser1