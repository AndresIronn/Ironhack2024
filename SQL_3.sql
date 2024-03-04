# Lab | SQL Queries 3

-- Instructions

-- 1 How many distinct (different) actors' last names are there?
-- 2 In how many different languages where the films originally produced? (Use the column `language_id` from the `film` table)
-- 3 How many movies were released with `"PG-13"` rating?
-- 4 Get 10 the longest movies from 2006.
-- 5. How many days has been the company operating (check `DATEDIFF()` function)?
-- 6. Show rental info with additional columns month and weekday. Get 20.
-- 7. Add an additional column `day_type` with values 'weekend' and 'workday' depending on the rental day of the week.
-- 8. How many rentals were in the last month of activity?


-- 1
use sakila; 
select count(distinct(last_name)) from actor;

-- 2
select * from film;
select count(distinct language_id) from film;

-- 3
select count(rating) from film
where rating="PG-13";

-- 4
select title, release_year from film
where release_year=2006
order by length desc
limit 10;

-- 5
/*
Pongo 2 opciones por falta de conocimiento empresarial. 
De todas formas, los resultados son muy cercanos
*/

select datediff(max(last_update), min(payment_date)) from payment;
select datediff(max(last_update), min(rental_date)) from rental;

-- 6
select *, date_format(convert(rental_date,date), '%M') as Month, date_format(convert(rental_date,date), '%D') as Weekday 
from rental
limit 20;

-- 7
select *,
        case
            when dayname(rental_date) regexp '^(Saturday|Sunday)$' then 'weekend'
            else 'workday'
		end as day_type
from rental;
-- No vimos dayname() en clase pero está en la documentación.

-- 8
select date_format(rental_date, '%Y-%m-%d'), count(*) from rental
group by date_format(rental_date, '%Y-%m-%d')
order by date_format(rental_date, '%Y-%m-%d') desc
limit 1;

/*
En 2 querys, solo por verificación:
select max(rental_date) from rental;

select count(*) from rental
where rental_date >='2006-01-14 00:00:00'
and rental_date <='2006-02-14 23:59:59';
/*


