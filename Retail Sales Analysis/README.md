# Retail Sales Analysis using SQL

## Project Overview

- This project focuses on performing Exploratory Data Analysis (EDA) on a retail sales dataset using MySQL. It provides meaningful business insights such as sales trends, customer behavior, profit analysis, and product performance.

- The project demonstrates strong SQL skills including data transformation, aggregation, window functions, and analytical queries.

## Objectives
- Analyze total sales, profit, and average performance.
- Identify top-performing categories and customers.
- Understand customer demographics (age & gender).
- Evaluate time-based trends (monthly, quarterly).
- Detect repeat customers and buying patterns.
- Segment sales based on shifts (morning, afternoon, evening).

**Database**:
        `retail_sales_db`
**Table**:
        `retail_sale`
``Column Name	   Description
transactions_id	   Unique transaction ID
sale_date	       Date of sale
sale_time	       Time of sale
customer_id	       Customer identifier
gender	           Customer gender
age	               Customer age
category	       Product category
quantity	       Quantity sold
price_per_unit	   Price per unit
cogs	           Cost of goods sold
total_sale     	   Total sales value
profit	           Calculated profit``

## Key Analysis Performed

### 1. Sales & Profit Metrics
- Total Sales.
- Total Profit.
- Average Sales.
- Average Profit.

### 2. Time-Based Analysis
- Monthly Trends (Sales, Quantity, Profit).
- Quarter-wise Profit Analysis.
- Best Selling Month per Year.

### 3. Category Insights
- Category-wise Quantity, Sales & Profit.
- Best Selling Category by Quantity.

### 4.Customer Analysis
- Top 10 Customers by Spending.
- Repeat Customers Identification.
- Age Group Revenue Analysis:
    - Teen.
    - Adult.
    - Senior.
  
### 5. Transaction Analysis
- Category & Gender-wise Transactions.
- Shift-wise Orders:
    - Morning.
    - Afternoon.
    - Evening.

## Advanced SQL Concepts Used
- Aggregate Functions (SUM, AVG, COUNT).
- Conditional Statements (CASE WHEN).
- Window Functions (RANK() OVER()).
- Common Table Expressions (CTE).
- Grouping & Sorting.
- Data Transformation.

## Key Insights
- Identified high-performing product categories.
- Found most valuable customers.
- Observed seasonal sales trends.
- Understood customer purchasing behavior.
- Analyzed peak sales hours.
