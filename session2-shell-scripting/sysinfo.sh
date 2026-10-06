#!/bin/bash


CURRENT_DATE=$(date)
SYS_HOSTNAME=$(hostname)
SYS_USER=$(whoami)

echo "==================================="
echo "    SYSTEM INFORMATION REPORT"
echo "==================================="
echo "Date: $CURRENT_DATE"
echo "Hostname: $SYS_HOSTNAME"
echo "Username: $SYS_USER"
echo "==================================="


read -p "Please enter a name for the output directory: " DIR_NAME
read -p "Please enter a name for the output file: " FILE_NAME


echo "Creating directory '$DIR_NAME'..."
mkdir -p "$DIR_NAME"

echo "Creating file '$FILE_NAME' inside '$DIR_NAME'..."
touch "$DIR_NAME/$FILE_NAME"


echo "==================================="
echo "           DISK USAGE"
echo "==================================="
df -h
echo ""

echo "Gathering running processes and saving to $DIR_NAME/$FILE_NAME..."
ps aux > "$DIR_NAME/$FILE_NAME"

echo "Done! You can check the running processes by reading $DIR_NAME/$FILE_NAME."
