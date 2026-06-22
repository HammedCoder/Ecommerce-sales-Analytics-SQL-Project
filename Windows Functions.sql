-- Rank Customers by Revenue
-- BUSINESS QUESTION: Who are the best customers?
SELECT
	O.`Customer ID`,
	C.`Customer Name`,
	ROUND(SUM(O.Sales), 2) AS Revenue,
	RANK() OVER (
		ORDER BY
			SUM(O.Sales) DESC
	) AS Revevue_Rank
FROM
	orders O
	JOIN customers C ON O.`Customer ID` = C.`Customer ID`
GROUP BY
	`Customer ID`,
	`Customer Name`
LIMIT
	10;

-- RUNINING TOTAL
-- BUSINESS QUESTION: How is Revenue Accumulating over the Period
SELECT
	`Order Date`,
	ROUND(Sales, 2),
	ROUND(
		SUM(Sales) OVER (
			ORDER BY
				SUM(Sales)
		),
		2
	) AS RUNNING_TOTAL
FROM
	orders
GROUP BY
	`Order Date`,
	Sales;

-- MONTHLY REVENUE GROWTH : 
-- BUSINESS QUESTION: Did Sales Increase or Decrease compare to last month?
SELECT
	Month_Revenue,
	LAG (Month_Revenue) OVER (
		ORDER BY
			Month
	) AS Previous_Month,
	ROUND(
		Month_Revenue - LAG (Month_Revenue) OVER (
			ORDER BY
				`Month`
		),
		2
	) AS Growth
FROM
	(
		SELECT
			MONTH (`Order Date`) AS `Month`,
			YEAR (`Order Date`) AS `Year`,
			ROUND(SUM(Sales), 2) AS Month_Revenue
		FROM
			orders
		GROUP BY
			`Month`,
			`Year`
	) T;