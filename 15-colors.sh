#!/bin/bash

#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root previlage"
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "ERROR:: Installation $2 ... $R FAILURE $N"
        exit 1
    else
        echo -e "Installation $2... $G SUCCESS $N"
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]; then
      dnf install mysql -y
      VALIDATE $? "MYSQL"
else 
    echo -e "Mysql is already exists ...$Y SKIPPING $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
      dnf install nginx -y
      VALIDATE $? "NGINX"
else
    echo -e "Nginx is already exists... $Y SKIPPING $N"
fi

dnf list installed python3
if [ $? -ne 0 ]; then
      dnf install python3 -y
      VALIDATE $? "Python3"
else 
    echo -e "Python3 is already exists... $Y SKIPPING $N"
fi