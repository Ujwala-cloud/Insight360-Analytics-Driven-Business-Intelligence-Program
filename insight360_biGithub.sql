-- Project: Insight360 BI Program
-- Description: Analytics backend using PostgreSQL

CREATE DATABASE insight360_bi;

connect to
\c insight360_bi;


-- Schema setup
CREATE SCHEMA analytics;
SET search_path TO analytics;

-- Fact table
CREATE TABLE analytics.fact_sales (
    order_id           VARCHAR(20),
	product_id         VARCHAR(20),
	quantity           INTEGER,
    unit_price         NUMERIC(10,2),
    net_revenue        NUMERIC(12,2),
    customer_id        VARCHAR(20),
    customer_type      VARCHAR(20),
 	cost               NUMERIC(12,2),
    profit             NUMERIC(12,2),
    region             VARCHAR(50),
	order_date         DATE,
    price_valid_flag   VARCHAR(10)
);

--Load Data from CSV
clean_sales_data.csv

COPY analytics.fact_sales
FROM '/path/to/clean_sales_data.csv'
DELIMITER ','
CSV HEADER;

--verifying table creation
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'analytics';
--loading csv into psql
\copy analytics.fact_sales
FROM 'C:\Users\Lenovo\BIPM Project\clean_sales_data.csv'
DELIMITER ','
CSV HEADER;

--row count
SELECT COUNT(*) FROM analytics.fact_sales;

--invalid price check
SELECT COUNT(*)
FROM analytics.fact_sales
WHERE price_valid_flag = 'INVALID';

SELECT COUNT(*) 
FROM analytics.fact_sales;

SELECT COUNT(*) 
FROM information_schema.tables
WHERE table_schema = 'analytics'
  AND table_name = 'fact_sales';

SELECT * 
FROM analytics.fact_sales
LIMIT 5;

--report revenue
SELECT ROUND(SUM(net_revenue),2)
FROM analytics.fact_sales
WHERE price_valid_flag = 'VALID';

--create dimension table
CREATE TABLE dim_customer AS
SELECT DISTINCT
    customer_id,
    customer_type
FROM analytics.fact_sales;

--create product dimension
CREATE TABLE dim_product AS
SELECT DISTINCT
    product_id
FROM analytics.fact_sales;

--create date dimension
CREATE TABLE dim_date AS
SELECT DISTINCT
    order_date,
    EXTRACT(YEAR FROM order_date)   AS year,
    EXTRACT(MONTH FROM order_date)  AS month,
    EXTRACT(QUARTER FROM order_date) AS quarter
FROM analytics.fact_sales;

--create BI ready views
	--monthly sales view
	CREATE VIEW vw_monthly_sales AS
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(net_revenue) AS revenue,
    SUM(profit) AS profit
FROM analytics.fact_sales
WHERE price_valid_flag = 'VALID'
GROUP BY 1
ORDER BY 1;

	--top customers view
	CREATE VIEW vw_top_customers AS
SELECT
    customer_id,
    SUM(net_revenue) AS revenue
FROM analytics.fact_sales
WHERE price_valid_flag = 'VALID'
  AND customer_type = 'Registered'
GROUP BY customer_id
ORDER BY revenue DESC
LIMIT 10;

--sales by region
CREATE VIEW vw_sales_region AS
SELECT
    region,
    SUM(net_revenue) AS revenue
FROM analytics.fact_sales
WHERE price_valid_flag = 'VALID'
GROUP BY region;