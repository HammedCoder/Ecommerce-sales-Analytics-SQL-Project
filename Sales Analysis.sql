-- Step 6: Create an ERD (Entity Relationship Diagram)
-- Fact Table = orders
/* Dimensional Tables = 
customers
products
inventory
marketing_campaigns
customer_acquisition
web_analytics
sales_reps
locations
 */
-- Step 7: Writing Business Queries
-- 1: Total Revenues
select
	*
from
	products;

-- Best Performaing Product By Category
SELECT
	p.category,
	sum(o.sales) as revenue
FROM
	orders o
	JOIN products p ON o.`Product ID` = p.`Product ID`
GROUP BY
	p.category
ORDER BY
	revenue DESC;

-- Best Performing Products by Sub-Category
select
	p.`sub-category`,
	sum(o.sales) as revenue
from
	orders o
	join products p on o.`Product ID` = p.`Product ID`
group by
	p.`sub-category`
order by
	revenue desc
limit
	10;

-- Best Performing Products
select
	p.`product Name`,
	sum(o.sales) as revenue
from
	orders o
	join products p on o.`Product ID` = p.`Product ID`
group by
	p.`product Name`
order by
	revenue desc
limit
	3;

-- Total Revenue
SELECT
	round(SUM(O.sales), 2) AS Total_Revenues
FROM
	orders O;

-- Total Revenue = 2,297,200.86
-- 2: Total Orders
SELECT
	COUNT(distinct `order id`) AS Total_Orders
FROM
	orders;

-- Total Sales = 9,994
-- 3 Total Profit
SELECT
	ROUND(SUM(O.profit), 2) AS Total_Profit
FROM
	orders O;

-- tOTAL PROFIT = 286397.02
-- 4: tOP 10 PRODUCT BY REVENUE
SELECT
	O.`Product ID`,
	P.`Product Name`,
	ROUND(SUM(sales), 2) Total_Sales
FROM
	orders O
	JOIN products P ON O.`Product ID` = P.`Product ID`
group by
	`Product ID`,
	`Product Name`
order by
	Total_Sales desc
limit
	10;

-- 6: BOTTOM 10 PRODUCT BY REVENUE
SELECT
	O.`Product ID`,
	P.`Product Name`,
	ROUND(SUM(sales), 2) Total_Sales
FROM
	orders O
	JOIN products P ON O.`Product ID` = P.`Product ID`
group by
	`Product ID`,
	`Product Name`
order by
	Total_Sales ASC
limit
	10;

-- 7: Monthly Sales Trend
SELECT
	YEAR (`Order Date`) AS Year,
	MONTH (`Order Date`) AS Month,
	ROUND(SUM(sales)) AS Revenue
FROM
	Orders
GROUP BY
	Year,
	Month
ORDER BY
	Year,
	Month;

-- 8: Top 10 Customers by Revenue
desc customers;

SELECT
	C.`Customer Name`,
	ROUND(SUM(O.Sales), 2) AS Purchases
FROM
	orders O
	JOIN customers C ON O.`Customer ID` = C.`customer ID`
GROUP BY
	`Customer Name`
ORDER BY
	Purchases DESC
LIMIT
	10;

-- TOP 10 Most Profitable Products
SELECT
	`Product ID`,
	ROUND(SUM(Profit)) AS SUM_OF_PROFITS
FROM
	orders
GROUP BY
	`Product ID`
ORDER BY
	SUM_OF_PROFITS DESC
LIMIT
	10;

-- TOP Most Profitable Products
SELECT
	`Product ID`,
	ROUND(SUM(Profit)) AS SUM_OF_PROFITS
FROM
	orders
GROUP BY
	`Product ID`
ORDER BY
	SUM_OF_PROFITS DESC
LIMIT
	1;

-- Impact of Discount
SELECT
	Discount,
	ROUND(AVG(Profit), 2) AS Average_Profit
FROM
	Orders
GROUP BY
	Discount
ORDER BY
	Discount DESC;

-- Average Order Value
SELECT
	ROUND(SUM(Sales) / COUNT(DISTINCT `Order ID`), 2) AS Average_Order_Value
FROM
	Orders;