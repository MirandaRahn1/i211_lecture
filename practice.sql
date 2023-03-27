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