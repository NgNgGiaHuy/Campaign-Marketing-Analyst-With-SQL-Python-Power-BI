SELECT
	ReviewID,
	CustomerID,
	ProductID,
	ReviewDate,
	Rating,
	REPLACE(ReviewText,'  ', ' ') as ReviewText -- I see the ReviewText collumn has large of space so I proceed to make it narrow
FROM
	[dbo].[customer_reviews]