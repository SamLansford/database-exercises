Use employees;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees as e
JOIN dept_emp as de
ON de.emp_no = e.emp_no
JOIN departments as d
ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;

describe employees;


select d.dept_name, concat(e.first_name, ' ', e.last_name) as Full_Name
from employees as e
join dept_manager as dm
on dm.emp_no = e.emp_no
join departments as d
on d.dept_no = dm.dept_no
where dm.to_date = '9999-01-01'
order by dept_name;


select d.dept_name, concat(e.first_name, ' ', e.last_name) as Full_Name
from employees as e
join dept_manager as dm
on dm.emp_no = e.emp_no
join departments as d
on d.dept_no = dm.dept_no
where dm.to_date = '9999-01-01'
and gender = 'F'
order by dept_name;

