-- Albums released after 1991
delete
from albums
where release_date > 1991;

-- Albums with the genre 'disco'
delete
from albums
where genre = 'disco';

-- Albums by 'Whitney Houston' (...or maybe an artist of your choice)
delete
from albums
where artist like '%Jackson%';