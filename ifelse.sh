#!/bin/bash

NUMBER=$1

if ["$NUMBER" -eq 10]; then
    echo "$NUMBER is equal to 10"
elif ["$NUMBER" -lt 10]; then
    echo "$NUMBER is less than 10"
else
    echo "$NUMBER is greater than 10"
fi