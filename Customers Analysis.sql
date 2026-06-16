-- Top Customers
SELECT 
	O.`Customer ID`,
    C.`Customer Name`,
	ROUND(SUM(Sales),2) AS REVENUE
FROM Orders O
JOIN Customers C
ON O.`Customer ID` = C.`Customer ID`
GROUP BY `Customer ID`, `Customer Name`
ORDER BY Revenue DESC
LIMIT 3;

-- Customer Life Time Value CLV

SELECT 
	O.`Customer ID`,
    C.`Customer Name`,
	ROUND(SUM(Sales),2) AS CLV
FROM Orders O
JOIN Customers C
ON O.`Customer ID` = C.`Customer ID`
GROUP BY `Customer ID`, `Customer Name`
ORDER BY CLV DESC
;

SELECT 
    Segment,
    COUNT(*) AS number
FROM
	Customers
GROUP BY Segment;
-- Highest Revenue By Customer Segment
SELECT 
    c.Segment,
    sum(o.sales) AS Revenue
FROM
	orders o
	join Customers c
on o.`Customer ID` = c.`Customer ID`
GROUP BY Segment;