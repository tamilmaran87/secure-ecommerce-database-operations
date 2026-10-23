# Secure E-Commerce Database Operations & Cloud Monitoring

## Project Overview
A local e-commerce database operations project that combines
MySQL reporting, Linux system monitoring, Bash automation,
and database backup and recovery testing.

## Technology Stack
- MySQL
- Ubuntu on WSL
- Bash scripting
- Linux service and resource monitoring
- Git

## Database
Database: ecommerce_ops

Tables:
- customers
- products
- orders
- order_items
- payments

## Automation Scripts

### 1. Health Check
File: scripts/health_check.sh

Checks MySQL service status and database connectivity.
Records the results in a timestamped log.

### 2. Sales Report
File: scripts/sales_report.sh

Runs a SQL query to calculate order values for completed
and shipped orders, then saves the report to a text file.

### 3. Database Backup
File: scripts/backup_db.sh

Creates a timestamped SQL backup and checks that the
backup contains table definitions.

## Backup and Recovery Testing
A backup was restored into a separate test database:
ecommerce_restore_test

Verified tables:
- customers: 5 rows
- products: 5 rows
- orders: 6 rows
- order_items: 7 rows
- payments: 6 rows

The original ecommerce_ops database was kept separate.

## Run the Scripts

```bash
./scripts/health_check.sh
./scripts/sales_report.sh
./scripts/backup_db.sh

