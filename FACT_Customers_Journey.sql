SELECT 
	* 
FROM
	[dbo].[customer_journey]
-----------------------------------------
-- Check the data table has duplicates
SELECT 
	*
FROM
	(
	SELECT 
		JourneyID,
		CustomerID,
		ProductID,
		VisitDate,
		Stage,
		Action,
		Duration,
		ROW_NUMBER()
		OVER(
			PARTITION BY 
				JourneyID,
				CustomerID,
				ProductID,
				VisitDate,
				Stage,
				Action,
				Duration
			ORDER BY
				JourneyID) AS Collum_duplicate_check -- I grouped all the columns JourneyID, CustomerID, ProductID, VisitDate, Stage, Action, Duration into one group. And of course, this group is unique, so each row will have a value = 1. if there is a duplicate; the row_number function will assign a value > 1 to that row.
FROM
	[dbo].[customer_journey]) as DUPLICATE_CHECK
WHERE Collum_duplicate_check > 1 
-- So, this table has 79 duplicated values.
------------------------------------------------------------------------------------------------------------------------------------
--Delete the duplicated values and full fill null data
SELECT 
    JourneyID,  
    CustomerID,  
    ProductID,  
    VisitDate,  
    Stage,  
    Action,  
    COALESCE(Duration, avg_duration) AS Duration  -- i replace null = avg_duration
FROM 
    (
       SELECT 
            JourneyID,  
            CustomerID,  
            ProductID,  
            VisitDate,  
            UPPER(Stage) AS Stage, 
            Action, 
            Duration, 
            AVG(Duration) OVER (PARTITION BY VisitDate) AS avg_duration, -- caculate avg(duration) to use above
            ROW_NUMBER() OVER (
                PARTITION BY CustomerID, ProductID, VisitDate, UPPER(Stage), Action, Duration 
                ORDER BY JourneyID
            ) AS Collum_duplicate_check
        FROM 
            dbo.customer_journey
    ) AS subquery
WHERE 
    Collum_duplicate_check = 1;