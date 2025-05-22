# Aggregate Functions  Tasks
### 1. Count the Total Number of Employees
```
SELECT COUNT(*) AS Total_Employees 
from Employee

```
output:
![Total_Employees](img/1.png)

### 2.  Calculate the Total Salary (ignoring NULL values) 
```
select sum(salary) as Total_salary
from Employee

```
Output:
![Total_salary](img/2.png)

### 3. Find the Average Salary
```
select avg(salary) as Average_Salary
from Employee
```
Output:
![Average_Salary](img/3.png)




