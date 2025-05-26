# Functions & Variables & Control of flow statement’s Task
### 1. Create a scalar function that takes date and returns Month name of that date.
```
create function dbo.Month_Name(@date0 as date)
returns varchar(10)
as begin
return datename(MONTH,@date0)

end

SELECT Manager_hiredate, dbo.Month_Name(Manager_hiredate) AS Hire_Month
FROM Department;

```
!['a scalar function'](../img/1.1.jpg)
### 2. Create a multi-statements table-valued function that takes 2 integers and returns the values between them. 
```
CREATE FUNCTION dbo.Between_value (@num1 INT, @num2 INT)
RETURNS @result TABLE (
    St_Age INT
)
AS
BEGIN
    INSERT INTO @result
    SELECT 
        St_Age
    FROM Student
    WHERE 
        St_Age BETWEEN @num1 AND @num2

    RETURN;
END;
SELECT * FROM dbo.Between_value(10, 30);


```
!['a multi-statements table-valued function'](../img/1.2.jpg)

### 3.  Create inline function that takes Student No and returns Department Name with Student full name. 
```
create function Dep_StudentName (@Student_ID int)
returns table 
as 
return
(select S.St_Fname + ' ' + S.St_Lname as Full_Name , Dep.Dept_Name
from Student S , Department Dep)

select * from Dep_StudentName(3)


```
!['inline function'](../img/1.3.jpg)

### 4. Create a scalar function that takes Student ID and returns a message to user  
a. If first name and Last name are null then display 'First name & last name are null' 
b. If First name is null then display 'first name is null' 
c. If Last name is null then display 'last name is null' 
d. Else display 'First name & last name are not null'
```
CREATE FUNCTION dbo.MessageToUser(@S_ID INT)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @Message VARCHAR(100);
    DECLARE @FName VARCHAR(50);
    DECLARE @LName VARCHAR(50);

    SELECT @FName = St_Fname, @LName = St_Lname
    FROM Student
    WHERE St_Id = @S_ID;

    IF (@FName IS NULL AND @LName IS NULL)
        SET @Message = 'First name & last name are null';
    ELSE IF (@FName IS NULL)
        SET @Message = 'First name is null';
    ELSE IF (@LName IS NULL)
        SET @Message = 'Last name is null';
    ELSE
        SET @Message = 'First name & last name are not null';

    RETURN @Message;
END;

SELECT dbo.MessageToUser (2) AS ResultMessage;


```

!['scalar function with if condition '](../img/1.4.jpg)

### 5. Create inline function that takes integer which represents manager ID and displays department name, Manager Name and hiring date 

```
CREATE FUNCTION dbo.GetManagerDetails (@ManagerID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        D.Dept_Name,
        Ins.Ins_Name AS ManagerName,
        D.Manager_hiredate
    FROM 
        Department D
    INNER JOIN 
        Instructor Ins  ON D.Dept_Id= Ins.Dept_Id
    WHERE 
        Ins.Dept_Id = @ManagerID
);
SELECT * FROM dbo.GetManagerDetails(10);



```

!['inline function with join statement'](../img/1.5.jpg)

### 6. Create multi-statements table-valued function that takes a string 
If string='first name' returns student first name 
If string='last name' returns student last name  
If string='full name' returns Full Name from student table 
Note: Use “ISNULL” function

```
CREATE FUNCTION dbo.GetStudentName (@Name VARCHAR(20))
RETURNS @Result TABLE (Name VARCHAR(100))
AS
BEGIN
    IF @Name = 'first name'
    BEGIN
        INSERT INTO @Result (Name)
        SELECT ISNULL(St_Fname, 'N/A')
        FROM Student;
    END
    ELSE IF @Name = 'last name'
    BEGIN
        INSERT INTO @Result (Name)
        SELECT ISNULL(St_Lname, 'N/A')
        FROM Student;
    END
    ELSE IF @Name = 'full name'
    BEGIN
        INSERT INTO @Result (Name)
        SELECT 
            ISNULL(St_Fname, '') + ' ' + ISNULL(St_Lname, '') 
        FROM Student;
    END
    RETURN;
END;
SELECT * FROM dbo.GetStudentName('first name');
SELECT * FROM dbo.GetStudentName('last name');
SELECT * FROM dbo.GetStudentName('full name');


```
!['Mulistatement with if condition '](../img/1.6.jpg)
