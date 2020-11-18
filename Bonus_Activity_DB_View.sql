--view for bonus activity
create view avg_sal_by_title as
select t.title, round(avg(s.salary),2)
from employees as e 
join salaries as s
on s.emp_no=e.emp_no
join titles as t
on e.emp_title_id=t.title_id
group by t.title

