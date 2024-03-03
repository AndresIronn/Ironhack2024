# Lab | SQL Queries 4

### Instructions

-- 1. Get film ratings.
-- 2. Get release years.
-- 3. Get all films with ARMAGEDDON in the title.
-- 4. Get all films with APOLLO in the title
-- 5. Get all films which title ends with APOLLO.
-- 6. Get all films with word DATE in the title.
-- 7. Get 10 films with the longest title.
-- 8. Get 10 the longest films.
-- 9. How many films include **Behind the Scenes** content?
-- 10. List films ordered by release year and title in alphabetical order.

-- 1
use sakila;
select distinct rating from film;

-- 2
select distinct release_year from film;

-- 3
select title from film
where title regexp 'armageddon';

-- 4
select title from film
where title regexp 'apollo';

-- 5
select title from film
where title regexp 'apollo$';

-- 6
select title from film
where title like '%date%';

-- 7
select title from film
order by length(title) desc
limit 10;

-- 8
select title from film
order by length desc
limit 10;

-- 9
select count(*) from film
where special_features like '%behind the scenes%';

-- 10
select title, release_year from film
order by title, release_year;

/*
Creo que no era necesario poner release_year en el order by porque en la pregunta 2 se ve que todas las películas son del año 2006.
select title, release_year from film
order by title;
/*
