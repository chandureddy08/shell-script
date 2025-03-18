#!/bin/bash

USERID = $(id -u)

if [ $USERID -eq 0 ]
then
    echo "You are a Super user"
else
    echo "You are not a super user"
fi