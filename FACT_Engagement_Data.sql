SELECT 
	*
FROM 
	[dbo].[engagement_data]
----------------------------------------------------------------------------------------------------------------
SELECT
    EngagementID, 
    ContentID, 
    CampaignID,
    ProductID,
	UPPER(REPLACE(REPLACE(ContentType, 'Socialmedia', 'social media'), 'newsletter', 'news letter')) AS ContentType, -- Replace 'Socialmedia' with 'social media', 'newsletter' with 'news letter' and convert it to uppercase.
    LEFT(ViewsClicksCombined, CHARINDEX('-', ViewsClicksCombined)-1) AS Views, --Extract the Views part from ViewsClicksCombined.
    RIGHT(ViewsClicksCombined, LEN(ViewsClicksCombined) - CHARINDEX('-', ViewsClicksCombined)) AS Clicks, -- Extract the Clicks part from ViewsClicksCombined.
    Likes,
    FORMAT(CONVERT(DATE, EngagementDate), 'dd.MM.yyyy') AS EngagementDate -- Convert and format EngagementDate into dd-MM-yyyy
FROM 
    [dbo].[engagement_data];
