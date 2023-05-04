use employees;

select distinct title from titles;

SELECT *
FROM employees
WHERE last_name like 'E%'
order by emp_no desc;

SELECT *
FROM employees
WHERE last_name like '%E'
order by emp_no desc;

SELECT last_name, first_name
FROM employees
WHERE last_name like 'E%' and last_name like '%E'
group by last_name, first_name;

SELECT  last_name, count(last_name)
FROM employees
WHERE last_name like '%q%' and last_name not like '%qu%'
group by last_name;

SELECT count(*), gender
FROM employees
WHERE (first_name = 'irena' or first_name = 'vidya' or first_name = 'maya')
group by gender;

