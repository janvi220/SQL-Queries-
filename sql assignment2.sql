use JAN2025

select * from EMPLOYEEDETAILS

/* 1) Retrieve all rows from the Employeedetails table. Return only the EID column.*/
select EID from EMPLOYEEDETAILS 

/*	2) Retrieve all rows from the Employeedetails table. Return the EID and Name columns.*/
select EID, ENAME from EMPLOYEEDETAILS

/* 3) Retrieve the top 20 percent of rows from the Employeedetails table. Return the EID, Name and
Age columns.*/
select TOP 20 PERCENT EID, ENAME, EAGE FROM EMPLOYEEDETAILS

/* 4) Retrieve the top 5 rows from the Employeedetails table. Return the EID, Name and Age columns.
Give the EID column an alias "Employee ID", and the Name column an alias "Employee Name".*/
SELECT TOP 5 EID AS Employee_id,ENAME as Employee_Name, EAGE from EMPLOYEEDETAILS

/* 5) Return all rows and all columns from the Employeedetails table. */
SELECT * FROM EMPLOYEEDETAILS

/* 6) Retrieve the top 50 percent of rows and all columns from the Employeedetails table.*/
SELECT TOP 50 PERCENT  * FROM EMPLOYEEDETAILS

/* 7) Return the Name column from the Employeedetails table. Give this column an alias "Employee
Name".*/
SELECT ENAME AS EMPLOYEE_NAME FROM EMPLOYEEDETAILS

/* 8) Return the top 4 rows from Employeedetails*/
SELECT TOP 4 * FROM EMPLOYEEDETAILS

/* 9) Return all rows and all columns from the Employeedetails table.*/
SELECT * FROM EMPLOYEEDETAILS

/* 10) Return the top 3 rows and columns from the Employeedetails table.*/
SELECT TOP 3 * FROM EMPLOYEEDETAILS

select 'Suresh' as Firstname, 'Patel' as Lastname, 'Suresh' + 'Patel' as Fullname

update EMPLOYEEDETAILS ADD 