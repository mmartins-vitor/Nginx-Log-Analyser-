#!/bin/bash

LOG_FILE="nginx-access.log"

echo "Top 5 IPs:"
awk '{print $1}' $LOG_FILE | sort | uniq -c | sort -nr | head -5

echo -e "\nTop 5 paths:"
awk -F\" '{print $2}' $LOG_FILE | awk '{print $2}' | sort | uniq -c | sort -nr | head -5

echo -e "\nTop 5 status codes:"
awk '{print $9}' $LOG_FILE | sort | uniq -c | sort -nr | head -5

echo -e "\nTop 5 user agents:"
awk -F\" '{print $6}' $LOG_FILE | sort | uniq -c | sort -nr | head -5
