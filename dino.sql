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
