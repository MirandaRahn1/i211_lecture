SELECT p.name
FROM pet AS p 
JOIN customer AS c ON c.id=p.owner
WHERE c.first_name='Chris' AND c.last_name='Fields';

SELECT c.first_name, c.last_name 
FROM customer AS c 
JOIN pet AS p on p.owner=c.id 
WHERE p.species='cat';

SELECT p.name 
FROM pet AS p 
WHERE p.dob BETWEEN '2020-01-01' AND '2020-05-31';

SELECT p.name 
FROM pet AS p 
WHERE p.price BETWEEN 20.00 AND 50.00; 

SELECT p.name
FROM pet as p
WHERE p.species IN ('cat', 'dog', 'hamster');

SELECT p.name
FROM pet as p
WHERE p.species = 'dog' OR p.species = 'cat' OR p.species='hamster';

SELECT first_name, last_name
FROM customer
WHERE phone like '312%';

SELECT c.first_name, c.last_name
FROM customer as c
JOIN pet as p on p.owner =c.id
WHERE p.dob BETWEEN '2021-05-01' AND '2021-05-31';

SELECT name
FROM pet
WHERE species in ('cat', 'dog') AND dob BETWEEN '2021-01-01'AND '2021-12-31'
ORDER BY dob DESC;
