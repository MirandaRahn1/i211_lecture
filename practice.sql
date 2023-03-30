CREATE TABLE store
(
store_id INT(4),
city VARCHAR(20),
state CHAR(2),
zip INT(5)
) ENGINE=INNODB;

CREATE TABLE customer
(
id INT(3),
fname VARCHAR(15),
lname VARCHAR(15),
gender CHAR(2),
phone CHAR(12)
) ENGINE=INNODB;

CREATE TABLE store
(
store_id INT(4),
open_date DATE,
city VARCHAR(20),
state CHAR(2),
addr_num VARCHAR(15),
addr_street VARCHAR(15),
zip INT(5),
open_time TIME,
close_time TIME
) ENGINE=INNODB;

CREATE TABLE pet
(
pet_id INT(4),
dob DATE,
name VARCHAR(15),
species VARCHAR(15),
breed VARCHAR(15),
gender CHAR(1),
price DECIMAL(5, 2),
date_in DATE
) ENGINE=INNODB;

ALTER TABLE pet ADD n_date DATE;

ALTER TABLE customer DROP COLUMN lname;
ALTER TABLE customer DROP COLUMN fname;
ALTER TABLE customer ADD last_name VARCHAR(15);
ALTER TABLE customer ADD first_name VARCHAR(15);

ALTER TABLE store MODIFY addr_street VARCHAR(25);

INSERT INTO customer (id, first_name, last_name, gender, phone) VALUES
(101, "Pat", "Hammonds", "F", "801-555-4360"),
(102, "Chris", "Fields", "M", "312-633-0912"),
(101, "Jordan", "Vills", "F", "535-741-2873");

INSERT INTO pet (pet_id, dob, name, species, breed, gender, date_in, n_date, price) VALUES
(1001, "2021-05-20", "Gabby", "cat", "tabby", "F", "2021-06-30", "2021-08-18", 39.99),
(1002, "2020-10-11", "Spot", "dog", "yorkie", "M", "2020-12-01", "2023-12-01", 499.99),
(1003, "2021-05-02", "Khaleesi", "dog", "shepherd", "F", "2020-06-15", "2023-11-06", 599.99);

UPDATE customer SET phone="812-335-9075" WHERE last_name="Vills" AND first_name="Jordan";

UPDATE customer SET phone="812-335-9075" WHERE id=103;
UPDATE pet SET n_date="2023-02-02" WHERE name="Spot";

SELECT name,breed,price
FROM pet WHERE species="dog";

SELECT phone FROM customer
WHERE last_name="Hammonds" AND first_name="Pat";

SELECT name FROM pet WHERE dob<"2022-01-01";

DELETE FROM customer WHERE last_name="Fields" AND first_name="Chris";

CREATE TABLE dinosaur 
(
id INT NOT NULL,
slug VARCHAR(15),
name VARCHAR(20),
description TEXT,
image VARCHAR(25),
image_credit VARCHAR(60),
source_url VARCHAR(65),
source_credit VARCHAR(150)
) ENGINE=INNODB;

INSERT INTO customer VALUES
(104, 'F', '940-324-8860', 'Patrick', 'Mary'),
(105, 'M', '621-486-0213', 'Knightly', 'Morgan'),
(106, 'F', '591-204-7715', 'Woods', 'Blaire'),
(107, 'M', '422-846-9091', 'Browning', 'Mason');

INSERT INTO pet VALUES
(1004, '2021-02-09', 'Briar', 'rabbit' , 'white satin' , 'F' , 29.99 , '2021-04-01', NULL),
(1005, '2019-06-03', 'Cassidy', 'dog' , 'labrador' , 'M' , 450.00 , '2021-07-10', NULL),
(1006, '2021-04-11', 'Bailey', 'cat' , 'siamese' , 'M' , 35.50 , '2021-06-21', '2021-08-17'),
(1007, '2021-02-14', 'Kyrie', 'ferret' , NULL , 'F' , 750.00 , '2021-04-28', NULL);

ALTER TABLE customer ADD vip DATE;

UPDATE customer SET vip="2021-08-15" where first_name="Pat" and last_name="Hammonds";
UPDATE customer SET vip="2021-09-01" where first_name="Jordan" and last_name="Vills";
UPDATE customer SET vip="2021-09-04" where first_name="Mason" and last_name="Browning";
UPDATE customer SET vip="2021-09-06" where first_name="Mary" and last_name="Patrick";

SELECT first_name, last_name
FROM customer
WHERE vip IS NOT NULL;

SELECT name, dob
FROM pet
WHERE species='dog' AND n_date
IS NULL;
