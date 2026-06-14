-- Step 4: Check Row Counts
select count(*) from orders;
select count(*) from customers;
select count(*) from inventory;
select count(*) from web_analytics;
select count(*) from marketing_campaigns;
select count(*) from `sales reps`;
select count(*) from `customer_acquisition`;
select count(*) from `locations`;

-- Step 5: Explore the Data
SELECT * FROM orders;
SELECT * FROM customers;
SELECT * FROM products;
select * from marketing_campaigns;
select * from customer_acquisition;

-- Date Range
SELECT 
	MIN(`Order Date`) as Start_Date,
	MAX(`Order Date`) as End_Date;
    
-- Number of Customers
SELECT 
	COUNT(DISTINCT `customer ID`) TOTAL_NUMBER_OF_CUSTOMER
FROM orders;

SELECT COUNT(*) FROM customers;

-- Revenue Distribution
SELECT 
	ROUND(MIN(sales),2) MINIMUM_SALES,
    ROUND(MAX(sales),2)MAXIMUM_SALES,
    ROUND(AVG(sales), 2) AVERAGE_SALES
FROM 
	orders;

-- PRODUCT COUNTS
SELECT COUNT(*) AS NUMBER_OF_PRODUCTS
FROM PRODUCTS;
-- PRODUCT COUNT BY CATEGORIES
SELECT 
	Category,
	COUNT(*) AS NUMBER_OF_PRODUCTS
FROM PRODUCTS
GROUP BY Category
ORDER BY  NUMBER_OF_PRODUCTS DESC;
    