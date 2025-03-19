DISK_USAGE=$(df -hT | grep efx )
DISK_THRESHOLD=2


while IFS= read -r line
do
    USAGE=$( echo $line | awk -F " " '{print $6}' | cut -d "%" -f1 )
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        echo "$FOLDER more than $DISK_THRESHOLD, current usage is $USAGE"
    else
        echo "Disk usage is $USAGE and Good"
    fi
done <<<$DISK_USAGE