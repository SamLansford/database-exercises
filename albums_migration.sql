USE codeup_test_db;

show databases;

DROP TABLE IF EXISTS albums;

CREATE TABLE albums (

    id INT UNSIGNED NOT NULL AUTO_INCREMENT primary key,
    artist VARCHAR (128),
    name VARCHAR(128),
    release_date SMALLINT UNSIGNED,
    sales FLOAT (6, 2),
    genre VARCHAR(128),
    unique unique_name (name)
);
describe albums;

select *
from albums;