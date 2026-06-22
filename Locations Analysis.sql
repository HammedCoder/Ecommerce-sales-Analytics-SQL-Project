SELECT
    *
FROM
    locations;

-- Most Performed Region By Revenue
SELECT
    L.Region,
    ROUND(SUM(O.sales), 2) AS REVENUE
FROM
    Orders O
    JOIN locations L ON O.`location ID` = L.`Location ID`
GROUP BY
    L.Region
ORDER BY
    Revenue desc;