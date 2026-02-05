📊 Insight360 – End-to-End Business Intelligence & Analytics Project

📌 Project Overview
Insight360 is an end-to-end Business Intelligence and Analytics project that simulates a real-world analytics workflow.
The project covers the complete lifecycle — from data validation and SQL modeling to Power BI dashboards, Python analytics, and Jira-based project tracking.
This project demonstrates how raw transactional data can be transformed into reliable, decision-ready insights.

🎯 Business Objectives
Analyze retail sales performance across time, region, and customers
Build BI-ready data models for executive reporting
Measure revenue, profit, and customer contribution
Apply Six Sigma (DMAIC) principles to assess data quality
Deliver insights using industry-standard BI and analytics tools

🧰 Tool Stack
Excel / Advanced Excel – Data validation & quality checks
PostgreSQL – Data storage, modeling, analytics views
Power BI – Dashboards & DAX measures
Python (Pandas, NumPy, Matplotlib) – EDA & advanced analysis
Jira (Kanban) – Project tracking & delivery management

🏗️ Project Architecture
Excel (Validation)
      ↓
PostgreSQL (Fact Table + Views)
      ↓
Power BI (Dashboards & KPIs)
      ↓
Python (EDA + Six Sigma Analysis)

🗄️ Data Description
Domain: Retail / Sales Analytics
Granularity: Transaction-level data
Time Period: Dec 2010 – Nov 2011
Key Fields:
Order Date
Customer ID & Type
Product ID
Quantity & Unit Price
Revenue, Cost, Profit
Region

🧱 SQL Layer (PostgreSQL)
Designed a fact_sales table for transactional data
Created an analytics schema for BI consumption
Built BI-ready SQL views for:
Revenue & profit trends
Regional performance
Top customers
Performed row count and data integrity validation

📁 sql/insight360_biGithub.sql

📈 Power BI Dashboards

Developed multi-page interactive dashboards connected to PostgreSQL.
🔹 Executive Overview
Total Revenue
Total Profit
Profit Margin %
Revenue trend by year
Revenue by region

🔹 Sales & Trend Analysis
Revenue vs Profit trend
Year-wise performance
Time-based analysis

🔹 Customer Insights

Top customers by revenue
Average revenue per customer
Customer revenue distribution
DAX measures implemented:
Profit Margin %
MoM Growth
YoY Growth

📁 powerbi/insight360_bi.sql_powerbi

🐍 Python Analytics & Six Sigma (DMAIC)

🔹 Exploratory Data Analysis
Revenue distribution analysis
Customer-level aggregation
Identification of skewed revenue contribution

🔹 Six Sigma Application
Define:
Revenue concentration and data quality risks
Measure:
Defect rate based on invalid prices and quantities
Analyze:
Defect patterns by customer and region
Improve (Conceptual):
Input validation rules
Monitoring abnormal transactions
Control (Conceptual):
Ongoing defect tracking
Quality checks before BI consumption

📁
python/insight360_bi-checkpoint.ipynb
python/clean_sales_data_export.csv

📊 Key Insights

A small percentage of customers contribute a large share of total revenue
Profit growth does not always scale proportionally with revenue
Seasonal trends significantly affect sales performance
Data quality issues, even at low volumes, can impact reporting accuracy

🧠 Skills Demonstrated
Business Intelligence & analytics modeling
SQL querying and data transformation
Power BI dashboarding & DAX
Python-based exploratory analysis
Six Sigma (DMAIC) methodology
Jira-based project management (Kanban)
End-to-end project ownership

👉 Project Management
Project execution was tracked using Jira (Kanban), with epics and tasks aligned to the BI and analytics delivery lifecycle.

🚀 Project Status
Ongoing – enhancements and additional analytics planned.

👤 Author
Ujwala
Independent Business Intelligence Project Manager
