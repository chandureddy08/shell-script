#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
B="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo "You are not a Super user please run with root access"
    exit 1
else
    echo "You are a super user"
fi

for i in $@
do
    echo "Package to install: $i"
done