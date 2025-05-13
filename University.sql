create database University;
use University;

create table hostel
(
hostel_id int primary key,
hostel_name varchar(10) Not null UNIQUE,
no_of_seats int not null
);

create table student 
(
S_id int primary key,
L_name varchar(20) not null,
F_name varchar(20) not null, 
city varchar(10) not null,
state_ varchar(10) not null,
pin_code varchar(6)  not null unique,
DOB Date not null
);

create table Student_PhoneNo
(
S_id int not null,
PhoneNo varchar(8) not null,
foreign key (S_id) references student(S_id),
primary key(S_id, PhoneNo)
);

create table faculty
(
F_id int primary key,
F_name varchar(10) not null,
department varchar(10) not null,
salary int constraint cK_faculty_salary check(salary between 325 and 1000)
);

create table faculty_MobileNO
(
F_id int not null, 
MobileNO varchar(8) not null,
Foreign key(F_id) references faculty(F_id),
primary key (F_id, MobileNO)
);

create table course
(
course_id int primary key,
course_name varchar(10) not null,
duration DECIMAL(4, 2) not null,
);

create table course_student
(
course_id int not null,
S_id int not null,
foreign key(course_id) references course(course_id),
foreign key(S_id) references student(S_id),
primary key(S_id, course_id)
);

create table exams
(
department_id int not null,
exam_code varchar(10) not null unique,
time00  DECIMAL(4, 2) not null,
foreign key (department_id) references department(department_id),
primary key(department_id, exam_code, time00),
date00 date not null,
room varchar(4) not null 
);

create table subjects
(
subject_id int primary key,
subject_name varchar(10) not null unique,
F_id int not null,
foreign key (F_id) references faculty(F_id)
);

create table department
(
department_id int primary key,
d_name varchar(10) not null unique,
);

--drop table department

-- change the data type of duration column in course table 
alter table course
alter column duration int;

-- add foreign key in course, faculty and student table 
ALTER TABLE student
add hostel_id int;

ALTER TABLE student
ADD FOREIGN KEY(hostel_id) REFERENCES hostel(hostel_id);

alter table student
add F_id int;

alter table student
add foreign key (F_id) references faculty(F_id);

alter table faculty
add department_id int;

alter table faculty
add foreign key (department_id) references department(department_id);

alter table course
add department_id int;

alter table course
add foreign key (department_id) references department(department_id);

-- Query to extract the name in the hostel_id column of the course table, which is foreign key .
SELECT 
    fk.name AS ForeignKeyName
FROM 
    sys.foreign_keys fk
JOIN 
    sys.foreign_key_columns fkc ON fk.object_id = fkc.constraint_object_id
JOIN 
    sys.columns c ON fkc.parent_column_id = c.column_id AND fkc.parent_object_id = c.object_id
WHERE 
    OBJECT_NAME(fk.parent_object_id) = 'course'
    AND c.name = 'hostel_id';

--delet foreign key column 
ALTER TABLE course
DROP CONSTRAINT FK__course__hostel_i__59063A47;

-- Query to extract the name in the F_id column of the course table, which is foreign key .
SELECT 
    fk.name AS ForeignKeyName
FROM 
    sys.foreign_keys fk
JOIN 
    sys.foreign_key_columns fkc ON fk.object_id = fkc.constraint_object_id
JOIN 
    sys.columns c ON fkc.parent_column_id = c.column_id AND fkc.parent_object_id = c.object_id
WHERE 
    OBJECT_NAME(fk.parent_object_id) = 'course'
    AND c.name = 'F_id';

--delet foreign key column 
ALTER TABLE course
DROP CONSTRAINT FK__course__F_id__59FA5E80;

