#!/bin/bash

# System Information Script
# This script gathers system information, takes user input, and saves output to a file.

# 1. Variables
CURRENT_DATE=$(date)
SYS_HOSTNAME=$(hostname)
SYS_USER=$(whoami)

# 2. Print basic information
echo "==================================="
echo "    SYSTEM INFORMATION REPORT"
echo "==================================="
echo "Date: $CURRENT_DATE"
echo "Hostname: $SYS_HOSTNAME"
echo "Username: $SYS_USER"
echo "==================================="

# 3. Take user input
read -p "Please enter a name for the output directory: " DIR_NAME
read -p "Please enter a name for the output file: " FILE_NAME

# 4. Create directory and file
echo "Creating directory '$DIR_NAME'..."
mkdir -p "$DIR_NAME"

echo "Creating file '$FILE_NAME' inside '$DIR_NAME'..."
touch "$DIR_NAME/$FILE_NAME"

# 5. Print disk usage
echo "==================================="
echo "           DISK USAGE"
echo "==================================="
df -h
echo ""

# 6. Store running processes information in the file using output redirection
echo "Gathering running processes and saving to $DIR_NAME/$FILE_NAME..."
ps aux > "$DIR_NAME/$FILE_NAME"

echo "Done! You can check the running processes by reading $DIR_NAME/$FILE_NAME."
