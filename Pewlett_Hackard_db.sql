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

--



