#!/bin/bash

SOURCE_DIRECTORY=/tmp/app-logs

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

if [ -d SOURCE_DIRECTORY ]
then
    echo -e "$G $SOURCE_DIRECTORY is existing$N"
else
    echo -e "$R $SOURCE_DIRECTORY is not existing$N"
    exit 1
fi


