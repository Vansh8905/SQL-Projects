SELECT * FROM walmartsales.sales;

-- Generic Question
-- How many unique cities does the data have?
select distinct(sales.city) from walmartsales.sales;
select count(distinct(sales.city)) from walmartsales.sales;

-- In which city is each branch?
select city,branch from sales;

-- Product
-- How many unique product lines does the data have?
SELECT COUNT(DISTINCT `Product line`) FROM walmartsales.sales;

-- What is the most common payment method?
select payment , count(payment)  as cnt from walmartsales.sales group by payment order by cnt desc limit 1;

-- What is the most selling product line?
select `Product line`, count(`Product line`) as cmt from walmartsales.sales group by `Product line` order by cmt Desc limit 1;

-- What is the total revenue by month?
select month(Date) as Months ,  sum(total)  as Tol_Rev from walmartsales.sales group by Months order by Tol_Rev;

-- What month had the largest COGS?
select months(date) as Months , sum(cogs) as cogs from walmartsales.sales group by Months order by cogs desc;

-- What product line had the largest revenue?
select `Product line` , sum(Total) as totrev from walmartsales.sales group by`Product line` order by totrev desc;
 
-- What is the city with the largest revenue?
select City , sum(Total) as totrev from walmartsales.sales group by city  order by totrev desc; 

-- What product line had the largest VAT?
select `Product line` , sum(`Tax 5%`) as VAt from walmartsales.sales group by `Product line`  order by VAT desc; 

-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
SELECT 
    `Product line`,
    CASE
        WHEN sales.total > avg_total THEN 'Good'
        ELSE 'Bad'
    END AS Review
FROM
    walmartsales.sales
        CROSS JOIN
    (SELECT 
        AVG(total) AS avg_total
    FROM
        walmartsales.sales) AS avg_sales;

-- Which branch sold more products than average product sold?
select Branch, sum(quantity) as TtQl from walmartsales.sales group by branch having ttql> (Select avg(quantity) from walmartsales.sales) order by ttql desc limit 1;

-- What is the most common product line by gender?
select `Product line`, gender , count(Gender) as ctgen from walmartsales.sales group by gender, `Product line` order by ctgen desc;

-- What is the average rating of each product line?
SELECT `Product line`, AVG(Rating) AS Average_Rating
FROM walmartsales.sales
GROUP BY `Product line`;

-- Sales
-- Number of sales made in each time of the day per weekday

select distinct date, weekday(date) as Week from walmartsales.sales;

select
 time_of_day,
    count(*) as total_sales
from wmsales
where day_name = "Sunday"
group by time_of_day
order by total_sales desc;

-- Which of the customer types brings the most revenue?
 select `Customer type` , sum(total) as Revenue from walmartsales.sales group by  `Customer type` ;  
 
 -- Which city has the largest tax percent/ VAT (**Value Added Tax**)?
 select city , sum(`Tax 5%`)  as tttax from walmartsales.sales group by city;
 
-- Which customer type pays the most in VAT?
select `Customer type` , sum(`Tax 5%`)  as tttax from walmartsales.sales group by `Customer type`;

-- How many unique customer types does the data have?
select distinct(`Customer type`) from walmartsales.sales;  

-- How many unique payment methods does the data have?
select distinct(payment) from walmartsales.sales;

-- What is the most common customer type?
select `Customer type`, count(*) from walmartsales.sales group by `Customer type` ;

-- Which customer type buys the most?
select `Customer type`, count(*) from walmartsales.sales group by `Customer type` ;

-- What is the gender of most of the customers?

select Gender, count(*) from walmartsales.sales group by gender;

-- What is the gender distribution per branch?
select  Gender , count(*) from walmartsales.sales where branch = 'A' group by Gender;
select  Gender , count(*) from walmartsales.sales where branch = 'B' group by Gender;
select  Gender , count(*) from walmartsales.sales where branch = 'C' group by Gender;

------ $ total(gross_sales) 
select
 sum(VAT+cogs) as total_grass_sales
from  wmsales;
----- gross profit-----------
SELECT 
 (SUM(VAT + COGS) - COGS) 
FROM wmsales;

SELECT (SUM(ROUND(VAT, 2) + COGS) - COGS) FROM wmsales;


