use employees;

SELECT *
FROM employees
WHERE (first_name = 'irena' or first_name = 'vidya' or first_name = 'maya')
order by last_name, first_name;

SELECT *
FROM employees
WHERE last_name like 'E%'
order by emp_no desc;

SELECT *
FROM employees
WHERE last_name like '%E'
order by emp_no desc;

SELECT *
FROM employees
WHERE last_name like 'E%' and '%E'
order by emp_no desc;

SELECT *
FROM employees
WHERE last_name like '%q%' and last_name not like '%qu%';