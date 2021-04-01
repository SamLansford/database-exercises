use employees;

select first_name, last_name
from employees
where first_name in ('Irena', 'Vidya')
# and last_name in ('Reutenauer', 'Demeyer')
order by first_name;



select first_name, last_name
from employees
where first_name in ('Irena', 'Vidya')
order by last_name asc,
         first_name desc;


select *
from employees
where last_name like 'E%'
order by emp_no asc;
