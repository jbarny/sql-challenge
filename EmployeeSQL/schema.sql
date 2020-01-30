-- create tables
CREATE TABLE departments(
	dept_no VARCHAR(5) PRIMARY KEY,
	dept_name VARCHAR(20)
);

CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	gender VARCHAR(1),
	hire_date DATE
);

CREATE TABLE dept_emp(
	emp_no INT,
    FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(5),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	from_date DATE,
	to_date DATE,
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(5),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT,
    FOREIGN KEY(emp_no) REFERENCES employees(emp_no),  
	from_date DATE,
	to_date DATE,
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries(
	emp_no INT,
    FOREIGN KEY(emp_no) REFERENCES employees(emp_no), 
	salary INT,
	from_date DATE,
	to_date DATE,
    PRIMARY KEY (emp_no, salary)
);

CREATE TABLE titles(
	emp_no INT,
    FOREIGN KEY(emp_no) REFERENCES employees(emp_no), 
	title VARCHAR(30),
	from_date DATE,
	to_date DATE,
    PRIMARY KEY (emp_no, title, from_date)		
);