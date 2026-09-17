TRUNCATE TABLE customers;
BULK INSERT customers
FROM 'E:\Project\powerBI_sql\E-Commerce-Sales-Customer-Analytics-SQL-Power-BI\data\olist_customers_dataset.csv'
WITH (FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

TRUNCATE TABLE orders;
BULK INSERT orders
FROM 'E:\Project\powerBI_sql\E-Commerce-Sales-Customer-Analytics-SQL-Power-BI\data\olist_orders_dataset.csv'
WITH (FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

TRUNCATE TABLE order_items;
BULK INSERT order_items
FROM 'E:\Project\powerBI_sql\E-Commerce-Sales-Customer-Analytics-SQL-Power-BI\data\olist_order_items_dataset.csv'
WITH (FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

TRUNCATE TABLE payments;
BULK INSERT payments
FROM 'E:\Project\powerBI_sql\E-Commerce-Sales-Customer-Analytics-SQL-Power-BI\data\olist_order_payments_dataset.csv'
WITH (FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

TRUNCATE TABLE products;
BULK INSERT products
FROM 'E:\Project\powerBI_sql\E-Commerce-Sales-Customer-Analytics-SQL-Power-BI\data\olist_products_dataset.csv'
WITH (FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

TRUNCATE TABLE sellers;
BULK INSERT sellers
FROM 'E:\Project\powerBI_sql\E-Commerce-Sales-Customer-Analytics-SQL-Power-BI\data\olist_sellers_dataset.csv'
WITH (FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

TRUNCATE TABLE reviews;
BULK INSERT reviews
FROM 'E:\Project\powerBI_sql\E-Commerce-Sales-Customer-Analytics-SQL-Power-BI\data\olist_order_reviews_dataset.csv'
WITH (FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

TRUNCATE TABLE category_translation;
BULK INSERT category_translation
FROM 'E:\Project\powerBI_sql\E-Commerce-Sales-Customer-Analytics-SQL-Power-BI\data\product_category_name_translation.csv'
WITH (FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');


