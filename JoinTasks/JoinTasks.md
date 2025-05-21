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

#### 7. Retrieve the names of employees in department 10 who work ≥ 10 hours/week on the "AL Rabwah" project. 
```
SELECT emp.Fname + ' ' + emp.Lname AS FullName
FROM Employee emp
inner JOIN Works_for w ON emp.SSN = w.ESSN
inner JOIN Project pro ON pro.Pnumber = w.Pno
WHERE emp.Dno = 10 
  AND pro.Pname = 'AL Rabwah' 
  AND w.Hours >= 10; 
```

Output:
![](./images/7.PNG)

#### 8. Find the names of employees who are directly supervised by "Kamel Mohamed". 
```		
SELECT emp.Fname + ' ' + emp.Lname AS FullName
FROM Employee emp left Join Employee sup
on emp.SSN = sup.Superssn
where sup.Fname + ' ' + sup.Lname = 'Kamel Mohamed';
```

Output:
![](./images/8.PNG)

#### 9. Retrieve the names of employees and the names of the projects they work on, sorted by project name. 
```
SELECT emp.Fname + ' ' + emp.Lname AS FullName, pro.Pname
FROM Employee emp
left JOIN Works_for w ON emp.SSN = w.ESSN
left JOIN Project pro ON pro.Pnumber = w.Pno


```

Output:
![](./images/9.PNG)
#### 10 . For each project located in Cairo, display the project number, controlling department name, manager's last name, address, and birthdate.
```
select pro.Pnumber, pro.Pname, emp.Lname, emp.Address, emp.Bdate
FROM Employee emp
left JOIN Works_for w ON emp.SSN = w.ESSN
left JOIN Project pro ON pro.Pnumber = w.Pno
where pro.City ='Cairo';
```

Output:
![](./images/10.PNG)

#### 11. Display all data of managers in the company.
```
select Manag.* 
from Employee emp, Employee Manag
where emp.SSN = Manag.Superssn

```
Output:
![](./images/11.PNG)

#### 12. Display all employees and their dependents, even if some employees have no dependents. 
```
SELECT emp.*, dep.*
FROM Employee emp
LEFT JOIN Dependent dep ON emp.SSN = dep.ESSN;

```
Output:
![](./images/12.PNG)

















