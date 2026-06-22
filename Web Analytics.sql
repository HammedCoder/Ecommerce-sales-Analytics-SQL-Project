SELECT
    *
FROM
    web_analytics;

-- TOTAL WEBSITE CHANNEL PER SESSION
SELECT
    `Channel`,
    SUM(Sessions) AS Total_Session,
    ROUND(AVG(Conversion_Rate), 1) AS Average_Conversion_Rate
FROM
    web_analytics
GROUP BY
    `Channel`
ORDER BY
    Total_Session DESC;

-- HIGHEST CONVERSION RATE 
SELECT
    `Channel`,
    ROUND(AVG(Conversion_Rate), 1) AS Average_Conversion_Rate
FROM
    web_analytics
GROUP BY
    `Channel`
ORDER BY
    Average_Conversion_Rate DESC;

-- MONTHLY TREND TREND BY USERS
SELECT
    `Month`,
    AVG(Users) AS AVERAGE_USERS
FROM
    web_analytics
GROUP BY
    `Month`
ORDER BY
    Month,
    AVERAGE_USERS;

-- MONTHLY TREND TREND BY SESSION
SELECT
    `Month`,
    AVG(Sessions) AS AVERAGE_SESSION
FROM
    web_analytics
GROUP BY
    `Month`
ORDER BY
    Month,
    AVERAGE_SESSION;