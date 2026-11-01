#!/bin/bash

echo "Creating and editing lab5.txt"

vi lab5.txt

STEP 1: Create or open file
vi lab5.txt

STEP 2: Insert text
Press i
Type:
Welcome to Linux.
Learning vi editor.
This is Linux Lab 5.
Vim is useful for editing.
Thank you.

STEP 3: Save file
Press Esc
:w
Press Enter

STEP 4: Search text
/linux
Press Enter

STEP 5: Replace text
:%s/Linux/UNIX/g
Press Enter

STEP 6: Copy and paste
yy
p

STEP 7: Undo and redo
u
Ctrl+r

STEP 8: Display line numbers
:set number

STEP 9: Save and exit
:wq