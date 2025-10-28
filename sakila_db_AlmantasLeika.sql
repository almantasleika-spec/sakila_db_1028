
-- Display the first and last names of all actors from the table actor. 

/*SELECT
  first_name FirstName,
  last_name LastName
FROM `tc-da-1.sakila_db.actor`
ORDER BY last_name;*/

-- Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name.

/*SELECT UPPER(
  CONCAT(first_name, ' ', last_name)) ActorName
FROM `tc-da-1.sakila_db.actor`
ORDER BY ActorName;*/

-- Select the title, description, rating, movie length columns from the films table that last 3 hours or longer.

/*SELECT
  title Title,
  description Description,
  rating Rating,
  length Length
FROM `tc-da-1.sakila_db.film`
WHERE length > 180
ORDER BY title;*/

-- You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you use to obtain this information?
 
/*SELECT
 actor_id ActorID,
 first_name FirstName,
 last_name LastName
FROM `tc-da-1.sakila_db.actor`
WHERE first_name = 'JOE';*/

-- Find all actors whose last name contain the letters GEN:
 
/*SELECT *
FROM `tc-da-1.sakila_db.actor`
WHERE last_name LIKE '%GEN%'
ORDER BY last_name;*/
  

-- Find all actors whose last names contain the letters LI. This time, order the rows by last name and first name, in that order:
 
/*SELECT *
FROM `tc-da-1.sakila_db.actor`
WHERE last_name LIKE '%LI%'
ORDER BY 
  last_name,
  First_name;*/

-- Select all columns from the customer table for rows that have a last name beginning with "S" and a first name ending with "N".
 
/*SELECT *
FROM `tc-da-1.sakila_db.customer`
WHERE last_name LIKE 'S%' 
AND first_name LIKE '%N'
ORDER BY last_name;*/

-- Select all columns minus the password column from the staff table for rows that contain a password.
 
/*SELECT *
EXCEPT(password)
FROM `tc-da-1.sakila_db.staff`
WHERE password IS NOT NULL;*/

-- Select all columns minus the password column from the staff table for rows that do not contain a password.
 
/*SELECT *
EXCEPT(password)
FROM `tc-da-1.sakila_db.staff`
WHERE password IS NULL;*/

-- Using IN, display the country_id and country columns of the following countries: Afghanistan, Bangladesh, and China:
 
/*SELECT
  country_id CountryID,
  country Country
FROM `tc-da-1.sakila_db.country`
WHERE country IN ('Afghanistan', 'Bangladesh', 'China')
ORDER BY country*/

-- Select all columns from the film table for films rated G, PG-13 or NC-17.
 
/*SELECT *
FROM `tc-da-1.sakila_db.film`
WHERE rating IN ('G', 'PG-13', 'NC-17')*/

-- Select the payment id, amount, and payment date columns from the payment table for payments made on 05/25/2005, 05/27/2005, and 05/29/2005. (Use the IN operator and the DATE function,)
 
/*SELECT
  payment_id PaymentID,
  amount Amount,
  payment_date PaymentDate
FROM `tc-da-1.sakila_db.payment`
WHERE DATE(payment_date) IN ('2005-05-25', '2005-05-27', '2005-05-29')
ORDER BY payment_date;*/

-- Select all columns from the payment table for payments made between midnight 05/25/2005 and 1 second before midnight 05/26/2005. (Use BETWEEN operator)
 
/*SELECT *
FROM `tc-da-1.sakila_db.payment`
WHERE payment_date BETWEEN '2005-05-25 00:00:00' AND '2005-05-25 23:59:59'
ORDER BY payment_date;*/

-- Select all distinct ratings from the film table ordered by rating in descending order.
 
/*SELECT DISTINCT(rating) 
FROM `tc-da-1.sakila_db.film`
ORDER BY rating DESC;*/

-- List the last names of actors, as well as how many actors have that last name.
 
/*SELECT
  last_name LastName,
  COUNT(*) ActorCount
FROM `tc-da-1.sakila_db.actor`
GROUP BY last_name
ORDER BY
  ActorCOunt DESC,
  last_name;*/

-- How many distinct actors last names are there?
 
/*SELECT COUNT(DISTINCT last_name) NoDistinctNames
FROM `tc-da-1.sakila_db.actor`;*/

-- Which actors last names are not repeated?
 
/*SELECT last_name LastName
FROM `tc-da-1.sakila_db.actor`
GROUP BY last_name
HAVING COUNT(*) = 1
ORDER BY last_name*/

-- List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
 
/*SELECT 
  last_name LastName,
  COUNT(*) Number
FROM `tc-da-1.sakila_db.actor`
GROUP BY last_name
HAVING COUNT(*) >= 2
ORDER BY Number DESC;*/

-- What is that average length of all the films in the sakila DB?
 
/*SELECT ROUND(AVG(length)) AvgFilmDuration
FROM `tc-da-1.sakila_db.film`;*/

-- The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS. Write a query to fix the record.
 
/*UPDATE `tc-da-1.sakila_db.actor`
SET first_name = 'HARPO'
WHERE first_name = 'GROUCHO'
  AND last_name = 'WILLIAMS';*/

-- The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.
 
/*SELECT 
  film.title FilmTitle,
  language.name Language
FROM `tc-da-1.sakila_db.film` film
JOIN `tc-da-1.sakila_db.language` language
ON film.language_id = language.language_id
WHERE (title LIKE 'K%'
  OR title LIKE 'Q%')
  AND name = 'English'
ORDER BY film.title;*/

-- Use subqueries to display all actors who appear in the film Alone Trip.
 
/*SELECT *
FROM `tc-da-1.sakila_db.actor`
WHERE actor_id IN (
  SELECT actor_id
  FROM `tc-da-1.sakila_db.film_actor`
  WHERE film_id IN (
    SELECT film_id
    FROM `tc-da-1.sakila_db.film`
    WHERE title = 'Alone Trip'
  )
);*/

/*SELECT
  actor.first_name FirstName,
  actor.last_name LastName,
  film.title FilmTitle
FROM `tc-da-1.sakila_db.actor` actor
JOIN `tc-da-1.sakila_db.film_actor` filmactor
ON actor.actor_id = filmactor.actor_id
JOIN `tc-da-1.sakila_db.film` film
ON filmactor.film_id = film.film_id
WHERE film.title = 'Alone Trip'*/

 --films_exercises.sql
--Pateikiama „films_exercises.sql“;