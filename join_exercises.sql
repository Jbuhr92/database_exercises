use employees;

select dept_name as 'Department Name',CONCAT(first_name, ' ', last_name) as 'Department Manager' from departments d
    join dept_manager dm on d.dept_no = dm.dept_no
    join employees e on e.emp_no = dm.emp_no
    where to_date like '9%'
    order by dept_name;

select dept_name as 'Department Name',CONCAT(first_name, ' ', last_name) as 'Department Manager' from departments d
    join dept_manager dm on d.dept_no = dm.dept_no
    join employees e on e.emp_no = dm.emp_no
    where to_date like '9%'
        and gender = 'F'
    order by dept_name;

select title, COUNT(title) as Total from titles t
    join dept_emp de on t.emp_no = de.emp_no
    join departments d on d.dept_no = de.dept_no
        where dept_name = 'Customer Service'
            and t.to_date LIKE '9%'
            and de.to_date like '9%'
            group by title;

select dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) AS 'Department Manager', salary
    from departments d
        join dept_manager dm on d.dept_no = dm.dept_no
        join employees e on dm.emp_no = e.emp_no
        join salaries s on e.emp_no = s.emp_no
            where s.to_date like '9%'
            and dm.to_date like '9%'
                order by dept_name;

select CONCAT(e.first_name, ' ', e.last_name) as Employee,
       dept_name as Department,
       CONCAT(e2.first_name, ' ', e2.last_name) AS 'Department Manager'
        from employees e
            join dept_emp de on e.emp_no = de.emp_no
            join departments d on d.dept_no = de.dept_no
            join dept_manager dm on d.dept_no = dm.dept_no
            join employees e2 on e2.emp_no = dm.emp_no
                where de.to_date like '9%'
                and dm.to_date like '9%'
                    order by dept_name, e.emp_no;