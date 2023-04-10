DROP TABLE IF EXISTS pet;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS takes_class;
DROP TABLE IF EXISTS class;
DROP TABLE IF EXISTS student;


CREATE TABLE customer (
    id INT PRIMARY KEY,
    first_name VARCHAR(15),
    last_name VARCHAR(15),
    gender CHAR(1),
    phone VARCHAR(12)
) ENGINE=INNODB;

CREATE TABLE pet (
    pet_id INT PRIMARY KEY,
    dob DATE,
    name VARCHAR(20),
    species VARCHAR(15),
    breed VARCHAR(15),
    gender CHAR(1),
    price DEC(6,2),
    date_in DATE,
    n_date DATE,
    owner INT,
    FOREIGN KEY(owner) REFERENCES customer(id)
) ENGINE=INNODB;

CREATE TABLE student
(
    stu_id INT PRIMARY KEY ,
    fname VARCHAR(15),
    lname VARCHAR(15)
)ENGINE=INNODB;

CREATE TABLE class
(
    class_id INT PRIMARY KEY ,
    name VARCHAR(15)
)ENGINE=INNODB;

CREATE TABLE takes_class
(
    stu_id INT,
    class_id INT,
    FOREIGN KEY(stu_id) REFERENCES student(stu_id),
    FOREIGN KEY(class_id) REFERENCES class(class_id)
)ENGINE=INNODB;

INSERT INTO customer (id, first_name, last_name, gender, phone) VALUES
(101, "Pat", "Hammonds", "F", "801-855-4360"),
(102, "Chris", "Fields", "M", "312-633-0912"),
(103, "Jordan", "Vills", "N", "535-741-2673"),
(104, "Alix", "Granger", "F", "812-908-3381"),
(105, "Avery", "Compton", "N", "773-602-8702"),
(106, "Saylor", "Moon", "F", "291-888-5114"),
(107, "Channing", "Fletcher", "M", "711-403-2893")
;

INSERT INTO pet (pet_id, dob, name, species, breed, gender, price, date_in, n_date, owner) VALUES
(1001, "2021-05-20", "Gabby", "cat", "tabby", "F", 39.99, "2021-06-30", "2021-08-18", 102),
(1002, "2020-10-11","Spot", "dog", "yorkie", "M", 499.99, "2020-12-01", "2020-12-01", 103),
(1003, "2021-05-02", "Khaleesi", "dog", "shepherd", "F", 599.99, "2021-06-15", "2021-11-06", 101),
(1004, "2020-03-01", "Kal Drogo", "dog", "malamute", "M", 549.99, "2020-08-05", "2020-08-06", NULL),
(1005, "2022-01-28", "Ferret Bueller", "ferret", NULL, "M", 399.99, "2022-03-11", "2022-03-28", 105),
(1006, "2022-08-18", "Hammy", "Hamster", NULL, "F", 19.99, "2022-09-12", NULL, 107),
(1007, "2019-06-03", "Cap'n Jack", "parrot", NULL, "M", 699.99, "2022-04-22", NULL, 104),
(1008, "2018-10-29", "Geralt", "dog", "husky", "M", 599.99, "2019-04-04", NULL, 106),
(1009, "2022-02-28", "Ciri", "cat", "tiger", "F", 34.99, "2022-03-15", NULL, 106),
(1010, "2022-05-25", "Pharoah", "cat", "abyssinian", "M", 19.99, "2022-07-01", "2022-09-01", 102)
;

INSERT INTO student VALUES
(1, "Connor", "Flint"),
(2, "Rayne", "Shea"),
(3, "Sydney", "Fallow")
;

INSERT INTO class VALUES
(101, "I101"),
(102, "I211"),
(103, "I300")
;

INSERT INTO takes_class VALUES
(1, 101),
(2,101 ),
(3, 102),
(2, 102),
(1, 103)
;

SELECT p.name
FROM pet AS p 
JOIN customer AS c ON c.id=p.owner 
WHERE c.first_name='Chris' AND p.price < 50;

SELECT c.phone 
FROM customer AS c 
JOIN pet AS p ON c.id=p.owner 
WHERE p.name='Gabby';

SELECT p.name, p.dob 
FROM pet AS p 
JOIN customer AS c ON c.id=p.owner 
WHERE c.gender='F';

SELECT CONCAT(s.fname, ' ', s.lname) AS student_name
FROM takes_class AS tc 
JOIN class AS c ON c.class_id = tc.class_id 
JOIN student AS s ON tc.stu_id = s.stu_id 
WHERE c.name='I211';



