use dannys_diner_cs1;
CREATE TABLE sales (
  customer_id VARCHAR(1),
  order_date DATE,
  product_id INTEGER
);
INSERT INTO sales
  (customer_id, order_date, product_id)
VALUES
  ('A', '2021-01-01', '1'),
  ('A', '2021-01-01', '2'),
  ('A', '2021-01-07', '2'),
  ('A', '2021-01-10', '3'),
  ('A', '2021-01-11', '3'),
  ('A', '2021-01-11', '3'),
  ('B', '2021-01-01', '2'),
  ('B', '2021-01-02', '2'),
  ('B', '2021-01-04', '1'),
  ('B', '2021-01-11', '1'),
  ('B', '2021-01-16', '3'),
  ('B', '2021-02-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-07', '3');
CREATE TABLE menu (
  product_id INTEGER,
  product_name VARCHAR(5),
  price INTEGER
);
INSERT INTO menu
  (product_id, product_name, price)
VALUES
  ('1', 'sushi', '10'),
  ('2', 'curry', '15'),
  ('3', 'ramen', '12');
CREATE TABLE members (
  customer_id VARCHAR(1),
  join_date DATE
);
INSERT INTO members
  (customer_id, join_date)
VALUES
  ('A', '2021-01-07'),
  ('B', '2021-01-09');
  
----------- Case Study Questions ------------
-- What is the total amount each customer spent at the restaurant?

Select  customer_id , sum(price) as Total_Amount
from dannys_diner_cs1.sales , dannys_diner_cs1.menu
where sales.product_id = menu.product_id
group by customer_id;

-- How many days has each customer visited the restaurant?

select customer_id , count(distinct(order_date)) as Number_of_dates 
from dannys_diner_cs1.sales
group by customer_id;

-- What was the first item from the menu purchased by each customer?

with temp1 as(
select customer_id, order_date, product_name,
row_number() over( partition by customer_id order by  order_date) as "rank"
from sales s , menu m
where s.product_id = m.product_id
)

select customer_id, product_name
from temp1
where "rank" = 2;

-- What is the most purchased item on the menu and how many times was it purchased by all customers?

select product_name, count(s.product_id) as counting 
from menu m , sales s
where m.product_id = m.product_id
group by product_name;

-- Which item was the most popular for each customer?

select product_name, count(s.product_id) as counting 
from menu m , sales s
where m.product_id = m.product_id
group by product_name;

-- Which item was purchased first by the customer after they became a member?

select s.customer_id , s.order_date , m.product_name , mb.join_date
from sales s , menu m , members mb
where  s.order_date >= mb.join_date and s.customer_id ="A" 
order by s.customer_id
limit 1
;
select s.customer_id , s.order_date , m.product_name , mb.join_date
from sales s , menu m , members mb
where  s.order_date >= mb.join_date and s.customer_id ="B" 
order by s.customer_id
limit 1
;
select s.customer_id , s.order_date , m.product_name , mb.join_date
from sales s , menu m , members mb
where  s.order_date >= mb.join_date and s.customer_id ="C" 
order by s.customer_id
limit 1
;

-- Which item was purchased just before the customer became a member?

select s.customer_id , s.order_date , m.product_name , mb.join_date
from sales s , menu m , members mb
where  s.order_date <= mb.join_date and s.customer_id ="A" 
order by s.customer_id
limit 1
;
select s.customer_id , s.order_date , m.product_name , mb.join_date
from sales s , menu m , members mb
where  s.order_date <= mb.join_date and s.customer_id ="B" 
order by s.customer_id
limit 1
;
select s.customer_id , s.order_date , m.product_name , mb.join_date
from sales s , menu m , members mb
where  s.order_date <= mb.join_date and s.customer_id ="C" 
order by s.customer_id
limit 1
;

-- What is the total items and amount spent for each member before they became a member?

SELECT 
s.customer_id,
COUNT(s.product_id) AS items,
SUM(m.price) AS spent
FROM
sales s,
members mem,
menu m
WHERE
mem.customer_id = s.customer_id
AND m.product_id = s.product_id
AND order_date < join_date GROUP BY s.customer_id;	

-- If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

select customer_id,
sum( Case
when s.product_id = 1 Then m.price * 2
else m.price * 10
end 
) as total

from sales s , menu m
where 
m.product_id = s.product_id
group by customer_id;

-- Join All The Things, Danny also requires further information about the ranking of customer products, but he purposely does not need the ranking for non-member purchases so he expects null ranking values for the records when customers are not yet part of the loyalty program.

with join_all_data as(
SELECT
s.customer_id,
m.product_name,
m.price,
s.order_date,
mem.join_date,
CASE
WHEN s.order_date >= mem.join_date THEN "Yes"
ELSE "No"
END as member_status
FROM
menu m,
sales s
left join members mem
on
s.customer_id=mem.customer_id
WHERE
m.product_id=s.product_id
)

SELECT * FROM join_all_data;



#select * from sales;
#select * from menu;
#select * from members;


