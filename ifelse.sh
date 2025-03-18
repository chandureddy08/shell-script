#!/bin/bash

TODAY=$1

if [$TODAY = SUNDAY];
then
    echo "Today is holiday"

else
    echo "Today is working day"
fi