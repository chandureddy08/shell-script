#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

echo "Script started executing at: $TIMESTAMP"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 installation..$R Failure $N"
        exit 1
    else
        echo -e "$2 installation..$G Success $N"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "You are not a Super user please run with root access"
    exit 1
else
    echo "You are a super user"
fi

dnf install mysql -y &>>$LOGFILE
VALIDATE $? "Installing mysql"

dnf install git -y &>>$LOGFILE
VALIDATE $? "Installing Git"

dnf install doidhdh -y &>>$LOGFILE
VALIDATE $? "Installing doidhdh"