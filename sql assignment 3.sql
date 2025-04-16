/*| EMPLOYEE_ID | FIRST_NAME | LAST_NAME | EMAIL | PHONE_NUMBER | HIRE_DATE | JOB_ID
| SALARY | COMMISSION_PCT | MANAGER_ID | DEPARTMENT_ID |*/

CREATE DATABASE ASSIGNMENT
USE ASSIGNMENT

CREATE TABLE EMPLOYEE(
EMPLOYEE_ID INT,
FIRST_NAME VARCHAR(100),
LAST_NAME VARCHAR(100),
EMAIL VARCHAR(255),
PHONE_NUMBER VARCHAR(150),
HIRE_DATE DATE,
JOB_ID INT,
SALARY MONEY,
COMMISSION_PCT FLOAT,
MANAGER_ID INT,
DEPARTMENT_ID INT)

INSERT INTO EMPLOYEE VALUES
(101, 'Purvi', 'mangukiya', 'purvimangukiya1@example.com', '1234567890', '2022-06-15', 1, 60000, 0.05, 201, 10),  
(102, 'Janvi', 'chovatiya', 'janvichovatiya2@example.com', '9876543210', '2021-09-20', 2, 75000, 0.07, 202, 20),  
(103, 'urvi', 'gajera', 'urvigajera3@example.com', '5556667777', '2023-02-01', 3, 50000, 0.03, 201, 10),  
(104, 'khushi', 'Davi', 'khushidavis4@example.com', '4443332222', '2020-12-10', 4, 80000, 0.08, 203, 30),  
(105, 'dev', 'patel', 'devpatel5@example.com', '1112223333', '2019-05-25', 5, 90000, 0.1, 204, 40);

drop table EMPLOYEE
SELECT *FROM EMPLOYEE
 
/* 1. Write a query to display the names (first_name, last_name) using alias name "First Name", "LastName"*/
select first_name as First_Name, last_name as Last_name from EMPLOYEE

/* 2. Write a query to get unique department ID from employee table*/
select distinct department_id from EMPLOYEE

/* 3. Write a query to get all employee details from the employee table order by first name,
descending*/
select first_name from EMPLOYEE
order by first_name desc

/* 4. Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is
calculated as 15% of salary)*/
select first_name  + last_name as Ename,salary, PF= (salary * 15)/100 from EMPLOYEE

/* 5. Write a query to get the employee ID, names (first_name, last_name), salary in ascending order
of salary*/
select first_name + last_name as Ename, employee_ID,salary from EMPLOYEE
order by salary

/* 6. Write a query to get the total salaries payable to employees*/
select sum(salary) from EMPLOYEE

/* 7. Write a query to get the maximum and minimum salary from employees table.*/
select max(salary) as Maximum, Min(salary) as Minimum from EMPLOYEE

/*	8. Write a query to get the average salary and number of employees in the employees table.*/
select avg(salary) as Average_salary from EMPLOYEE

/* 9. Write a query to get the number of employees working with the company.*/
select count(EMPLOYEE_ID) from EMPLOYEE

/* 10. Write a query to get the number of jobs available in the employees table*/
select count(distinct job_id) as total_job from EMPLOYEE