CREATE DATABASE Company;

USE Company;

Create Table employee
(Ssn int PRIMARY KEY,
Fname VarChar(20) Not Null,
Minit VarChar(20) Not Null,
Lname VarChar(20) Not Null,
Bdate Date Not Null,
Address_ VarChar(20) Not Null,
Sex VarChar(20) Not Null,
Salary decimal(10,2) check (Salary>=325)
);

Create Table Department 
(
Dnumber int Primary Key,
Dname VarChar(20) Not Null, 
Mgr_ssn VarChar(20) Not Null,
Mgr_start_date date Not Null
);

Create Table Dept_Locations
(
Dnumber INT,
Dlocation VARCHAR(50),
PRIMARY KEY (Dnumber, Dlocation),
FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber)
);

Create Table Project 
(
Dnumber INT,
Pnumber int Primary Key,
Pname VarChar(20) Not null,
Plocation VarChar(20) Not null
FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber)
);

Create Table Work_On
(
Ssn INT,
Pnumber INT,
Hours_ decimal(4,2)
Foreign key(Ssn) references employee(Ssn),
Foreign key(Pnumber) references Project(Pnumber),
Primary key (Ssn,Pnumber)
);

Create Table Dependents
(
Essn INT,
Dependent_name VarChar(20) Not Null,
Sex VarChar(6) Not Null,
Bdate date not null,
Relationship VarChar(20) not null
foreign key (Essn) references employee(Ssn),
primary key (Essn , Dependent_name)
);

ALTER TABLE employee
ADD Super_ssn int Not null,
	Dnumber int not null;

ALTER TABLE employee
ADD FOREIGN KEY(Super_ssn) REFERENCES employee(Ssn);

Alter Table employee 
ADD FOREIGN KEY(Dnumber) REFERENCES Department(Dnumber);
