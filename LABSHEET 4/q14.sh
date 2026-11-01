#!/bin/bash

echo "Setting Account Expiration Date:"

sudo chage -E 2026-12-31 labuser3

echo "Verifying Expiration Information:"

sudo chage -l labuser3