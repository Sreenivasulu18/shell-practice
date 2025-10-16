#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root previlage"
    exit 1 # here exit is other than 0
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installation MYSQL is FAILURE"
    exit 1
else 
    echo "Installation MYSQL is SUCCESS"
fi