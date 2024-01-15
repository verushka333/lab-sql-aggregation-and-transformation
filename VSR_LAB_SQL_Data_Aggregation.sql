USE sakila;
-- Question 1

Select max(length) AS 'MAX LENGTH', 
min(length) AS 'MIN LENGTH', round(avg(length)) as 'Average length' 
from film;

Select floor(avg(length)/60) as 'Average hour',
floor(avg(length)%60) as 'average min',
concat(floor(avg(length)/60), 'h', floor(avg(length)%60), 'min') AS avg_time 
from film;

-- Question 2

select 
max(rental_date) - min(rental_date), 
datediff(max(rental_date), MIN(rental_date)) from rental;

select *, 
DayName(rental_date),
MonthName(rental_date),
Month(rental_date),
Weekday(rental_date),
date_format(rental_date,'%M'),
date_format(rental_date,'%W'),
CASE
	WHEN Weekday(rental_date)<5 then 'Workday'
    WHEN weekday(rental_date)>=5 then 'Weekend'
Else
	'Not a weekday at all'
END AS day_type,
IF(Weekday(rental_date)<5,'Wordday','Weekend') AS day_type
from rental;

-- Question 3
SELECT
title,
IFNULL(rental_duration, 'Not available'),
CASE WHEN rental_duration is null then 'Not available' ELSE rental_duration END,
IF(rental_duration is null, 'Not available', rental_duration)
From film;
 
-- Bono
Select Concat(first_name,' ',last_name),
left(email,3),
substring(email,1,3) 
from customer;

-- Bono 2
select count(*) from film;
select distinct rating from film;
select count(*) from film where rating = 'PG';
select count(*) from film where rating = 'G';
select rating, count(*) from film Group BY rating order by count(*) desc;

-- BONO 2
select round(avg(length)) from film;
select rating, round(avg(length)) from film group by rating order by round(avg(length)) desc;

Select
	rating,
    round(avg(length))
from
	film
group by rating
Having floor(avg(length)/60)>=2
Order by round(avg(length)) desc;

SELECT last_name FROM actor;
SELECT COUNT(*) FROM actor WHERE last_name = 'AKROYD';
​
SELECT 
last_name
FROM actor 
group by last_name
HAVING COUNT(*) = 1;

