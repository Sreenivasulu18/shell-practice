#!/bin/bash

# everything in shell is considered as string
NUMBER1=100
NUMBER2=300
NUMBER3=DevOps

SUM=$(($NUMBER1 + $NUMBER2 + $NUMBER3))

echo "Sum is: ${SUM}"

LEADERS=("Viart" "Patidar" "Bhuvi" "Krunal")

echo "All leaders: ${LEADERS[@]}"

echo "First Leader: ${LEADERS[0]}"

echo "First Leader: ${LEADERS[10]}"