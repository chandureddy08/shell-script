#!/bin/bash

echo "Script name is: $0"

echo "All variable are: $@"

echo "Total number of variable are: $#"

echo "Host name is: $HOSTNAME"

echo "Home directory is: $HOME"

echo "Process id of current shell script is: $$"

echo "Process id of last background command is: $!"

echo "Current working directory is: $PWD"

ehco "The script is currently using by: $USER"