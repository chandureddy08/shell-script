#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 installation..Failure"
        exit 1
    else
        echo "$2 installation..Success"
}

if [ $USERID -ne 0 ]
then
    echo "You are not a Super user please run with root access"
    exit 1
else
    echo "You are a super user"
fi

dnf install mysql -y
VALIDATE $? "Installing mysql"

dnf install git -y

VALIDATE $? "Installing Git"