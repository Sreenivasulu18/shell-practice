#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"


mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)"  | tee -a $LOG_FILE
if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root previlage"
fi 

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "Installation $2 ... $R FAILURE $N"  | tee -a $LOG_FILE
        exit 1
    else
        echo -e "Installation $2... $G SUCCESS $N"  | tee -a $LOG_FILE
    fi
}

#$@

for package in $@
do 
   echo "package is: $package"
done