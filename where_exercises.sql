use employees;

SELECT *
FROM employees
WHERE (first_name = 'irena' or 'vidya' or 'maya') and gender = 'm';

SELECT *
FROM employees
WHERE last_name like 'E%';

SELECT *
FROM employees
WHERE last_name like '%E';

SELECT *
FROM employees
WHERE last_name like 'E%' and '%E';

SELECT *
FROM employees
WHERE last_name like '%q%' and not '%qu%';