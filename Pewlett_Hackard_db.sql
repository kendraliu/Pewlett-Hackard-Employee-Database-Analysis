--drop tables in this order if they already exist
drop table dept_emp;
drop table dept_manager;
drop table salaries;
drop table employees;
drop table titles;
drop table departments;

--create tables in this order
create table departments(
	dept_no varchar not null, --Once the column is defined as "NOT NULL," it prevents inserting or updating a row with a null value or empty cell in that specific column
	dept_name varchar not null,
	primary key (dept_no)
);

create table titles(
	title_id varchar not null,
	title varchar not null,
	primary key (title_id)
);

create table employees(
	emp_no int not null,
	emp_title_id varchar not null,
	birth_date date not null,
	first_name text not null, 
	last_name text not null,
	sex varchar not null,
	hire_date date not null,
	primary key (emp_no),
	foreign key (emp_title_id) references titles(title_id)
);

create table dept_manager(
	dept_no varchar not null,
	emp_no int not null,
	primary key (dept_no, emp_no),
	foreign key (dept_no) references departments(dept_no),
	foreign key (emp_no) references employees(emp_no)
);

create table dept_emp(
	emp_no int not null,
	dept_no varchar not null,
	primary key (emp_no, dept_no),
	foreign key (dept_no) references departments(dept_no),
	foreign key (emp_no) references employees(emp_no)
);


create table salaries(
	emp_no int not null,
	salary int not null,
	primary key (emp_no),
	foreign key (emp_no) references employees(emp_no)
);

--confirm the tables are imported successfully
select * from departments;
select * from titles;
select * from employees;
select * from dept_manager;
select * from dept_emp;
select * from salaries;

--list the employee number, last name, first name, sex, and salary of each employee
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
join salaries as s
on e.emp_no = s.emp_no;

--list the first name, last name, and hire date for the employees who were hired in 1986
select e.first_name, e.last_name, e.hire_date
from employees as e
where extract(year from e.hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
select m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
from dept_manager as m
join departments as d
on m.dept_no = d.dept_no
join employees as e
on m.emp_no = e.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join dept_emp as de on e.emp_no = de.emp_no
join departments as d on de.dept_no = d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select e.first_name, e.last_name, e.sex
from employees as e
where e.first_name = 'Hercules' and e.last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
select d.dept_name, e.emp_no, e.last_name, e.first_name
from departments as d 
join dept_emp as de on d.dept_no = de.dept_no
join employees as e on de.emp_no = e.emp_no
where d.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select  e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join dept_emp as de on e.emp_no = de.emp_no
join departments as d on de.dept_no = d.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select e.last_name, count(e.last_name) as count
from employees as e
group by e.last_name
order by count desc;

