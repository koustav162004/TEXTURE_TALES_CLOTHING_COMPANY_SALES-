select * from product_details
select * from sales
select * from product_prices
select * from product_hierarchy


select s.txn_id, s.prod_id,s.price,pd.price,s.discount ,s.qty
from sales s 
inner join product_details pd  
on s.prod_id=pd.product_id
order by s.txn_id

--1.	What was the total quantity sold for all products?

select s.prod_id,pd.product_name,sum(s.qty) as total_quantity 
from sales s 
inner join product_details pd on s.prod_id=pd.product_id
group by s.prod_id,pd.product_name
order by total_quantity desc

2.	What is the total generated revenue for all products before discounts?

--total revenue before discounts
select sum(qty*price) as revenue from sales

-- revenue product wise before discounts

select s.prod_id,pd.product_name,sum(s.qty*s.price) as revenue 
from sales s 
inner join product_details pd on s.prod_id=pd.product_id
group by s.prod_id,pd.product_name
order by revenue desc

--3.	What was the total discount amount for all products?


--4.	How many unique transactions were there?

select count(distinct(txn_id)) as unique_txn from sales

--5.	What are the average unique products purchased in each transaction?

with cte as
(
select txn_id,count(distinct((prod_id)))as uc  
from sales 
group by txn_id 
order by txn_id
)
select round(avg(uc)) from cte 

--doubt 6.	What is the average discount value per transaction?

with cte as 
(
select txn_id,sum(discount) as dis_sum from sales group by txn_id
)
select round(avg(dis_sum)) from cte

--7.What is the average revenue for member transactions and non-member transactions?

with cte as 
(
select member,txn_id,sum(qty*price) as revenue
from sales 
group by member,txn_id
)
select member,round(avg(revenue),2) from cte group by member

8.	What are the top 3 products by total revenue before discount?

with cte as
(
select s.prod_id,pd.product_name,sum(s.qty*s.price) as revenue,
DENSE_RANK() OVER(ORDER BY sum(s.qty*s.price) DESC)
from sales s 
inner join product_details pd on s.prod_id=pd.product_id
group by s.prod_id,pd.product_name
order by revenue desc
)
select * from cte where dense_rank<=3

9.	What are the total quantity, revenue and discount for each segment?

select pd.segment_id,pd.segment_name,sum(s.qty)as quantity,sum(s.price*s.qty)as revenue,sum(s.price*s.qty*s.discount)/100 as  discount
from sales s 
inner join product_details pd on pd.product_id= s.prod_id
group by segment_id,segment_name

10.	What is the top selling product for each segment?

with cte as
(
select pd.segment_id,pd.segment_name,pd.product_id,pd.product_name,sum(s.qty)as quantity,
dense_rank()over(partition by segment_id order by sum(s.qty) desc) as dn
from sales s 
inner join product_details pd on pd.product_id= s.prod_id
group by segment_id,segment_name,pd.product_id,pd.product_name

)
select segment_name,product_name,quantity from cte where dn=1

11.	What are the total quantity, revenue and discount for each category?

select pd.category_id,pd.category_name,sum(s.qty)as quantity,sum(s.price*s.qty)as revenue,sum(s.price*s.qty*s.discount)/100 as  discount
from sales s 
inner join product_details pd on pd.product_id= s.prod_id
group by pd.category_id,pd.category_name

12.	What is the top selling product for each category?

select * from product_details
select * from sales

with cte as
(
select pd.category_id,pd.category_name,pd.product_id,pd.product_name,sum(s.qty)as quantity,
dense_rank()over(partition by category_id order by sum(s.qty) desc)as dn
from sales s
inner join product_details pd on pd.product_id= s.prod_id
group by pd.category_id,pd.category_name,pd.product_id,pd.product_name
)

select * from cte where dn=1

