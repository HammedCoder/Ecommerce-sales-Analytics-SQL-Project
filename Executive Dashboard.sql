-- total revenue
SELECT round(SUM(O.sales), 2) AS Total_Revenues
FROM orders O;			-- Total Revenue = 2,297,200.86

-- 3 Total Profit
SELECT ROUND(SUM(O.profit), 2) AS Total_Profit
FROM orders O;			-- tOTAL PROFIT = 286397.02

-- 4: tOP 10 PRODUCT BY REVENUE
SELECT 
	O.`Product ID`, 
	P.`Product Name`,
	ROUND(SUM(sales),2) Total_Sales
FROM orders O
JOIN products P
ON O.`Product ID` = P.`Product ID`
group by `Product ID`, `Product Name`
order by Total_Sales desc
limit 10;


-- PROFIT MARGIN
SELECT 
	ROUND(SUM(Profit) / SUM(Sales) * 100,2) AS PROFIT_MARGIN
FROM orders;

-- AVERAGE ORDER VALUE
SELECT 
	SUM(Sales) / COUNT(DISTINCT `Order ID`) AOV
FROM orders;