#!/bin/bash

COURSE="DevOps from current Script"

echo "Before Calling other script, course: $COURSE"
echo "Process ID of Current shell-script: $$"

./other.sh

echo "After Calling other script, course: $COURSE"
echo "Process ID after calling other shell-script: $$"