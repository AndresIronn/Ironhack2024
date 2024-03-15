### Instructions

-- 1. How many copies of the film _Hunchback Impossible_ exist in the inventory system?
-- 2. List all films whose length is longer than the average of all the films.
-- 3. Use subqueries to display all actors who appear in the film _Alone Trip_.
-- 4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
-- 5. Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
-- 6. Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
-- 7. Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments.
-- 8. Get the `client_id` and the `total_amount_spent` of those clients who spent more than the average of the `total_amount` spent by each client.

use sakila;

-- 1
select count(*), title
from (
select i.*, f.title
from inventory i
join film f on i.film_id = f.film_id
where f.title='hunchback impossible'
) sub1;

-- Si no se pone sub1 no se ejecuta el código.

-- 2
select title, length from film
where length > (select avg(length)
from film)
order by length desc;

-- 3
-- Las preguntas 3, 4 y 5 se van a resolver de forma análoga usando el comando IN.

select first_name, last_name
from actor
where actor_id in (
select actor_id
from film_actor
where film_id in (
select film_id
from film
where title ='alone trip'));

-- 4
select title
from film
where film_id in (
select film_id
from film_category
where category_id in (
select category_id
from category
where name='family' 
))limit 6;

-- 5
-- With subqueries
select first_name, last_name, email 
from customer
where address_id in (
select address_id
from address
where city_id in (
select city_id
from city
where country_id in (
select country_id
from country
where country = 'canada')));

-- With joins
select c.first_name, c.last_name, c.email
from customer c
join address a on c.address_id = a.address_id
join city ci on a.city_id = ci.city_id
join country co on ci.country_id = co.country_id
where co.country = 'canada';

-- 6
/*
Most prolific actor:
select actor_id, count(*) as contador
from film_actor
group by actor_id
order by contador desc
limit 1;
*/

select f.film_id, f.title
from film f
join film_actor fa on f.film_id = fa.film_id
where fa.actor_id = (
select actor_id
from film_actor
group by actor_id
order by count(*) desc
limit 1);

-- 7     
select f.title
from film f
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
join payment p on r.rental_id = p.rental_id
where p.customer_id = (
select customer_id
from payment
group by customer_id
having sum(amount) = (
select max(total_payments)
from (
select sum(amount) as total_payments
from payment
group by customer_id)
as sub8))
group by f.title;  

    
-- 8
select c.customer_id as client_id,
sum(p.amount) as total_amountt__
from customer c
join payment p on c.customer_id = p.customer_id
where c.customer_id in (
select customer_id
from payment
group by customer_id
having sum(amount) > (
select avg(total_amount)
from (select sum(amount) as total_amount
from payment
group by customer_id) as algo))
group by c.customer_id
order by total_amountt__ desc;