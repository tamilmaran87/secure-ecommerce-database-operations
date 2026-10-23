#!/bin/bash

REPORT_FILE="$HOME/ecommerce_ops/logs/sales_report.txt"

echo "E-Commerce Sales Report" > "$REPORT_FILE"
echo "Generated: $(date '+%Y-%m-%d %H:%M:%S')" >> "$REPORT_FILE"
echo "================================" >> "$REPORT_FILE"

sudo mysql -t ecommerce_ops -e "
SELECT
    o.order_id,
    c.customer_name,
    o.status,
    SUM(oi.quantity * oi.unit_price) AS order_value
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.status IN ('Completed', 'Shipped')
GROUP BY o.order_id, c.customer_name, o.status
ORDER BY order_value DESC;
" >> "$REPORT_FILE" 2>&1

if [ $? -eq 0 ]; then
    echo "Report generated successfully: $REPORT_FILE"
else
    echo "Report generation failed. Check: $REPORT_FILE"
fi
