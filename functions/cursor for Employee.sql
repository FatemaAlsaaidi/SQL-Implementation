USE Company_SD; 
select * from Employee
-- 1. Declare the variables to be used with the cursor.
DECLARE @SSN INT;
DECLARE @CurrentSalary DECIMAL(10, 2);
DECLARE @NewSalary DECIMAL(10, 2);

-- 2. Declare Cursor
DECLARE EmployeeSalaryCursor CURSOR FOR
SELECT SSN, Salary
    FROM Employee
    ORDER BY SSN; -- It is preferable to arrange the data to ensure a logical sequence when processing the index.

-- 3. Open the Cursor
OPEN EmployeeSalaryCursor;

-- 4. Fetch frist row fron Cursor
FETCH NEXT FROM EmployeeSalaryCursor INTO @SSN, @CurrentSalary;

-- 5. start loop for preprocess every row
WHILE @@FETCH_STATUS = 0
BEGIN
    -- 6. Salary increase process
    IF @CurrentSalary < 3000
    BEGIN
        SET @NewSalary = @CurrentSalary * 1.10; 
    END
    ELSE
    BEGIN
        SET @NewSalary = @CurrentSalary * 1.20; 
    END;

    -- 7. Salary Update in employee table 
    UPDATE Employee
    SET Salary = @NewSalary
    WHERE SSN = @SSN;

    -- 8. fetch second row from cursor
    FETCH NEXT FROM EmployeeSalaryCursor INTO @SSN, @CurrentSalary;
END;

-- 9. close cursor
CLOSE EmployeeSalaryCursor;

-- 10. Unallocate the Cursor to free up resources.
DEALLOCATE EmployeeSalaryCursor;

PRINT 'Employee Salary successfully update';
