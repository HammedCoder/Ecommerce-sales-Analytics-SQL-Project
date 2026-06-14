-- Step 1: Create and Set Database
CREATE DATABASE ecommerce_analytics;
USE ecommerce_analytics;
-- Step 2: Verify the Tables
show tables;
/*
customers
orders
products
inventory
marketing_campaigns
web_analytics
customer_acquisition
sales_reps
locations */

--  Step 3: Inspect Each Table
DESCRIBE locations;-- 
DESCRIBE customers;
DESCRIBE orders;
DESCRIBE `sales reps`;
DESCRIBE customer_acquisition;
DESCRIBE marketing_campaigns;
DESCRIBE inventory;
DESCRIBE web_analytics;


-- Check for NULL orders
SELECT * FROM ORDERS
WHERE `order ID` is NULL;

-- Check for Missing Customer Info
SELECT * FROM customers 
WHERE `customer ID` is NULL OR `Customer Name` is NULL;

-- Check For Duplicates Transactions

SELECT 
	`order ID`,
    COUNT(*) AS Duplicate_Count
FROM orders
GROUP BY `order ID`
HAVING COUNT(*) > 1
ORDER BY Duplicate_Count DESC;

-- 

SELECT * FROM orders
WHERE
	`order ID` = 'CA-2017-100111';

-- Check Sales Cannot Be Negative
SELECT * FROM orders
WHERE sales < 0;

-- Check Profit Outliers
SELECT * FROM orders
WHERE 
	profit < -500 OR profit > 10000;