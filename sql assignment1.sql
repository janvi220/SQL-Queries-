use JAN2025

SELECT * FROM EMPLOYEEDETAILS

/*1) Return the Name column from Employeedetails where the Name column is equal to
"Suresh".*/
select ENAME from EMPLOYEEDETAILS where ENAME = 'suresh'

/* 2) Find the top 3 rows from Employeedetails where the Salary is not equal to 0. */
select top 3 * from EMPLOYEEDETAILS where SALARY <> 0

/* 3) Return all rows and columns from Employeedetails where the employee’s Name starts with a
letter less than “D”.*/
select * from EMPLOYEEDETAILS where ENAME < 'd'

/* 4) Return all rows and columns from Employeedetails where the City column is equal to "Vadodara".*/
select * from EMPLOYEEDETAILS where CITY = 'Vadodara'

/* 5) Return the Name column from Employeedetails where the Name is equal to "JANVI". Give
the column alias "Employee Name". */
select ENAME as Employee_Name from EMPLOYEEDETAILS where Ename = 'janvi' 

/* 6) Using the Employeedetails table, find all employees with a Department equal to "QA" or all
employees who have an Age greater than 23 and a Salary less than 50000. */
select * from EMPLOYEEDETAILS where (DEPARTMENT = 'QA' or EAGE > 23) and SALARY < 50000

/* 7) Find all employees from Employeedetails who have a Department in the list of: "DA", "FS",
and "DE". Complete this query twice – once using the IN operator in the WHERE clause and a
second time using multiple OR operators.*/
 select * from EMPLOYEEDETAILS where (DEPARTMENT = 'DA' or DEPARTMENT = 'FS' or DEPARTMENT = 'DE')

 select * from EMPLOYEEDETAILS where DEPARTMENT IN ('DA', 'FS', 'DE')

 /* 8) Find all employees from Employeedetails whose Name starts with the letter “S”.*/
 select * from EMPLOYEEDETAILS where ENAME like 's%'

 /* 9) Find all employees from Employeedetails whose Name ends with the letter “a”.*/
 select * from EMPLOYEEDETAILS where ENAME like '%a'

 /* 10) Return all columns from the Employeedetails table for all employees who have a
Salary. That is, return all rows where the Salary column does not contain a NULL
value.*/
select * from EMPLOYEEDETAILS where SALARY is not null

/* 11) Return the EID and Salary columns from Employeedetails for all employees who have a
Department and whose Salary exceeds MEANS GREATER 20,000.*/
select EID , SALARY from EMPLOYEEDETAILS where DEPARTMENT <> NULL OR SALARY > 20000