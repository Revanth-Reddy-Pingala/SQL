use MyDatabase;
-- This is a comment
/* This is a 
multiline comment */

-- Retrieve all customer data
Select * from customers;

-- Retrieve all order data
Select * from orders;

-- Select few columns
-- Retrieve each customer's name, country and score
Select first_name,country,score from customers; 

-- WHERE clause -> Filter your data
-- Retrieve customers with a score not equal to zero
Select * from customers where score!=0;

-- Retrieve customers from Germany
Select * from customers where country='Germany';

-- Order By -> sort your data, default ASC, but it's better to write ASC for clarity
-- ASC -> Lowest to Highest, DESC -> Highest to Lowest
-- Retrieve all customers and sort the results by the highest score first
Select * from customers ORDER BY Score DESC;

-- Retrieve all customers and sort the results by the lowest score first
Select * from customers ORDER BY Score ASC;

-- Nested Order by
-- Retrieve all the customers and sort the results by the country and then by the highest score
Select * 
from customers 
Order by Country ASC, score DESC;

-- Group By --> Aggregate your data
-- Find the toatal score for each country
SELECT 
	country,
	SUM(score) AS total_score
FROM customers
GROUP BY country;

-- The result of Group By determined by the unique values of the grouped columns
SELECT 
	country,
	SUM(score) AS total_score
FROM customers
GROUP BY country, first_name;

-- Find the total score and total number of customers for each country
Select country, sum(score) as total_score, count(id) as total_customers from customers group by country;

-- Having clause -> filter aggregated data -> can be used only with group by

/* Find the average score for each country considering only customers with a score not equal to 0
   and return only those countries with an average score greater than 430 */
Select country, avg(score) as average_score from customers where score !=0 group by country having avg(score)>430;

-- Distinct -> Remove duplicates -> each value appears only once
-- Select unique list of all countries
Select Distinct country from customers;
-- Don't use distinct unless it's necessary, it can slow down query

-- Top -> limit your data
-- Retrieve only 3 customers
Select * from customers limit 3;

/* My SQL syntax:
SELECT * FROM customers LIMIT 3;

SQL Server: 
SELECT TOP 3 * FROM customers;*/

-- Retrieve top 3 customers with highest score
Select * from customers order by score desc limit 3;

-- Retrieve the lowest 2 customers based on score
Select * from customers order by score asc limit 2;

-- Get the two most recent orders
Select * from orders;
Select * from orders order by order_date DESC limit 2;

-- Execution Order vs Coding Order
/* Coding Order of Query
Select Distinct 		-> Filter columns, duplicates
	col 1,
	sum(col 2)
from table
where col = 10			-> Filter rows before aggregations
group by col 1
having sum(col 2)>30	-> Filter rows after aggregations
order by col 1 ASC
limit 2;				-> Filter result rows
*/

/* Execution Order
from
where
group by
having
select distinct
order by
limit/top
*/