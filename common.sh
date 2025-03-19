#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

echo "Please enter mysql root password: "
read -s mysql_root_password

check_root(){
    if [ $USERID -ne 0 ]
    then
        echo -e " $R You are not a Super user please run with root access $N"
        exit 1
    else
        echo -e "$B You are Super user $N"
    fi
}
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$1...$R FAILURE$N"
        exit 1
    else
        echo -e "$2...$G SUCCESS$N"
    fi
}