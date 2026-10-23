#!/bin/bash

LOG_FILE="$HOME/ecommerce_ops/logs/health_check.log"
DATE_TIME=$(date '+%Y-%m-%d %H:%M:%S')

echo "===== Health Check: $DATE_TIME =====" | tee -a "$LOG_FILE"

# Check MySQL service
if sudo service mysql status > /dev/null 2>&1; then
    echo "MySQL service: RUNNING" | tee -a "$LOG_FILE"
else
    echo "MySQL service: NOT RUNNING" | tee -a "$LOG_FILE"
fi

# Check database connectivity
if sudo mysql -N -e "USE ecommerce_ops; SHOW TABLES;" > /dev/null 2>&1; then
    echo "Database connectivity: OK" | tee -a "$LOG_FILE"
else
    echo "Database connectivity: FAILED" | tee -a "$LOG_FILE"
fi

echo "Health check completed."
echo

