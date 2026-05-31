drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discount_percent NUMERIC(5,2),
available_quantity INTEGER,
discounted_sellingprice NUMERIC(8,2),
weight_in_grams INTEGER,
out_of_stock BOOLEAN,
quantity INTEGER
);

--Data Exploration

--Count of Rows
select count(*) from zepto;

---Sample Data
select * from zepto limit 10;

--Null Values
select * from zepto
where category is null
or
name is null
or
mrp is null
or
discount_percent is null
or
available_quantity is null
or
discounted_sellingprice is null
or
weight_in_grams is null
or
out_of_stock is null
or
quantity is null

--Different Products Categories
select distinct category
from zepto
order by category

--Products in Stock vs Out of Stock
select out_of_stock, count(sku_id)
from zepto
group by out_of_stock
select * from zepto

--Product names present multiple times
select name, count(sku_id) as "Number of SKUs"
from zepto
group by name
having count(sku_id)>1
order by count(sku_id) desc

--Data Cleaning

--Products with Price 0
select * from zepto
where mrp = 0 or discounted_sellingprice = 0

delete from zepto where mrp = 0

--Convert Paise to Rupees
update zepto
set mrp = mrp/100.0, discounted_sellingprice = discounted_sellingprice/100.0

select mrp,discounted_sellingprice from zepto

--Q1. Find the top 10 best-value products based on the discount percentage.
select distinct name,mrp,discount_percent
from zepto
order by discount_percent desc
limit 10

--Q2. What are the Products with High MRP but Out of Stock
select distinct name,mrp
from zepto
where out_of_stock = TRUE and mrp>300
order by mrp desc

--Q3. Calculate Estimated Revenue for each category
select category,
sum(discounted_sellingprice * available_quantity) AS Total_Revenue
from zepto
group by category
order by Total_Revenue

--Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
select distinct name,mrp,discount_percent
from zepto
where mrp > 500 and discount_percent < 10
order by mrp desc, discount_percent desc
select * from zepto

--Q5. Identify the top 5 categories offering the highest average discount percentage.
select category,
round(avg(discount_percent),3) as avg_discount 
from zepto
group by category
order by avg_discount desc
limit 5

--Q6. Find the price per gram for products above 100g and sort by best value.
select distinct name, weight_in_grams, discounted_sellingprice,
ROUND(discounted_sellingprice/weight_in_grams,2) AS price_per_gram
from zepto
where weight_in_grams >= 100
order by price_per_gram

--Q7. Group the products into categories like Low, Medium, Bulk.
select distinct name, weight_in_grams,
case when weight_in_grams > 1000 then 'Low'
	when weight_in_grams < 5000 then 'Medium'
	else 'Bulk'
	end as weighted_category
from zepto

--Q8. What is the Total Inventory Weight Per Category
select category,
sum(weight_in_grams * available_quantity) AS total_weight
from zepto
group by category
order by total_weight




