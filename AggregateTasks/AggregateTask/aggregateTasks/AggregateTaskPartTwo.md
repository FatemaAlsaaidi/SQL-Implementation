# Aggregate Functions Tasks
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

### 4. Find the Highest and Lowest Salary
```
select max(salary) as Highest_Salary, min(salary) as Lowest_Salary
from Employee
```

Output:
![Highest_and_Lowest_Salary](img/4.png)

# GROUP BY 
### 1.  Group By Single Column (Employee name with total salary)
```
select sum(salary), name
from Employee
group by name
```

Output:
![Group_By_Single_Column](img/5.png)





