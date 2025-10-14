#!/bin/bash

echo "All variables passed to the script: $@"
echo "All variable passed to the script: $*"
echo "Script name: $0"
echo "current directory: $PWD"
echo "Who is running this: $USER"
echo "Home directory of this: $HOME"
echo "PID of this script: $$"
sleep 50 &
echo "PID of the last command in background is: $!"