#!/bin/bash

NUMBER=$1

if [$NUMBER -eq 10]
then
    echo "$NUMBER is equal to 10"
        if [$NUMBER -gt 10]
        then
            echo "$NUMBER is greate than 10"
else
    echo "$NUMBER is less than 10"
fi