#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "You are not a Super user please run with root access"
    exit 1
else
    echo "You are a super user"
fi

dnf install mysql -y

if [ $? -ne 0 ]
then
    echo "Installation of mysql is.... Failed"
    exit 1
else
    echo "Installation of mysql is.... Success"
fi

dnf install git -y

if [ $? -ne 0 ]
then
    echo "Git installation is failed"
    exit 1
else
    echo "Git is already installed"
fi