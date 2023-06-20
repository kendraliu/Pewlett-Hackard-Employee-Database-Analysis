--drop tables if they already exist
--drop;

--create tables
create table departments(
	dept_no varchar,
	dept_name varchar,
	primary key (dept_no)
);

create table dept_emp(
	emp_no int,
	dept_no varchar,
	primary key (emp_no),
	foreign key (dept_no) references departments(dept_no)
);

create table titles(
	title_id varchar,
	title varchar,
	primary key (title_id)
);

create table dept_manager(
	dept_no varchar,
	emp_no int,
	foreign key (dept_no) references departments(dept_no)
);

create table employees(
	emp_no int,
	emp_title_id varchar,
	birth_date timestamp,
	first_name text, 
	last_name text,
	sex varchar,
	hire_date timestamp,
	foreign key (emp_no) references dept_emp(emp_no),
	foreign key (emp_title_id) references titles(title_id)
);

create table salaries(
	emp_no int,
	salary int,
	foreign key (emp_no) references dept_emp(emp_no)
);


select * from departments;
select * from dept_emp;
select * from titles;
select * from dept_manager;
select * from employees;
select * from salaries;