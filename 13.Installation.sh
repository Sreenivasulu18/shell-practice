#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root previlage"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installation MYSQL is FAILURE"
else 
    echo "Installation MYSQL is SUCCESS"
fi