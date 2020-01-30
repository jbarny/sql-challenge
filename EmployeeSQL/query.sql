-- TO RUN QUERIES BELOW, IMPORT CORRESPONDING CSVS CONTAINED IN 'DATA' FOLDER

-- 1. list employee #, last name, first name, gender, salary
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM salaries AS s
INNER JOIN employees AS e
ON e.emp_no = s.emp_no;

-- 2. list employees hired in 1986
SELECT * FROM employees WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. list manager of each department
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM employees AS e
INNER JOIN	dept_manager AS dm
	ON dm.emp_no = e.emp_no
	INNER JOIN departments AS d
		ON d.dept_no = dm.dept_no;
		
-- 4. list each employee & dept
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
	ON de.emp_no = e.emp_no
	INNER JOIN departments AS d
		ON d.dept_no = de.dept_no;

-- 5. list all employees named Hercules B
SELECT first_name, last_name FROM employees 
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';
 
-- 6. list all sales employees
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
	ON de.emp_no = e.emp_no
	INNER JOIN departments AS d
		ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';

-- 7. list all sales & development employees
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
	ON de.emp_no = e.emp_no
	INNER JOIN departments AS d
		ON d.dept_no = de.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- 8. list frequency count of last names in descending order
SELECT last_name, COUNT(last_name) AS "last_name_frequency" FROM employees
GROUP BY last_name 
ORDER BY last_name_frequency DESC;