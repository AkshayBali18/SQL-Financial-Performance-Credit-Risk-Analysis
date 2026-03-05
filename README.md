# 📊 Financial Analytics SQL Project

## 📖 Overview
This project focuses on analyzing financial performance and company metrics using SQL. The goal is to derive **actionable business insights** such as revenue trends, profitability, and market positioning. The key deliverable is a SQL view called `report.master_financial_table` which aggregates essential KPIs.

## 📂 Dataset
The project utilizes a structured schema with the following components:
* gold.dim_company: Contains descriptive attributes for companies such as sector, industry, and region.
* gold.fact_financials: Contains transactional financial data including revenue, costs, and tax information.

## ⚡ SQL Features Used
*  Joins: `LEFT JOIN` used to combine financial facts with company dimensions.
*  Aggregations: `SUM`, `AVG`, and `COUNT` to calculate financial totals and averages.
*  Window Functions: `RANK()` and `DENSE_RANK()` used to categorize company performance.
*  Conditional Logic: `CASE WHEN` statements for performance segmentation and growth analysis.
*  Mathematical Operations: Used to derive Profit Margins, Tax Rates, and Year-over-Year growth.

## 🏆 Financial Report Outputs
The primary output is the SQL view `report.master_financial_table`. This view provides a 360-degree view of financial health:

### 1. 🥇 Performance Segmentation
Companies and sectors are categorized based on their financial standing:
*  High Growth: Entities exceeding specific revenue growth thresholds.
*  Market Leaders: Top-ranked companies within their respective industries based on total revenue.

### 2. 📉 Key KPIs Produced
The view calculates several essential metrics to evaluate corporate value:
*  Total Revenue: The sum of all gross income generated.
*  Net Profit: Calculated as the difference between Revenue and Total Expenses.
*  Profit Margin: The percentage of revenue that remains as profit after costs.
*  Operating Efficiency: Analysis of cost-to-revenue ratios.
*  Tax Impact: Evaluation of effective tax rates across different jurisdictions.
