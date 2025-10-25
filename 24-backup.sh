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
    exit 1 # failure is other than 0
fi 

USAGE(){
    echo -e "USAGE:: sudo sh 24-backup.sh <SOURCE_DIR> <DEST_DIR> <PATH_DIR> <DAYS>[optional, default 14 days]"
    exit 1
}

if [ $# -lt 2 ]; then
    USAGE
fi 