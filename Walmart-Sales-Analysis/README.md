# Walmart-Sales-Analysis
This project aims to explore the Walmart Sales data to understand top performing branches and products, sales trend of different products, and customer behavior. The aim is to study how sales strategies can be improved and optimized.

## Purposes Of The Project
The major aim of this project is to gain insight into the sales data of Walmart to understand the different factors that affect sales of the different branches.

## About Data
This dataset contains sales transactions from a three different branches of Walmart, respectively located in Mandalay, Yangon and Naypyitaw. The data contains 17 columns and 1000 rows:
### Data Columns

| Column                    | Description                            | Data Type      |
|---------------------------|----------------------------------------|----------------|
| invoice_id                | Invoice of the sales made              | VARCHAR(30)    |
| branch                    | Branch at which sales were made        | VARCHAR(5)     |
| city                      | The location of the branch             | VARCHAR(30)    |
| customer_type             | The type of the customer               | VARCHAR(30)    |
| gender                    | Gender of the customer making purchase | VARCHAR(10)    |
| product_line              | Product line of the product sold       | VARCHAR(100)   |
| unit_price                | The price of each product              | DECIMAL(10, 2) |
| quantity                  | The amount of the product sold         | INT            |
| VAT                       | The amount of tax on the purchase      | FLOAT(6, 4)    |
| total                     | The total cost of the purchase         | DECIMAL(10, 2) |
| date                      | The date on which the purchase was made| DATE           |
| time                      | The time at which the purchase was made| TIMESTAMP      |
| payment_method            | The total amount paid                  | DECIMAL(10, 2) |
| cogs                      | Cost Of Goods sold                     | DECIMAL(10, 2) |
| gross_margin_percentage   | Gross margin percentage                | FLOAT(11, 9)   |
| gross_income              | Gross Income                           | DECIMAL(10, 2) |
| rating                    | Rating                                 | FLOAT(2, 1)    |

## Analysis List
### Product Analysis
- Conduct analysis on the data to understand the different product lines, the products lines performing best and the product lines that need to be improved.

### Sales Analysis
- This analysis aims to answer the question of the sales trends of product. The result of this can help use measure the effectiveness of each sales strategy the business applies and what modificatoins are needed to gain more sales.

### Customer Analysis
- This analysis aims to uncover the different customers segments, purchase trends and the profitability of each customer segment.

## Approach Used

### Data Wrangling
### Feature Engineering
### Exploratory Data Analysis (EDA)

## Business Questions

### Generic Question
- How many unique cities does the data have?
- In which city is each branch?
### Product
- How many unique product lines does the data have?
- What is the most common payment method?
- What is the most selling product line?
- What is the total revenue by month?
- What month had the largest COGS?
- What product line had the largest revenue?
- What is the city with the largest revenue?
- What product line had the largest VAT?
- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales.
- Which branch sold more products than average product sold?
- What is the most common product line by gender?
- What is the average rating of each product line?

### Sales
- Number of sales made in each time of the day per weekday
- Which of the customer types brings the most revenue?
- Which city has the largest tax percent/ VAT (Value Added Tax)?
- Which customer type pays the most in VAT?

### Customer
- How many unique customer types does the data have?
- How many unique payment methods does the data have?
- What is the most common customer type?
- Which customer type buys the most?
- What is the gender of most of the customers?
- What is the gender distribution per branch?


## Conclusion

In this data analysis project, we embarked on a journey to gain valuable insights from Walmart’s sales data. We began by preparing and exploring the dataset, cleaning any missing or null values, and engineering new features to help us uncover meaningful patterns.

We addressed a variety of questions, ranging from understanding product performance and sales trends to diving into customer behavior. These insights are crucial for Walmart’s sales strategies and can guide future optimizations.

Throughout our analysis, we made use of SQL queries to extract relevant information from the dataset. We also computed important metrics such as COGS (Cost of Goods Sold), VAT (Value Added Tax), total revenue, and gross profit to better understand the financial aspects of Walmart’s operations.




