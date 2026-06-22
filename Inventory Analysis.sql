-- review all Inventory
SELECT
    *
FROM
    inventory;

-- INFORMATION OF PRODUCT STOCK PER LOCATION
SELECT
    Warehouse,
    SUM(Stock_On_Hand) Total_Number_of_Product
FROM
    inventory
GROUP BY
    Warehouse
ORDER BY
    Total_Number_of_Product DESC;

-- INVENTORY VALUE BY WAREHOUSE
SELECT
    Warehouse,
    ROUND(SUM(Stock_On_Hand * Unit_Cost), 2) AS Inventory_Value
FROM
    inventory
GROUP BY
    Warehouse
ORDER BY
    Inventory_Value DESC;

-- 10 MOST EXPENSIVE PRODUCT IN STOCK
SELECT
    product_ID,
    Stock_On_Hand,
    Unit_Cost,
    ROUND(Stock_On_Hand * Unit_Cost, 2) Valued_Cost
FROM
    inventory
ORDER BY
    Unit_Cost DESC
LIMIT
    10;