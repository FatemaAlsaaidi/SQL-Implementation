# Aggregation Functions with different database
## Company Database 
#### 1. Count total number of employees in the Employees table. 
```
select count(*) as Total_Number_Of_Employees from Employee
```
OutPut:
!['total number of employees'](../img2/Add.Company1.JPG)
#### 2. Calculate average salary from the Salaries table. 
```
select AVG(salary) as Average_Salary from Employee
```
OutPut:
!['total number of employees'](../img2/Agg.Company2.JPG)

#### 3. Count employees in each department using Employees grouped by Dept_ID. 
```
select count(*) as NumEmployee, emp.Dno, dep.Dname
from Employee emp left join Departments dep ON emp.Dno = dep.Dnum
group by emp.Dno , dep.Dname

```
output: 
!['Count employees in each department'](../img2/Agg.Company3.JPG)






