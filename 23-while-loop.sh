#!/bin/bash

count=5

echo "Countdown starts...."

while [ $count -gt 0 ];
do
    echo "Time left: $count"
    count=$(($count-1))
done

echo "Times up!"