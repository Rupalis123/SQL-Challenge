-- 1.List the following details of each employee: employee number, last name, first name, sex, and salary.

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
join salaries as s
on e.emp_no = s.emp_no
order by e.emp_no

-- 2.List first name, last name, and hire date for employees who were hired in 1986.

SELECT emp_no, first_name, last_name,  hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
order by emp_no

-- 3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from departments as d
join dept_manager as dm
on d.dept_no=dm.dept_no
join employees as e
on dm.emp_no = e.emp_no
order by dept_no, emp_no

-- 4.List the department of each employee with the following information: employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join dept_emp as de
on e.emp_no = de.emp_no
inner join departments as d
on de.dept_no = d.dept_no
order by e.emp_no

-- 5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name, sex 
from employees
where first_name= 'Hercules' and last_name like 'B%'
order by last_name

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join dept_emp as de
on e.emp_no = de.emp_no
join departments as d
on de.dept_no = d.dept_no
where d.dept_name = 'Sales'
order by e.emp_no

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join dept_emp as de
on e.emp_no = de.emp_no
join departments as d
on de.dept_no = d.dept_no
where d.dept_name in ('Sales', 'Development')
order by e.emp_no

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name, count(last_name) as count_last_name
from employees
group by last_name
order by count_last_name desc