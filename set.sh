#!/bin/bash

set -e
failure(){
    echo "Failed at: $1: $2"
}
trap 'failure ${LINENO} "$BASH_COMMAND"'ERR

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "You are not a Super user please run with root access"
    exit 1
else
    echo "You are a super user"
fi

dnf install mysql -y

dnf install git -y

dnf install huhbh -y

echo "THE END"