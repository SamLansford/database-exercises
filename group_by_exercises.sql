use employees;

SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
SELECT @@SESSION.sql_mode;

# In your script, use DISTINCT to find the unique titles in the titles table.
select DISTINCT title
from employees.titles;

# Find your query for employees whose last names start and end with 'E'. Update the query to find just the unique
# last names that start and end with 'E' using GROUP BY.
select last_name
from employees
where last_name like 'E%'
and last_name like '%E'
group by last_name
order by last_name;

# Update your previous query to now find unique combinations of first and last name where the last name starts and
# ends with 'E'. You should get 846 rows.
select concat(last_name, first_name) as 'Full Name'
from employees
where last_name like 'E%'
and last_name like '%E'
group by last_name, first_name
order by last_name, first_name;

# Find the unique last names with a 'q' but not 'qu'. Your results should be:
select last_name
from employees
where last_name like '%q%'
and last_name not like '%qu%'
group by last_name
order by last_name;

# Add a COUNT() to your results and use ORDER BY to make it easier to find employees whose unusual name
# is shared with others.
select concat(count(last_name), ' ', last_name) as 'ID Number and Last Name'
from employees
where last_name like '%q%'
and last_name not like '%qu%'
group by last_name
order by last_name;
describe employees;

# Update your query for 'Irena', 'Vidya', or 'Maya'. Use count(*) and GROUP BY to find the number
# of employees for each gender with those names.
select concat(count(*), ' ', gender) as 'Number and Gender'
from employees
where first_name in ('Irena','Vidya','Maya')
group by gender
order by gender;
