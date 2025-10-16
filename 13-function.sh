#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root previlage"
fi

VALIDATE(){
    if [ $? -ne 0 ]; then
        echo "ERROR:: Installation $1 is FAILURE"
        exit 1
    else
        echo "Installation $1 is SUCCESS"
    fi
}

dnf install mysql -y
VALIDATE $? "MYSQL"

dnf install nginx -y
VALIDATE $? "NGINX"

dnf install python3 -y
VALIDATE $? "Python3"