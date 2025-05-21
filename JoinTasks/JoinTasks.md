# Company Database – JOIN Queries
### This document contains SQL queries that utilize JOIN operations to retrieve data from the Company database.
#### 1. Display the department ID, department name, manager ID, and the full name of the manager.
```
select dep.Dnum, dep.Dname, Emp.Superssn ,Emp.Fname + ' ' + Emp.Lname AS full_name from Departments dep inner join Employee Emp
on dep.Dnum = Emp.Dno
```
output:
![](./images/1.png)

#### 2. Display the names of departments and the names of the projects they control. 
```
select dep.Dname, Proj.Pname from Departments dep inner join Project Proj
on dep.Dnum = proj.Dnum

``` 
output:
![](./images/2.PNG)

#### 3.Display full data of all dependents, along with the full name of the employee they depend on. 
```
SELECT dep.* , Emp.Fname + ' ' + Emp.Lname as Full_Name from Dependent dep left join Employee Emp 
on Emp.SSN  = dep.ESSN

```

Output:
![](./images/3.PNG)

#### 4. Display the project ID, name, and location of all projects located in Cairo or Alex. 
```
select  Pnumber, Pname, Plocation  from Project where City = 'Cairo' OR City ='Alex'

```

Output:
![](./images/4.PNG)

#### 5. Display all project data where the project name starts with the letter 'A'. 
```
select * from project where Pname like 'A%'

```
Output:
![](./images/5.PNG)

#### 6. Display the IDs and names of employees in department 30 with a salary between 1000 and 2000 LE. 
```
select SSN, Fname + ' ' + Lname as full_name, Salary 
from Employee 
where Dno = 30 and Salary between 1000 and 2000;
```

Output:
![](./images/6.PNG)









