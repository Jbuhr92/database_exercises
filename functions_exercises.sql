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

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE last_name like 'E%' and last_name like '%E';

SELECT *
FROM employees
WHERE last_name like '%q%' and last_name not like '%qu%';

select *
from employees
WHERE month(birth_date) = 12
  AND day(birth_date) = 25;

select *
from employees
WHERE year(hire_date) BETWEEN 1990 AND 1999
  AND month(birth_date) = 12
  AND day(birth_date) = 25
order by birth_date, hire_date desc;

select datediff(curdate(), hire_date)
from employees
WHERE year(hire_date) BETWEEN 1990 AND 1999
  AND month(birth_date) = 12
  AND day(birth_date) = 25;