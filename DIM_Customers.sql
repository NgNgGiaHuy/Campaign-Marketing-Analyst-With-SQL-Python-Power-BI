--I query all the data from the two tables to give you an overview of the data so that the data can connect the tables
SELECT 
  * 
FROM 
  [dbo].[customers] 
SELECT 
  * 
FROM 
  [dbo].[geography] 
  ----------------------------------------------------------------------------------------------------------------------------------------------------
  -- I proceed to connect dbo.Customers with dbo.geography
SELECT 
  c.CustomerID, 
  c.CustomerName, 
  c.Email, 
  c.Gender, 
  c.Age, 
  g.City, 
  g.Country 
FROM 
  [dbo].[customers] AS c 
LEFT JOIN 
	[dbo].[geography] AS g 
ON c.CustomerID = g.GeographyID
