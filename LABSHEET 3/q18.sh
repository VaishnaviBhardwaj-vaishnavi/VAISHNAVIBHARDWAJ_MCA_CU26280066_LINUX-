#!/bin/bash

echo "Finding processes containing the word bash:"

ps aux | grep '[b]ash'

echo "Counting matching processes:"

ps aux | grep -c '[b]ash'