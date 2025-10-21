#!/bin/bash

set -e # e means exit 

# error(){
#      echo "There is an error in $LINENO, Command is: $BASH_COMMAND"
# }
trap 'echo "There is an error in $LINENO, Command is: $BASH_COMMAND"' ERR

echo "Hello..."
echo "Before error..."
iuwhtljef   # here shell understands there ia an error and signal is ERR
echo "After error"