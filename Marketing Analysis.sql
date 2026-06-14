select * from marketing_campaigns;
SELECT * FROM customer_acquisition;
-- Total Marketting Spent By Channel
SELECT 
	`Channel`,
    SUM(Spend) Total_Spent
FROM marketing_campaigns
GROUP BY `Channel`
ORDER BY Total_Spent desc;

-- Total Marketting Spent By Channel
SELECT 
	M.`Channel`,
    SUM(M.Spend) Total_Spent,
    COUNT(C.Customer_ID),
    ROUND(SUM(M.Spend) / COUNT(C.Customer_id))
FROM marketing_campaigns M
JOIN customer_acquisition C
ON M.`Channel` = C.Acquisition_Channel
GROUP BY M.`Channel`
ORDER BY Total_Spent desc
;

-- MOST EFFECTIVE ACQUISITION CHANNEL
SELECT 
	Acquisition_Channel,
    COUNT(Customer_ID) AS Customer_Acquired
FROM customer_acquisition
GROUP BY Acquisition_Channel
ORDER BY Customer_Acquired DESC
;

-- AVERAGE CUSTOMER ACQUISITION COST
SELECT 
	Acquisition_Channel,
    ROUND(AVG(Acquisition_Cost),2) AS Average_CAC
FROM customer_acquisition
GROUP BY Acquisition_Channel
ORDER BY Average_CAC DESC
;
