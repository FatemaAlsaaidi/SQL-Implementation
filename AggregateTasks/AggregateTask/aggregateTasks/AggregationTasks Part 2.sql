Create Database  GTR;

use GTR

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    gender VARCHAR(10),
    department VARCHAR(50),
    salary INT
);

-- Insert data into Employee table
INSERT INTO Employee VALUES
(1, 'Aarav', 'Male', 'IT', 50000),
(2, 'Divya', 'Female', 'HR', 45000),
(3, 'Gaurav', 'Male', 'IT', 55000),
(4, 'Aarav', 'Male', 'Finance', 60000),
(5, 'Divya', 'Female', 'HR', 48000),
(6, 'Priya', 'Female', 'Finance', 52000),
(7, 'Rahul', 'Male', 'IT', NULL);

-- Create Student table
CREATE TABLE Student (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    subject VARCHAR(50),
    year INT,
    grade CHAR(1)
);

-- Insert data into Student table
INSERT INTO Student VALUES
(1, 'John', 'Mathematics', 1, 'A'),
(2, 'Emily', 'Science', 3, 'B'),
(3, 'Michael', 'English', 2, 'A'),
(4, 'Jessica', 'Mathematics', 1, 'B'),
(5, 'David', 'Science', 3, 'C'),
(6, 'Sarah', 'English', 2, 'A'),
(7, 'Robert', 'Mathematics', 2, 'B');

-- 1. Count the Total Number of Employees
SELECT COUNT(*) AS Total_Employees 
from Employee
-- 2.  Calculate the Total Salary (ignoring NULL values) 
select sum(salary) as Total_salary
from Employee

-- 3. Find the Average Salary
select avg(salary) as Average_Salary
from Employee

-- 4. Find the Highest and Lowest Salary
select max(salary) as Highest_Salary, min(salary) as Lowest_Salary
from Employee

-- 5.  Group By Single Column (Employee name with total salary)
select sum(salary), name
from Employee
group by name

-- 6.  Group By Multiple Columns (Student subject and year)
select subject, year, count(*) as Total_Students
from Student
group by subject, year

--7. Departments with total salary ≥ 100,000
select sum(salary) , department
from Employee
group by department
having sum(salary) >= 100000

--8. Subjects with more than 1 student in any year
select count(*) as number_of_student, subject, year
from student 
group by subject, year
having count(*)>1