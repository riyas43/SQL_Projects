-- Create Database
DROP DATABASE IF EXISTS retail_sales_db;
CREATE DATABASE retail_sales_db;

-- Create Table
CREATE TABLE retail_sales
					(  	 transactions_id INT PRIMARY KEY,
						 sale_date DATE,
						 sale_time TIME,
						 customer_id INT,
						 gender VARCHAR(15),
						 age INT,
						 category VARCHAR(15),
						 quantity INT,
						 price_per_unit DECIMAL(10,2),
						 cogs DECIMAL(10,2),
						 total_sale DECIMAL(10,2)
					);
                    
SELECT *
FROM retail_sales;

-- I wanna add extra colmn for profit--

ALTER TABLE retail_sales
ADD COLUMN profit DECIMAL(10,2);

UPDATE retail_sales
SET profit = total_sale - (quantity * cogs);

-- EDA--

-- Total Sales--

SELECT SUM(total_sale)total_sales
FROM retail_sales;

-- Total Profits--

SELECT SUM(profit)total_profits
FROM retail_sales;

-- Average Total Sales--

SELECT AVG(total_sale)avg_sale
FROM retail_sales;

-- Average Total Profits--

SELECT AVG(profit)avg_profit
FROM retail_sales;

-- Quarter Wise Profit Performance--

SELECT YEAR(sale_date)`year`, CONCAT("Qtr ",QUARTER(sale_date))AS `quarter`, SUM(profit)total_profit
FROM retail_sales
GROUP BY CONCAT("Qtr ",QUARTER(sale_date)),YEAR(sale_date)
ORDER BY YEAR(sale_date),CONCAT("Qtr ",QUARTER(sale_date));

-- Month Wise Quantity, Sales & Profit Overview--

SELECT YEAR(sale_date), MONTH(sale_date), SUM(quantity), SUM(total_sale), SUM(profit)
FROM retail_sales
GROUP BY MONTH(sale_date), YEAR(sale_date)
ORDER BY YEAR(sale_date), MONTH(sale_date);

-- Category wise Quantity, Sales & Profit Overview--

SELECT category, SUM(quantity)total_quantity, SUM(total_sale)total_sale, SUM(profit)total_profit
FROM retail_sales
GROUP BY category;

-- Age Group Analysis--

SELECT 
CASE 
    WHEN age < 20 THEN 'Teen'
    WHEN age BETWEEN 20 AND 40 THEN 'Adult'
    ELSE 'Senior'
END AS age_group,
SUM(total_sale) AS revenue
FROM retail_sales
GROUP BY age_group
ORDER BY revenue DESC;

-- Category & Gender wise Transaction Analysis--

SELECT category, gender, COUNT(*)total_transac
FROM retail_sales
GROUP BY category, gender
ORDER BY total_transac DESC;

-- Top 10 Customers--

SELECT customer_id, SUM(total_sale) AS total_spent
FROM retail_sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- Best Selling Product Category by Quantity--

SELECT category, SUM(quantity) AS total_quantity
FROM retail_sales
GROUP BY category
ORDER BY total_quantity DESC;


-- Repeat Customers--

SELECT customer_id, COUNT(*) AS orders
FROM retail_sales
GROUP BY customer_id
HAVING COUNT(*) > 1
ORDER BY orders DESC;

-- Best Selling Month in Each Year--

SELECT `year`,`month`, avg_sales
FROM(
SELECT YEAR(sale_date)`year`, MONTH(sale_date)`month`, AVG(total_sale)avg_sales,
RANK() OVER(PARTITION BY YEAR(sale_date) ORDER BY AVG(total_sale) DESC)rnk
FROM retail_sales
GROUP BY YEAR(sale_date), MONTH(sale_date)
)T
WHERE rnk = 1;


-- Shift wise Total Orders Overview--

WITH hours_sale AS 
	(
		SELECT *,
			CASE 
				WHEN HOUR(sale_time)<12 THEN 'Morning'
                WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
                WHEN HOUR(sale_time)>17 THEN 'Evening'
			END shift
		FROM retail_sales
	)
SELECT shift,
	   COUNT(*)total_orders
FROM hours_sale
GROUP BY shift;


