--Creates Tables

CREATE TABLE Titles (
emp_title_id VARCHAR(6) NOT NULL,
title VARCHAR(100) NOT NULL,
PRIMARY KEY (emp_title_id)
);

CREATE TABLE Employees (
emp_no VARCHAR(7) NOT NULL,
emp_title_id VARCHAR(6) NOT NULL,
birth_date date NOT NULL,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
sex VARCHAR(1),
hire_date date,
PRIMARY KEY (emp_no),
FOREIGN KEY (emp_title_id) REFERENCES Titles (emp_title_id)
);

CREATE TABLE Salaries (
emp_no VARCHAR(7) NOT NULL,
salary VARCHAR(10) NOT NULL,
FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);

CREATE TABLE Dept_Emp (
emp_no VARCHAR(7) NOT NULL,
dept_no VARCHAR(4) NOT NULL,
PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE Dept_Manager (
dept_no VARCHAR(4) NOT NULL,
emp_no VARCHAR(7) NOT NULL,
FOREIGN KEY (emp_no, dept_no) REFERENCES Dept_Emp (emp_no,dept_no)
);

CREATE TABLE Departments (
dept_no varchar(4),
dept_name VARCHAR(100),
PRIMARY KEY (dept_no)
);

--Imports from CSV files

COPY Titles
FROM 'D:\data\titles.csv'
DELIMITER ','
CSV HEADER;

COPY Employees
FROM 'D:\data\employees.csv'
DELIMITER ','
CSV HEADER;

COPY Salaries
FROM 'D:\data\salaries.csv'
DELIMITER ','
CSV HEADER;

COPY Dept_Emp
FROM 'D:\data\dept_emp.csv'
DELIMITER ','
CSV HEADER;

COPY Dept_Manager
FROM 'D:\data\dept_manager.csv'
DELIMITER ','
CSV HEADER;

COPY Departments
FROM 'D:\data\departments.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM Employees;
SELECT * FROM Salaries;
SELECT * FROM Titles;
SELECT * From Dept_Manager;
SELECT * FROM Dept_Emp;
SELECT * FROM Departments;

--List the employee number, last name, first name, sex, and salary of each employee.

SELECT Employees.emp_no, Employees.last_name,Employees.first_name,Employees.sex,Salaries.salary
FROM Employees
JOIN salaries
ON Employees.emp_no = Salaries.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name,last_name,hire_date
FROM Employees
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT Dept_Emp.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Dept_Emp
JOIN Employees
ON Dept_Emp.emp_no = Employees.emp_no
JOIN Departments
ON Dept_emp.dept_no = Departments.dept_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT Departments.dept_no,Departments.dept_name,Employees.emp_no,Employees.last_name,Employees.first_name
FROM Dept_Emp
JOIN Employees
ON Dept_Emp.emp_no = Employees.emp_no
JOIN Departments
ON Dept_Emp.dept_no = Departments.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B

SELECT first_name,last_name,sex
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT Departments.dept_name,Employees.emp_no,Employees.last_name,Employees.first_name
FROM Employees
JOIN Dept_Emp
ON Employees.emp_no = Dept_Emp.emp_no
JOIN Departments
ON Departments.dept_no = Dept_Emp.dept_no
WHERE Departments.dept_name LIKE 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT Employees.emp_no,Employees.last_name,Employees.first_name,Departments.dept_name
FROM Employees
JOIN Dept_Emp
ON Employees.emp_no = Dept_Emp.emp_no
JOIN Departments
ON Departments.dept_no = Dept_Emp.dept_no
WHERE Departments.dept_name LIKE 'Sales' OR Departments.dept_name LIKE 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name,
COUNT (last_name) AS "Frequency"
FROM Employees
GROUP BY last_name
ORDER BY
COUNT (last_name) DESC;

--Deletes tables if needed

/*
DROP TABLE Salaries;
DROP TABLE Employees;
DROP TABLE Titles;
DROP TABLE Dept_Manager;
Drop TABLE Departments;
DROP TABLE Dept_Emp;
*/
