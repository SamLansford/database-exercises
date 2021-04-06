CREATE DATABASE if not exists design_test_db;

use design_test_db;

DROP TABLE IF EXISTS quote_topic;
DROP TABLE IF EXISTS quotes;
DROP TABLE IF EXISTS topics;
DROP TABLE IF EXISTS authors;



CREATE TABLE quotes (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    author_first_name VARCHAR(50) DEFAULT 'NONE',
    author_last_name  VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE authors (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name  VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);


ALTER TABLE quotes DROP COLUMN author_first_name;
ALTER TABLE quotes DROP COLUMN author_last_name;
ALTER TABLE quotes ADD COLUMN author_id INT UNSIGNED NOT NULL;
ALTER TABLE quotes ADD FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE NO ACTION ON UPDATE CASCADE ;


select *
from quotes;

select *
from authors;

CREATE TABLE topics (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    PRIMARY KEY (id)
);


insert into authors(first_name, last_name) values
('Master', 'Yoda'),
('J.K','Rowling'),
('Albert','Einstein'),
('Mahatma','Gandhi');



insert into quotes(author_id, content) values
((select id from authors where first_name = 'Master' and last_name = 'Yoda'), 'Do or do not, there is no try'),

((select id from authors where first_name = 'J.K' and last_name = 'Rowling'), 'It is our choices... that show what we
truly are, far more than our abilities.'),

((select id from authors where first_name = 'Albert' and last_name = 'Einstein'), 'Anyone who has never made a mistake has
never tried anything new.'),

((select id from authors where first_name = 'Mahatma' and last_name = 'Gandhi'), 'Live as if you were to die tomorrow.
Lear as if you were to live forever.');


insert into topics(name) values
('Inspirational'),
('encourage'),
('mind set');


CREATE TABLE quote_topic (
    quote_id INTEGER UNSIGNED NOT NULL,
    topic_id INTEGER UNSIGNED NOT NULL,
    FOREIGN KEY (quote_id) REFERENCES quotes(id),
    FOREIGN KEY (topic_id) REFERENCES topics(id)
);


insert into quote_topic(quote_id, topic_id) VALUES
(1,1),(1,3),
(2,1),(2,2),(2,3),
(3,3),
(4,1),(4,3);

select *
from quote_topic;

select q.content as 'Quote',
       concat(a.first_name, ' ', a.last_name) as 'Full Name',
       t.name as 'Topic'
from quotes q
inner join quote_topic qt on q.id = qt.quote_id
inner join topics t on qt.topic_id = t.id
inner join authors a on q.author_id = a.id
where qt.topic_id in
    (
        select t.id
        from topics t
        where t.name = 'mind set'
    );