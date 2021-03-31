use employees;

select *
from employees
where first_name in ('Irena', 'Vidya','Maya')
and gender = 'M';

select *
from employees
where first_name = 'Irena'
or first_name = 'Vidya'
or first_name = 'Maya';
