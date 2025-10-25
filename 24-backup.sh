#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}  # if not provided considered as 14 days   

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)"  | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root previlage"
    exit 1 # failure is other than 0
fi 

USAGE(){
    echo -e " $R USAGE:: sudo sh 24-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS>[optional, default 14 days] $N"
    exit 1
}

#### Check SOURCE_DIR and DSET_DIR passed or not
if [ $# -lt 2 ]; then
    USAGE
fi 

### Check SOURCE_DIR exist or not ####
if [ ! -d $SOURCE_DIR ]; then
    echo -e " Source $SOURCE_DIR does not exist $N"
    exit 1
fi

### Check DEST_DIR exist or not ####
if [ ! -d $DEST_DIR ]; then
    echo -e "Destination $DEST_DIR does not exist $N"
    exit 1
fi

### find the files ####
FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

if [ ! -z "${FILES}" ]; then
     #### Start Archieving #####
    echo "Files Found: $FILES"
    TIMESTAMP=$(date +%F-%H-%M)
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.Zip"
    echo "Zip file name: $ZIP_FILE_NAME"
    find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS | zip -@ -j "$ZIP_FILE_NAME"

     ##### Check Archieval SUCCESS or not #####
    if [ -f $ZIP_FILE_NAME ]
    then
        echo -e "Archieval ... $G SUCCESS $N"
        
        ### Delete if Success ####
        while IFS= read -r filepath 
        do
          echo "deleting the file: $filepath"
          rm -rf $filepath
          echo "deleted the file: $filepath"

        done <<< $FILES
    else 
        echo -e "Archieval ... $R FAILURE $N"
        exit 1
    fi 

else 
    echo -e "No files to archieve...$Y SKIPPING $N"
fi
