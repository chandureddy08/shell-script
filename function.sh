#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$($0 | cut -d "." -f0)
LOGFILE=/tmp/$SCRIPT_NAME/$TIMESTAMP.log

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 installation..Failure"
        exit 1
    else
        echo "$2 installation..Success"
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