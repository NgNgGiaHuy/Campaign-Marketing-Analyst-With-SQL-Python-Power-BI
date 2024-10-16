SELECT 
	*
FROM 
	[dbo].[products]
---------------------------------------
SELECT 
  ProductID, 
  ProductName, 
  Price, 
  CASE 
	WHEN Price < 50 THEN 'Low' 
	WHEN Price between 50 and 200 THEN 'Medium' 
	ELSE 'Expensive' 
	END AS Category_Price -- I defind the price of Category so as to visualize by BI easily. The reason I remove Category Collumn because it only has "Sport"
FROM 
  [dbo].[products]
