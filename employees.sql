--Create a Departments table
CREATE TABLE departments (
    dept_no VARCHAR PRIMARY KEY,
    dept_name VARCHAR(30) NOT NULL
);
--Import CSV
SELECT * FROM departments

--Create Employees table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR,
	birth_date DATE,
    first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE
);
--Import CSV
SELECT * FROM employees

--Create Department Manager table
CREATE TABLE dept_manager (
    dept_no VARCHAR,
    emp_no INT
);
--Import CSV
SELECT * FROM dept_manager

--Create Department Employee table
CREATE TABLE dept_emp (
    emp_no INT,
	dept_no VARCHAR
);
--Import CSV
SELECT * FROM dept_emp

--Create Salaries table
CREATE TABLE salaries (
    emp_no INT,
	salary INT
);
--Import CSV
SELECT * FROM salaries

--Create Titles table
CREATE TABLE titles (
    title_id VARCHAR,
	title VARCHAR
);

--Import CSV
SELECT * FROM titles

-- First Question
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees 
JOIN salaries 
ON employees.emp_no = salaries.emp_no;

--Second Question
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986';

--Third Question
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;

--Fourth Question
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;

--Fifth Question
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--Sixth Question
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--Seventh Question
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';

--Eight Question
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;











