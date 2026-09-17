# E-Commerce Sales & Customer Analytics Platform
*(SQL Server + Power BI)*

## Objective

Build an end-to-end analytics solution using real e-commerce data to analyze:

- Sales performance
- Customer behavior
- Retention & repeat purchases
- Customer lifetime value (LTV)
- Product & category performance
- Customer segmentation (RFM)

This project demonstrates a complete analytics workflow:

**Raw data ingestion → Cleaning → Analytics → Business insights → BI-ready views → Interactive dashboard**

It mirrors how analytics pipelines are built in real companies.

---

## Dataset

**Brazilian E-Commerce Public Dataset by Olist (Kaggle)**
Real transactional e-commerce data.

- ~100,000 orders
- 8+ CSV files
- Covers customers, orders, products, sellers, payments, and reviews

### Files Used

- `olist_customers_dataset.csv`
- `olist_orders_dataset.csv`
- `olist_order_items_dataset.csv`
- `olist_order_payments_dataset.csv`
- `olist_products_dataset.csv`
- `olist_sellers_dataset.csv`
- `olist_order_reviews_dataset.csv`
- `product_category_name_translation.csv`
- `olist_geolocation_dataset.csv`

---

## Tech Stack

- MS SQL Server
- SQL
- Data Modeling
- Data Cleaning & Transformation
- Business Analytics
- Power BI
- DAX
- Kaggle Dataset

---

## Project Architecture

CSV Files (Kaggle)
↓
Raw Tables (TEXT columns)
↓
Clean Tables (Typed + Cleaned)
↓
Analytics Tables (RFM, Cohorts)
↓
Business Queries & Views
↓
Power BI Dashboard & DAX Measures

---

## Project Steps

### 1 Database Setup
- Created project database: `EcommerceAnalytics`
- Designed raw tables with all columns as `NVARCHAR` to handle messy real-world data safely

### 2 Raw Data Ingestion
- Loaded all CSV files using `BULK INSERT`
- Handled encoding issues, truncation errors, and type mismatches
- Verified row counts matched source files

### 3 Data Cleaning Layer
Created clean analytics tables using `TRY_CAST()`, trimming (`LTRIM`, `RTRIM`), and safe datetime conversions.

Clean tables created:
- `customers_clean`
- `orders_clean`
- `order_items_clean`
- `payments_clean`
- `products_clean`
- `sellers_clean`
- `reviews_clean`

Handled: invalid numeric values, dirty ZIP codes, broken timestamps, text trimming & standardization.

### 4 Business KPIs & Analytics
Implemented core business metrics:
- Total Orders
- Total Revenue
- Average Order Value (AOV)
- Customer Lifetime Value (LTV)
- Repeat vs. One-time Customers
- Monthly Revenue Trend
- Top Products by Revenue
- Top Categories by Revenue

### 5 Advanced Analytics

** RFM Segmentation**
Segmented customers based on:
- **Recency** → Days since last purchase
- **Frequency** → Number of orders
- **Monetary** → Total spend

Implemented using `NTILE()` scoring in SQL, then mapped into named segments (Champions, Loyal Customers, At Risk, Hibernating, etc.) using DAX in Power BI.

Tables: `rfm_base`, `rfm_scores`, `rfm_final`

**🔹 Cohort Analysis**
- Grouped customers by first purchase month
- Tracked monthly retention behavior
- Built cohort retention table

Tables: `customer_cohorts`, `cohort_orders`, `cohort_analysis`

### 6 BI-Ready Views
Created production-style SQL views for reporting:
- `vw_sales_summary`
- `vw_customer_ltv`

These views are used directly by the Power BI dashboard.

### 7 Power BI Dashboard
Built a 4-page interactive dashboard:
- **Revenue** — monthly revenue trend, AOV, order volume
- **RFM** — customer segmentation with KPI cards, segment donut, and segment revenue breakdown
- **Cohort** — customer retention by acquisition month
- **Product Performance** — revenue treemap by category/time

Includes custom DAX measures for segment classification, retention rate, and revenue contribution.

---

## Key Insights

- Identified top products and categories by revenue
- Discovered high-value customer segments using RFM (Champions, Loyal Customers)
- Found that a meaningful share of customers fall into At Risk / Hibernating segments — an active churn risk
- Observed the sharpest retention drop-off within the first few months post-acquisition
- Segmented VIP and at-risk customers for targeted retention strategy

See [`Insights/business_insights.md`](Insights/business_insights.md) for the full write-up with recommendations.

---

## Outcome

This project demonstrates:
- Real-world data ingestion and cleaning at scale
- SQL-based business analytics and view design
- Customer segmentation (RFM) and retention analysis (cohorts)
- BI-ready data modeling and DAX measure design
- A polished, interactive Power BI dashboard

It mirrors how analytics pipelines work in real companies, from raw data to business decisions.

---

## Repository Structure

```
│── LICENSE
│── README.md
│
├── Dashboard/
│   ├── Ecommerce_Analytics_Dashboard.pbix
│   ├── sales_overview.png
│   ├── rfm_page.png
│   ├── revenue_page.png
│   ├── cohort_page.png
│   ├── customer_analytics.png
│   └── product_performance.png
│
├── data/
│   ├── olist_customers_dataset.csv
│   ├── olist_geolocation_dataset.csv
│   ├── olist_orders_dataset.csv
│   ├── olist_order_items_dataset.csv
│   ├── olist_order_payments_dataset.csv
│   ├── olist_order_reviews_dataset.csv
│   ├── olist_products_dataset.csv
│   ├── olist_sellers_dataset.csv
│   └── product_category_name_translation.csv
│
├── insight/
│   └── business_insights.md
│
└── sql/
    ├── 01_create_database.sql
    ├── 02_create_raw_tables.sql
    ├── 03_bulk_insert.sql
    ├── 04_clean_tables.sql
    ├── 05_business_queries.sql
    ├── 06_rfm_analysis.sql
    ├── 07_cohort_analysis.sql
    ├── 08_views.sql
    └── 09_geolocation_extension.sql
```

---

## Dashboard Pages

The Power BI dashboard (`Dashboard/Ecommerce_Analytics_Dashboard.pbix`) includes the following pages:

- **Sales Overview** — monthly revenue trend, monthly order trend, and key KPI cards (total revenue, total orders, average item price)
- **RFM** — customer segmentation with KPI cards (total customers, total revenue, % high-value segments) and a segment distribution donut chart
- **Revenue** — total revenue trend over time by year and month
- **Cohort** — customer retention behavior tracked by acquisition month
- **Customer Analytics** — top customers by lifetime value, repeat vs. one-time customer split, customer distribution by RFM segment, and a detailed RFM customer table
- **Product Performance** — top products and categories by revenue, and revenue share by category (treemap)

---

## Summary

> I built an end-to-end e-commerce analytics platform using SQL Server and Power BI.
> I ingested messy Kaggle data, cleaned it using SQL, built KPIs like revenue, AOV, and LTV, and implemented RFM segmentation and cohort analysis.
>
> I then designed a 6-page interactive Power BI dashboard with custom DAX measures, covering sales trends, customer segmentation, retention, and product performance.
>
> This project mirrors a real analytics pipeline — from raw data to actionable business insights.    
