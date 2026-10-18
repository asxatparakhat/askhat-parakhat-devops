#!/bin/bash
echo "=============================="
echo "Student Information"
echo "=============================="
echo "Name: Parakhat"
echo "Surname: Askhat"
echo "Group: IT2-2301"
echo "Student ID: 41534"
echo "=============================="
echo "System Information"
echo "=============================="
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date)"
echo "Operating System: $(uname -sr)"
echo "Disk Usage:"
df -h /
echo "Memory Usage:"
free -h

INFO_FILE="$(dirname "$0")/../Askhat_Parakhat_info.txt"
if [ -f "$INFO_FILE" ]; then
    echo "Student information file exists."
else
    echo "Student information file does not exist."
fi
