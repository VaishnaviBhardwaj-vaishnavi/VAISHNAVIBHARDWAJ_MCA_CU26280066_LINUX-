#!/bin/bash

ls unknown_directory 2> logs/errors.log

echo "Error Log:"
cat logs/errors.log