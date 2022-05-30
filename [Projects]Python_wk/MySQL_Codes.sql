-- selecting a database-
use sql_store;

-- selects all from the customers table.
select * from customers;
-- where customer_id=1
-- order by first_name;

--  can  add arithmetic operations to columns
-- +,-,*,/, modulo (%). Order of opertion is preserved like in math

SELECT 
	last_name, 
	first_name, 
    points ,
    (points+10)*100 as 'discount factor',-- we can rename the column tag with as, for the result.
    points % 1
FROM customers;

-- returns the unique values
select distinct state 
from customers;

select * 
from sql_store.customers;

-- reutrn all the products
select 
	name,
    unit_price,
    unit_price*1.1 as 'new price'
from products;

-- where clause
select *
from customers
where points >3000; 
-- operators on sql
-- >, >=, <,<=, =,1= or <>

-- is not case sensitive
select *
from customers 
where state = 'va';-- use the <> to get the not values of va.

-- for dates
select *
from customers 
where birth_date> '1990-01-01';

-- orders placed this year
select * 
from orders
where order_date >= '2019-01-01';

-- New section
--
--

-- Logical operators AND, OR and NOT
-- AND both conditions need to be true
select *
from customers
where birth_date > '1990-01-01' and points > 1000;

-- OR, one needs to be true
select *
from customers
where birth_date > '1990-01-01' or points > 1000;

-- combining AND , OR, the order of the operators is conserved 
-- AND goes firs than OR
-- 1st_cdnt OR 2nd_cdnt also 1st_cdnt AND 2nd_cndt 
select *
from customers
where birth_date > '1990-01-01' or points > 1000 
and state = 'va';

-- to change (override) the order use parenthesis ()
-- this is the same as above but with ()
select *
from customers
where birth_date > '1990-01-01' or 
(points > 1000 and state = 'va');

-- NOT operator negates the conditions
select *
from customers
where not (birth_date > '1990-01-01' or points > 1000);

-- New section
--

-- the IN operator, select the values from the string ib
select * 
from customers
where state in ('va','fl','ga');
-- to get the inverse result use not in

-- New section
--
-- Between operator, to select from a range of values
select *
from customers
where points between 1000 and 3000;

-- with dates
select *
from customers
where birth_date between '1990-01-01' and '2000-01-01';

-- New section
--
-- Like operator, selects strings that match a pattern
select *
from customers
where last_name like 'b%';
-- represents the names that have any charachters past 
-- the letter  b.

select *
from customers
where last_name like 'brush%';

-- how have an e character before and after 
select *
from customers
where last_name like '%e%';

-- to specify a single character us _
-- selects the name that has exactly 5 character long and
-- finishes with a y
select *
from customers
where last_name like '_____y';

-- to specify  exactly b and 4 character long and
-- finishes with a y
select * 
from customers
where last_name like 'b____y';


-- New section
-- 
-- The REGEXP regular expression
-- begining of a string ^
-- end of a string $
-- with a |(or), mutliple patterns or alternatives
select *
from customers
where last_name regexp 'fiel|mac|rose';

-- select the strings that match having ge,ie,me with brackets []
-- the but with the e first, 'e[gim]'
select *
from customers
where last_name regexp '[gim]e';

-- elemtns that have character from a to h, [a-h]e
select *
from customers
where last_name regexp '[a-h]e';

-- ^ beginning
-- $ end
-- | logical or
-- [abcd] match chars within the brackets
-- [a-f] match chars from the interval

-- New section
--
-- ORDER BY orders by the primary key by default
-- unless it is specified otherwise  
-- reverse the sort order DESC
select *
from customers
order by first_name;

-- sort data with alias
select first_name, last_name, 10 as points
from customers
order by first_name;

-- excercise woth operations and alias, in desc order
select *, quantity*unit_price as total_price
from order_items
where order_id = 2
order by total_price desc;

-- New section
--

-- LIMIT the resutls of a query
-- limits results to 3
select * 
from customers
limit 3;

-- adding an offset, skip the 1st 6 records and show the remaining 3
select * 
from customers
limit 6,3;

-- Nes section
--

-- Inner Joins, combines two results
SELECT * 
FROM orders
inner join customers 
	on orders.customer_id = customers.customer_id;








