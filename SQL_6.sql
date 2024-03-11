### Instructions

-- 1. Rank films by length (filter out the rows with nulls or zeros in length column). Select only columns title, length and rank in your output.
-- 2. Rank films by length within the `rating` category (filter out the rows with nulls or zeros in length column). In your output, only select the columns title, length, rating and rank.  
-- 3. How many films are there for each of the categories in the category table? **Hint**: Use appropriate join between the tables "category" and "film_category".
-- 4. Which actor has appeared in the most films? **Hint**: You can create a join between the tables "actor" and "film actor" and count the number of times an actor appears.
-- 5. Which is the most active customer (the customer that has rented the most number of films)? **Hint**: Use appropriate join between the tables "customer" and "rental" and count the `rental_id` for each customer.
-- 6. List the number of films per category.
-- 7. Display the first and the last names, as well as the address, of each staff member.
-- 8. Display the total amount rung up by each staff member in August 2005.
-- 9. List all films and the number of actors who are listed for each film.
-- 10. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
-- 11. Write a query to display for each store its store ID, city, and country.
-- 12. Write a query to display how much business, in dollars, each store brought in.
-- 13. What is the average running time of films by category?
-- 14. Which film categories are longest?
-- 15. Display the most frequently rented movies in descending order.
-- 16. List the top five genres in gross revenue in descending order.
-- 17. Is "Academy Dinosaur" available for rent from Store 1?


use sakila;
-- 1
select title, length, rank() over (order by length desc) as 'Rank'
from sakila.film
where length is not null and length!=0;

-- 2
select title, length, rating, rank() over (partition by rating order by length desc) as 'Rank'
from sakila.film
where length is not null and length!=0;

-- 3
select * from film_category;
select * from category;

SELECT 
    COUNT(f.film_id), c.name, c.category_id
FROM
    sakila.film_category f
        JOIN
    sakila.category c ON f.category_id = c.category_id
GROUP BY c.category_id;
    
    
    
-- 4
select * from actor;
select * from film_actor;


SELECT 
    COUNT(f.film_id) as cantidad, a.first_name, a.last_name, a.actor_id
FROM
    sakila.actor a
        JOIN
    sakila.film_actor f ON a.actor_id = f.actor_id
GROUP BY a.actor_id
ORDER BY cantidad desc
limit 1;

-- 5

select * from customer;
select * from rental;

SELECT 
    COUNT(r.rental_id) as contador, c.first_name, c.last_name, c.email
FROM
    sakila.customer c
        JOIN
    sakila.rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY contador desc
limit 1;
    
    
-- 6
-- Misma respuesta que en (3).

SELECT 
    COUNT(f.film_id), c.name, c.category_id
FROM
    sakila.film_category f
        JOIN
    sakila.category c ON f.category_id = c.category_id
GROUP BY c.category_id;

-- 7

select first_name, last_name, address_id from staff;

-- 8

select * from payment;

SELECT 
    s.staff_id,
    s.first_name,
    s.last_name,
    SUM(p.amount) AS total
FROM
    payment p
        JOIN
    staff s ON p.staff_id = s.staff_id
WHERE
    p.payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY s.staff_id , s.first_name , s.last_name
ORDER BY total DESC;

-- 9
select * from actor;
select * from film; 
select * from film_actor;

-- No es necesario incluir la tabla actor en el join porque no necesito el nombre de los actores. Por lo que solo voy a unir las otras 2.


SELECT 
    COUNT(fa.actor_id) as Nr_of_Actors, f.title
FROM
    sakila.film f
        JOIN
    sakila.film_actor fa ON f.film_id = fa.film_id
GROUP BY f.title
order by Nr_of_Actors desc;

-- 10
select * from customer;
select * from payment;

SELECT 
    SUM(p.amount), c.first_name, c.last_name
FROM
    sakila.payment p
        JOIN
    sakila.customer c ON p.customer_id = c.customer_id
GROUP BY c.first_name , c.last_name
ORDER BY c.last_name;

-- 11
select * from store;

select * from address;
select * from city;
select * from country;


    
SELECT 
    s.store_id, ci.city, co.country
FROM
    sakila.store s
        JOIN
    sakila.address a ON s.address_id = a.address_id
        JOIN
    sakila.city ci ON a.city_id = ci.city_id
        JOIN
    sakila.country co ON ci.country_id = co.country_id;
    
-- 12
SELECT 
    SUM(p.amount) AS store_revenue, s.store_id
FROM
    sakila.payment p
        JOIN
    sakila.staff s ON p.staff_id = s.staff_id
GROUP BY s.store_id;

-- 13

SELECT 
    c.name AS Category_Name,
    AVG(f.length) AS Average_Running_Time
FROM
    sakila.film f
        JOIN
    sakila.film_category fc ON f.film_id = fc.film_id
        JOIN
    sakila.category c ON fc.category_id = c.category_id
GROUP BY c.name;

-- 14
select * from film_category;
select * from category;
select * from film;


SELECT 
    c.name AS category_name, AVG(f.length) AS average_duration
FROM
    film_category fc
        JOIN
    film f ON fc.film_id = f.film_id
        JOIN
    category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY average_duration DESC;


-- 15
SELECT 
    COUNT(f.title) AS contt, f.title
FROM
    sakila.payment p
        JOIN
    sakila.rental r ON p.rental_id = r.rental_id
        JOIN
    sakila.inventory i ON r.inventory_id = i.inventory_id
        JOIN
    sakila.film f ON i.film_id = f.film_id
GROUP BY f.title
ORDER BY contt DESC
LIMIT 6;

-- 16
SELECT 
    c.name AS genre, SUM(p.amount) AS gross_revenue
FROM
    sakila.payment p
        JOIN
    sakila.rental r ON p.rental_id = r.rental_id
        JOIN
    sakila.inventory i ON r.inventory_id = i.inventory_id
        JOIN
    sakila.film_category fc ON i.film_id = fc.film_id
        JOIN
    sakila.category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY gross_revenue DESC
LIMIT 5;

-- 17
SELECT 
    *
FROM
    film f
        JOIN
    inventory i ON i.film_id = f.film_id
WHERE
    i.store_id = 1
        AND f.title = 'Academy Dinosaur';