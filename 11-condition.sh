#!/bin/bash

NUMBER=$1

if [ $(($NUMBER % 2)) -eq 0 ]; then
    echo "Given number is EVEN"
else 
    echo "Given number is ODD"
fi