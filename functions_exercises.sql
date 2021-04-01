use employees;

# select first_name, last_name
# from employees
# where first_name in ('Irena', 'Vidya')
# and last_name in ('Reutenauer', 'Demeyer')
# order by first_name;
#
#
#
# select first_name, last_name
# from employees
# where first_name in ('Irena', 'Vidya')
# order by last_name asc,
#          first_name desc;

# Update your queries for employees whose names start and end with 'E'. Use concat() to combine their first and last name together as a single column in your results.
select concat (first_name, ' ', last_name) as 'Full Name'
from employees
where last_name like '%E'
and last_name like 'E%'
order by emp_no;


# Find all employees born on Christmas — 842 rows.
# Find all employees hired in the 90s and born on Christmas — 362 rows.
# Change the query for employees hired in the 90s and born on Christmas such that the first result is the oldest employee who was hired last. It should be Khun Bernini.
# For your query of employees born on Christmas and hired in the 90s, use datediff() to find how many days they have been working at the company (Hint: You might also need to use now() or curdate()).
select *, datediff(now(), hire_date) as 'Days Employed'
from employees
where month(birth_date) = 12
and day(birth_date) = 25
and year(hire_date) between 1990 and 1999
order by birth_date, hire_date desc;

SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
SELECT @@SESSION.sql_mode;

select *
from employees
where first_name = 'Irena'
group by gender;