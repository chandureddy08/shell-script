#!/bin/bash

source ./common.sh

dnf module disable nodejs -y &>>$LOGFILE
VALIDATE $? "Disabling Node Js"

dnf module enable nodejs:20 -y &>>$LOGFILE
VALIDATE $? "Enabling Node Js 20"

dnf install nodejs -y &>>$LOGFILE
VALIDATE $? "Installing Node Js"

id expense
if [ $? -ne 0 ]
then
    useradd expense &>>$LOGFILE
    VALIDATE $? "Adding user expense"
else
    echo -e "$B User is Already exists $N"
fi

mkdir -p /app &>>$LOGFILE
VALIDATE $? "Creating APP Directory"

curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip &>>$LOGFILE
VALIDATE $? "Downloading the backend code"

cd /app
rm -rf /app/*
unzip /tmp/backend.zip &>>$LOGFILE
VALIDATE $? "Extracting the backend code"

npm install &>>$LOGFILE
VALIDATE $? "Installing Node Js Dependencies"

cp /home/ec2-user/shell-script/backend.service /etc/systemd/system/backend.service &>>$LOGFILE
VALIDATE $? "Copying the Backend Service"

systemctl daemon-reload &>>$LOGFILE
VALIDATE $? "Reloading Deamon"

systemctl start backend &>>$LOGFILE
VALIDATE $? "Starting Backend"

systemctl enable backend &>>$LOGFILE
VALIDATE $? "Enabling Backend"

dnf install mysql -y &>>$LOGFILE
VALIDATE $? "Installing mysql Client"

mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -p${mysql_root_password} < /app/schema/backend.sql &>>$LOGFILE
VALIDATE $? "Loading Schema"

systemctl restart backend &>>$LOGFILE
VALIDATE $? "Restarting the Backend"