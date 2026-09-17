-- Drop existing objects
DROP VIEW IF EXISTS vw_sales_summary;
DROP VIEW IF EXISTS vw_customer_ltv;
DROP TABLE IF EXISTS sales_summary_table;
DROP TABLE IF EXISTS customer_ltv_summary;
GO

-- Materialize Sales Summary
SELECT YEAR(o.order_purchase_timestamp) AS order_year,
       MONTH(o.order_purchase_timestamp) AS order_month,
       COUNT(DISTINCT o.order_id) AS total_orders,
       SUM(oi.price) AS total_revenue,
       AVG(oi.price) AS avg_item_price
INTO sales_summary_table
FROM orders_clean o
JOIN order_items_clean oi ON o.order_id = oi.order_id
GROUP BY YEAR(o.order_purchase_timestamp), MONTH(o.order_purchase_timestamp);
GO

-- Materialize Customer LTV
SELECT c.customer_unique_id,
       COUNT(DISTINCT o.order_id) AS total_orders,
       SUM(oi.price) AS lifetime_value,
       AVG(oi.price) AS avg_order_value
INTO customer_ltv_summary
FROM orders_clean o
JOIN customers_clean c ON o.customer_id = c.customer_id
JOIN order_items_clean oi ON o.order_id = oi.order_id
GROUP BY c.customer_unique_id;
GO

-- Fast View Wrappers for Reporting
CREATE VIEW vw_sales_summary AS SELECT * FROM sales_summary_table;
GO

CREATE VIEW vw_customer_ltv AS SELECT * FROM customer_ltv_summary;
GO


