use employees;


# Find all the employees with the same hire date as employee 101010 using a subquery.
#
# 69 Rows
select first_name, last_name from employees where hire_date IN (
        select hire_date
        from employees
        where emp_no = '101010'
    );

# Find all the titles held by all employees with the first name Aamod.
#
# 314 total titles, 6 unique titles

select title from titles where emp_no in (
    select emp_no
    from employees
    where first_name = 'Aamod'
    );

# Find all the current department managers that are female.
# +------------+------------+
# | first_name | last_name  |
# +------------+------------+
# | Isamu      | Legleitner |
# | Karsten    | Sigstam    |
# | Leon       | DasSarma   |
# | Hilary     | Kambil     |
# +------------+------------+

select CONCAT(first_name, ' ', last_name) as Employee from employees where emp_no in (
    select emp_no
    from dept_manager
    where to_date like '9%'
    ) and gender = 'F';

select dept_name from departments where dept_no in (
    select dept_no
    from dept_manager
    where emp_no in (
        select emp_no
        from employees
        where gender = 'F'
        ) and to_date like '9%'
);

select first_name, last_name from employees where emp_no in (
    select emp_no
    from salaries
    where salary = (select MAX(salary) from salaries)
    );