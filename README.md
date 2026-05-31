# zepto-sql-data-analysis
SQL project analyzing product inventory, pricing, and revenue estimation for Zepto.

# Zepto E-Commerce SQL Data Analysis 🛒

## Project Overview
This repository contains a SQL-based data analysis project focused on an e-commerce inventory dataset (inspired by Zepto). The project demonstrates end-to-end database operations, including table creation, data cleaning, exploratory data analysis (EDA), and solving business-driven questions to derive actionable insights.

## Tech Stack
* **Database Engine:** PostgreSQL (can be adapted for MySQL/SQL Server)
* **Language:** SQL (DDL, DML, Aggregations, Case Statements)

## Database Schema
The analysis is performed on a primary `zepto` table with the following structure:
* `sku_id` (Primary Key)
* `category`, `name`, `weight_in_grams`
* `mrp`, `discount_percent`, `discounted_sellingprice`
* `available_quantity`, `quantity`, `out_of_stock`

## Project Workflow

### 1. Data Cleaning & Preprocessing
* Identified and handled NULL values across critical columns.
* Removed invalid product records (e.g., MRP = 0).
* Standardized currency by converting Paise to Rupees for accurate revenue calculation.

### 2. Exploratory Data Analysis (EDA)
* Analyzed product categories and stock availability ratios.
* Identified duplicate product names/SKUs across the database.

### 3. Business Questions Answered
The core of the project involves writing complex queries to answer the following business questions:
1. **Top Value Deals:** What are the top 10 best-value products based on discount percentages?
2. **Lost Revenue Opportunities:** Which high-value items (MRP > ₹300) are currently out of stock?
3. **Revenue Estimation:** What is the estimated total revenue for each product category based on current inventory?
4. **Premium Low-Discount Products:** Which items cost more than ₹500 but offer less than a 10% discount?
5. **Category Discount Trends:** What are the top 5 product categories offering the highest average discount?
6. **Unit Economics:** What is the price-per-gram for products weighing over 100g, sorted by best value?
7. **Weight Segmentation:** How can products be dynamically grouped into 'Low', 'Medium', and 'Bulk' categories based on their weight?
8. **Inventory Logistics:** What is the total inventory weight load per category?

## How to Run This Project
1. Clone this repository to your local machine.
2. Run the `Zepto SQL Project.sql` script in your preferred SQL client (e.g., pgAdmin, DBeaver, DataGrip).
3. The script will automatically drop any existing table, recreate the schema, and run the analysis queries. *(Note: You will need to insert data into the table after creation to test the queries).*
