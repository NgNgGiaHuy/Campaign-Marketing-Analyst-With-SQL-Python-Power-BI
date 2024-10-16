# pip install pandas nltk pyodbc sqlalchemy

import pandas as pd
import pyodbc
import nltk
from nltk.sentiment.vader import SentimentIntensityAnalyzer

# Download the VADER lexicon for sentiment analysis if not already available.
nltk.download('vader_lexicon')

# Define a function to get data from a SQL database using a query from an SQL file.
def fetch_data_from_sql():
    # Define the connection string with parameters for connecting to the database.
    conn_str = (
        "Driver={SQL Server};"  # Specify the driver for SQL Server
        "Server=LAPTOP-VUOB76UU\\SQLEXPRESS;"  # Specify your SQL Server instance (note the use of double backslashes)
        "Database=PortfolioProject_MarketingAnalytics;"  # Specify the name of the database
        "Trusted_Connection=yes;"  # Use Windows authentication for the connection
    )
    
    # Establish the connection to the database
    conn = pyodbc.connect(conn_str)
    
    # Read the content of the SQL file
    with open('C:\\Users\\Admin\\Downloads\\Marketing Analyst\\SQL\\FACT_Customer_Review.sql', 'r', encoding='utf-8') as file:
        sql_query = file.read()
    
    # Execute the query and fetch the data into a DataFrame
    df = pd.read_sql(sql_query, conn)
    
    # Close the connection to free up resources
    conn.close()
    
    # Return the fetched data as a DataFrame
    return df

# Get the customer review data from the SQL database
customer_reviews_df = fetch_data_from_sql()

# Initialize the VADER sentiment intensity analyzer to analyze text sentiment
sia = SentimentIntensityAnalyzer()

# Define a function to calculate sentiment score using VADER
def calculate_sentiment(review):
    # Get the sentiment score for the review text
    sentiment = sia.polarity_scores(review)
    # Return the compound score, which is normalized between -1 (most negative) and 1 (most positive)
    return sentiment['compound']

# Define a function to categorize sentiment based on the score and rating
def categorize_sentiment(score, rating):
    if score > 0.05:  # Positive sentiment score
        if rating >= 4:
            return 'Positive'  # High rating and positive sentiment
        elif rating == 3:
            return 'Mixed Positive'  # Neutral rating but positive sentiment
        else:
            return 'Mixed Negative'  # Low rating but positive sentiment
    elif score < -0.05:  # Negative sentiment score
        if rating <= 2:
            return 'Negative'  # Low rating and negative sentiment
        elif rating == 3:
            return 'Mixed Negative'  # Neutral rating but negative sentiment
        else:
            return 'Mixed Positive'  # High rating but negative sentiment
    else:  # Neutral sentiment score
        if rating >= 4:
            return 'Positive'  # High rating with neutral sentiment
        elif rating <= 2:
            return 'Negative'  # Low rating with neutral sentiment
        else:
            return 'Neutral'  # Neutral rating and neutral sentiment

# Define a function to classify sentiment scores into ranges
def sentiment_bucket(score):
    if score >= 0.5:
        return '0.5 to 1.0'  # Strong positive sentiment
    elif 0.0 <= score < 0.5:
        return '0.0 to 0.49'  # Slight positive sentiment
    elif -0.5 <= score < 0.0:
        return '-0.49 to 0.0'  # Slight negative sentiment
    else:
        return '-1.0 to -0.5'  # Strong negative sentiment

# Apply sentiment analysis to calculate the sentiment score for each review
customer_reviews_df['SentimentScore'] = customer_reviews_df['ReviewText'].apply(calculate_sentiment)

# Apply sentiment classification based on both text and rating
customer_reviews_df['SentimentCategory'] = customer_reviews_df.apply(
    lambda row: categorize_sentiment(row['SentimentScore'], row['Rating']), axis=1)

# Apply classification of sentiment scores into predefined ranges
customer_reviews_df['SentimentBucket'] = customer_reviews_df['SentimentScore'].apply(sentiment_bucket)

# Display the first few rows of the DataFrame with sentiment scores, categories, and buckets
print(customer_reviews_df.head())

# Save the DataFrame with sentiment scores, categories, and buckets to a new CSV file
customer_reviews_df.to_csv('FACT_Customer_Reviews_With_Sentiment.csv', index=False)
