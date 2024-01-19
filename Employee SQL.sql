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

--Deletes tables if needed

/*
DROP TABLE Salaries;
DROP TABLE Employees;
DROP TABLE Titles;
DROP TABLE Dept_Manager;
Drop TABLE Departments;
DROP TABLE Dept_Emp;
*/
