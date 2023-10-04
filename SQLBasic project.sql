1) Write a SQL query to count the number of characters except for the spaces for each actor.
 Return the first 10 actors name lengths along with their names.
 
Select * from actor

SELECT CONCAT(first_name, ' ', last_name) AS Full_Name,
LENGTH(REPLACE(CONCAT(first_name, last_name),' ', '')) AS Name_Length
FROM actor
LIMIT 10;

-- or

Select concat(First_name,' ',last_name),
Length(concat(First_name,last_name))
as actor_name  from actor 
limit 10;

-- or
Select First_name,last_name, length(trim(concat(first_name,last_name))) as length
from actor limit 10


#2) List all Oscar awardees(Actors who received the Oscar award) with their 
full names and the length of their names.

select * from actor_award

SELECT first_name,last_name,awards,
LENGTH(CONCAT(first_name,last_name)) AS name_length
from actor_award
where awards like '%oscar%'


3) Find the actors who have acted in the film ‘Frost Head.’

Select * from actor
Select * from Film_actor
Select * from Film

SELECT first_name,last_name,title
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
INNER JOIN film ON film.film_id = film_actor.film_id
WHERE title = 'Frost Head';

4) Pull all the films acted by the actor ‘Will Wilson.’

Select * from actor
Select * from Film_actor
Select * from film

SELECT first_name,last_name,title
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
INNER JOIN film ON film.film_id = film_actor.film_id
WHERE First_name  = 'Will' and last_name = 'Wilson';

5) Pull all the films which were rented and return them in the month of May.

Select * from rental 
Select * from inventory
select * from film


select Title,rental_date,return_date from rental
Join inventory on rental.inventory_id = inventory.film_id
join film on film.film_id = inventory.inventory_id
 WHERE monthname(rental_date) = 'May'
  AND monthname(return_date) = 'May';
  
  
  6) Pull all the films with ‘Comedy’ category.
  
  Select * from film
  Select * from Film_category
  select * from category
  
select title, name from film 
inner join film_category on film.film_id = film_category.film_id
inner join category on category.category_id = film_category.category_id
where name = 'comedy';















