/* 1. Use sakila database.
2. Get all the data from tables `actor`, `film` and `customer`.
3. Get film titles.
4. Get unique list of film languages under the alias `language`. Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
5.
  - 5.1 Find out how many stores does the company have?
  - 5.2 Find out how many employees staff does the company have? 
  - 5.3 Return a list of employee first names only?

6. Select all the actors with the first name ‘Scarlett’.
7. Select all the actors with the last name ‘Johansson’.
8. How many films (movies) are available for rent?
9. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
10. What's the average movie duration?
11. How many movies are longer than 3 hours?
12. What's the length of the longest film title? */

-- 1
use sakila;
-- 2
select * from actor;
select * from film;
select * from customer;

-- 3
select title from film;

-- 4
select distinct language_id as language from film;

-- 5
select count(*) from store;

select count(*) from staff;

select first_name from staff;

-- 6
select actor_id, first_name, last_name from actor
where first_name="Scarlett";

-- 7
select actor_id, first_name, last_name from actor
where last_name="Johansson";
select * from actor;

-- 8
select count(*) from film
where rental_duration>0;

-- 9
select max(length) as max_duration from film;
select min(length) as min_duration from film;

-- 10
select avg(length) from film;

-- 11
select count(*) from film
where length>180;

-- 12
select max(length(title)) from film;
