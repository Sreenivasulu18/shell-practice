#!/bin/bash

NUMBER1=10
NUMBER2=90
NUMBER3=DevOps

SUM=$(($NUMBER1 + $NUMBER2 + $NUMBER3))

echo "Sum is: ${SUM}"

LEADERS=("Virat" "Kohli" "Rajat" "Patidar")

echo "All Leaders: ${LEADERS[@]}"
echo "First Leader: ${LEADERS[0]}"
echo "Last Leader: ${LEADERS[10]}"