SELECT * FROM locations;
SELECT 
	L.Region,
    SUM(O.sales) AS REVENUE    
from Orders O
join locations L
on O.`location ID` = l.`Location ID`
group by L.Region
order by Revenue desc;