#!/bin/bash

#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

echo "Please enter DB Password: "
read -s mysql_root_password

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$1 installation is $R...Failure$N"
        exit 1
    else
        echo -e "$1 installation is $G...Success$N"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "You are not a Super user please run with root access"
    exit 1
else
    echo "You are a super user"
fi

dnf install mysql-server -y
VALIDATE $? "mysql is installing"

systemctl enable mysqld
VALIDATE $? "mysql is enabled"

systemctl start mysqld
VALIDATE $? "mysql server is started"

# mysql_secure_installation --set-root-pass ExpenseApp1
# VALIDATE $? "Setting up root password"

mysql -h 172.31.39.216 -uroot -p${mysql_root_password} -e "show databases;" &>> $LOGFILE
if [ $? -ne 0 ]
then
    mysql_secure_installation --set-root-pass ${mysql_root_password} &>>$LOGFILE
    VALIDATE $? "root password setup"
else
    echo "root password was set already$Y...SKIPPING$N"
fi