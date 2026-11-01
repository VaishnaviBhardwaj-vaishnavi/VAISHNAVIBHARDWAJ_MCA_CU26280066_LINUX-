#!/bin/bash

echo "Creating primary group if it does not exist:"

getent group labprimarygroup || sudo groupadd labprimarygroup

echo "Changing Primary Group:"

sudo usermod -g labprimarygroup labuser1

echo "Verifying Primary Group:"

id labuser1

echo "Group Information:"
getent group labprimarygroup