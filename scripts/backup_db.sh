#!/bin/bash

BACKUP_DIR="$HOME/ecommerce_ops/backups"
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
BACKUP_FILE="$BACKUP_DIR/ecommerce_ops_$TIMESTAMP.sql"

mkdir -p "$BACKUP_DIR"

if sudo mysqldump ecommerce_ops > "$BACKUP_FILE"; then
    if [ -s "$BACKUP_FILE" ] && grep -q "CREATE TABLE" "$BACKUP_FILE"; then
        echo "Backup created and validated:"
        echo "$BACKUP_FILE"
        ls -lh "$BACKUP_FILE"
    else
        echo "Backup file is empty or failed validation."
        exit 1
    fi
else
    echo "Database backup failed."
    rm -f "$BACKUP_FILE"
    exit 1
fi
