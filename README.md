﻿# [PROJECT] Campaign Marketing Analyst With SQL, Python & Power BI
 ## Introduction

ShopSporting, an online retail business, is facing a decline in customer engagement and conversion rates, even though it has launched many new online marketing campaigns.

The task of the data analyst is to provide analysis and solutions to increase conversion rates, enhance customer engagement, and improve customer feedback scores.

Below is a demo of the final product that has been and is being developed for this project:

<table>
  <tr>
    <td style="text-align: center; width: 50%;">
      <img src="https://github.com/user-attachments/assets/5d430f1e-7a1c-4d69-8659-54b681b3e728" alt="Picture 4" style="width: 100%; height: auto;">
    </td>
    <td style="text-align: center; width: 50%;">
      <img src="https://github.com/user-attachments/assets/64d933d9-bfea-4051-b83b-46c18d2b33d6" alt="Picture 3" style="width: 100%; height: auto;">
    </td>
  </tr>
  <tr>
    <td style="text-align: center; width: 50%;">
      <img src="https://github.com/user-attachments/assets/c275e0c9-1387-4118-94eb-10fa7de3a0f4" alt="Picture 2" style="width: 100%; height: auto;">
    </td>
    <td style="text-align: center; width: 50%;">
      <img src="https://github.com/user-attachments/assets/88312e62-dd3e-40e4-9e22-d5b577a9b045" alt="Picture 1" style="width: 100%; height: auto;">
    </td>
  </tr>
</table>

## The ways to do
### 1. Data preprocessing

From the data tables in the Data Warehouse, I have linked related tables together to optimize data storage. Additionally, I combined other queries to filter the necessary data for the analysis process. Finally, I will save the file in `.sql` format and classify these tables as Dim or Fact.

<p align="center">
  <img src="https://github.com/user-attachments/assets/acb7e0c9-7ba1-458b-ad83-a97a78908151" alt="Picture 5" style="max-width: 100%; height: auto;">
  <br>
  <i>Demo SQL Query to Connect Necessary Data</i>
</p>

After obtaining the results from the queries, we proceed to save the data in `.csv` format for use in the next steps. Below are some results after saving the data for visualization preparation.

<p align="center">
  <img src="https://github.com/user-attachments/assets/0480bdc2-c766-414c-8200-f55d5e3c4375" alt="Picture 6" style="max-width: 100%; height: auto;">
  <br>
  <i>Dim_Customer.csv</i>
</p>

### 2. Analyze customer feedback points

The tool I use is Python. In this step, I will have Python read the data from the FACT_Customers_Reviews table to create 3 new columns that classify whether customer feedback is positive or negative, and to what degree. If you want more details, you can visit my page to take a closer look.

<p align="center">
  <img src="https://github.com/user-attachments/assets/f4dada88-6b8e-4e83-80fc-4e8256495313" alt="Picture 7" style="max-width: 100%; height: auto;">
  <br>
  <i>Demo Python for Analyst</i>
</p>

Once finished, you will receive a `.csv` file that contains similar content to the FACT_Customers_Reviews table but with 3 additional columns categorizing the customer feedback points.



### 3. Data Visualization

#### a. Importing Data and Data Preprocessing

I import the `.csv` data that I saved after querying in SQL, along with the `.csv` file I just created with Python, into Power BI.

Next, I start preprocessing the data: adjusting the columns to the correct format, creating an additional Dim table for time, and so on.

#### b. Building Data Model

We need to link the Dim tables with the Fact table using primary keys and foreign keys for each table. Note that this step is also one of the important steps that directly affects your visualization.

<p align="center">
  <img src="https://github.com/user-attachments/assets/0dc11bfb-e1ce-4e64-a74b-f196f123275d" alt="Picture 8" style="max-width: 100%; height: auto;">
  <br>
  <i>Data Model</i>
</p>

#### c. Visualizing data

After building, we proceed to create a place to store Measures and use DAX functions to calculate the Measures that meet the problem's requirements.

Choosing a chart for visualization is one of the challenging tasks. Each person has different visual thinking, but please make sure to meet the problem's requirements. You can refer to the charts I use, and if there are any mistakes, please give feedback so I can improve!

<p align="center">
  <img src="https://github.com/user-attachments/assets/01997bc1-5557-40f0-aad6-08ae3bad8954" alt="Picture 8" style="max-width: 100%; height: auto;">
  <br>
  <i>Demo Visualize Data</i>
</p>

### 4. Data Storytelling & Providing Solutions for the Business

I always create an overview dashboard first so you can have a general view of the issue. This means we will start with the big picture and then gradually break down the details.

Finally, based on my analysis and observations, I combine additional online resources to propose a few solutions that can help the business improve the requirements they set.

## Conclusion

Because I am a student with limited experience in this field, I sincerely hope that everyone will accept and provide feedback to help me improve each day. Wishing everyone good health and good luck! :relaxed:
