SHOW DATABASES;
USE sakila;
SHOW TABLES;

#1. Actores que tienen de primer nombre ‘Scarlett’.
SELECT FROM actor WHERE first_name = 'Scarlett'2. Actores que tienen de apellido ‘Johansson’.

#2. Actores que tienen de apellido ‘Johansson’.
SELECT * FROM actor WHERE last_name = "Johansson" ORDER BY first_name;

#3. Actores que contengan una ‘O’ en su nombre.
SELECT * FROM actor WHERE first_name LIKE "%O%";

#4. Actores que contengan una ‘O’ en su nombre y en una ‘A’ en su apellido.
SELECT * FROM actor WHERE first_name LIKE "%O%" AND last_name LIKE "%A%";

#5. Actores que contengan dos ‘O’ en su nombre y en una ‘A’ en su apellido.
SELECT * FROM actor WHERE first_name LIKE "%O%O%" AND last_name LIKE "%A%";

#6. Actores donde su tercera letra sea ‘B’.
SELECT * FROM actor WHERE first_name LIKE "___O%"; 

#7. Ciudades que empiezan por ‘a’.
SELECT * FROM city WHERE city LIKE "A%";

#8. Ciudades que acaban por ‘s’.
SELECT * FROM city WHERE city LIKE "%S";

#9. Ciudades del country 61.
SELECT * FROM city WHERE country_id = 61;

#10. Ciudades del country ‘Spain’.
SELECT * FROM city AS ci JOIN country AS co ON ci.country_id=co.country_id WHERE co.country = "Spain";

#11. Ciudades con nombres compuestos.
SELECT * FROM city WHERE city LIKE "% %";

#12. Peliculas con una duracion entre 80 y 100.
SELECT film_id, title, length FROM film WHERE length BETWEEN 80 AND 100;
SELECT film_id, title, length FROM film WHERE length>= 80 AND length<=100;

#13. Peliculas con un rental_rate entre 1 y 3.
SELECT film_id, title, rental_rate FROM film WHERE rental_rate BETWEEN 1 AND 3;

#14.Peliculas con un titulo de más de 12 letras.
SELECT film_id, title FROM film WHERE CHAR_LENGTH(title) > 12;

#15.Peliculas con un rating de PG o G.
SELECT film_id, title,rating FROM film WHERE rating = 'PG' OR rating = 'G';

#16. Peliculas que no tengan un rating de NC-17.
SELECT film_id, title, rating FROM film WHERE rating != 'NC-17';

#17. Peliculas con un rating PG y duracion de más de 120.
SELECT * FROM film WHERE rating = 'PG' AND length > 120;

#18. ¿Cuantos actores hay?
SELECT COUNT(*) AS total_actores FROM actor;

#19. ¿Cuantas ciudades tiene el country ‘Spain’?
SELECT COUNT(*) AS total_ciudades FROM city
WHERE country_id = (
    SELECT country_id FROM country WHERE country = 'Spain'
);

#20. ¿Cuantos countries hay que empiezan por ‘a’?
SELECT COUNT(*) AS total_countries FROM country WHERE country LIKE 'A%';


#21. Media de duración de peliculas con PG.
SELECT AVG(length) AS duracion_media FROM film WHERE rating = 'PG';

#22. Suma de rental_rate de todas las peliculas.
SELECT SUM(rental_rate) AS suma_rental_rate FROM film;

#23. Pelicula con mayor duración.
SELECT title, length AS duracion from film WHERE length = (SELECT MAX(length) from film);

#24. Pelicula con menor duración.
SELECT title, length AS duracion from film WHERE length = (SELECT MIN(length) from film);

#25. Mostrar las ciudades del country Spain (multitabla).
SELECT city.city_id, city.city, country.country
FROM city
JOIN country ON city.country_id = country.country_id
WHERE country.country = 'Spain';

#26. Mostrar el nombre de la película y el nombre de los actores.
SELECT film.title, actor.first_name, actor.last_name
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id;

#27. Mostrar el nombre de la película y el de sus categorías.
SELECT film.title, category.name
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id;

#28. Mostrar el country, la ciudad y dirección de cada miembro del staff.
SELECT country.country, city.city, address.address
FROM staff
JOIN address ON staff.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id;

#29. Mostrar el country, la ciudad y dirección de cada customer.
SELECT country.country, city.city, address.address
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id;

#30. Numero de peliculas de cada rating
SELECT rating, COUNT(*) AS total_peliculas
FROM film
GROUP BY rating;

#31. Cuantas peliculas ha realizado el actor ED CHASE.
SELECT COUNT(*) AS total_peliculas
FROM film_actor
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE actor.first_name = 'ED' AND actor.last_name = 'CHASE';

#32. Media de duracion de las peliculas cada categoria.
SELECT category.name, AVG(film.length) AS duracion_media
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name;

