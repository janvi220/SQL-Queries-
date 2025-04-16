create database Practice
use Practice

create table EmployeeDetail(
Eid int,
First_Name varchar(50),
Last_name varchar(50),
salary money,
joining_date Date,
Department varchar(100),
Gender varchar(50))

insert into EmployeeDetail values 
(1,'vikas','ahlawat',600000,'2013-02-15','IT','Male'),
(2,'nikita','jain',530000,'2014-01-09','HR','Female'),
(3,'Ashish','kumar',100000,'2014-01-09','IT','Male'),
(4,'Nikhil','sharma',480000,'2014-01-09','HR','Male'),
(5,'Anish','kanon',500000,'2014-01-09','Payroll','Male')

alter table EmployeeDetail
add ProjectName varchar(20)

create table Projectdetail
(projectdetailId int,
employeedetailId int,
projectName varchar(20))

insert into Projectdetail values
(1,1,'Task Track'),
(2,1,'CLP'),
(3,1,'Survey Managment '),
(4,2,'HR management'),
(5,3,'Task track'),
(6,3,'GRS'),
(7,3,'DDS'),
(8,4,'HR managment'),
(9,6,'GL managment')

select *from EmployeeDetail

--for retrive only year
select DATEPART(Year,joining_date) from EmployeeDetail

--for retrive only month
select datepart(month,joining_date) from EmployeeDetail

--for get system date
select getdate()
	
--utc date
select getutcdate()

--diffrence between current and hiredate
select First_name, getdate() as [current date],joining_date, datediff(mm,joining_date,getdate()) as [month diffrence] from EmployeeDetail

select First_name, getdate() as [current date],joining_date, datediff(dd,joining_date,getdate()) as [days diffrence] from EmployeeDetail

--find year 
select * from EmployeeDetail
where datepart(yyyy,joining_date) = 2024


select * from EmployeeDetail
where datepart(mm,joining_date) = 04

select * from EmployeeDetail
where joining_date between '2014-01-01' and '2025-01-01'

--removing white space from left and right	
select rtrim(first_name) from EmployeeDetail
select ltrim(first_name) from EmployeeDetail

-- Display first name and Gender as M/F.(if male then M, if Female then F)
SELECT First_Name, CASE WHEN Gender = 'Male' THEN 'M'
WHEN Gender = 'Female' THEN 'F' END AS [Gender]
FROM EmployeeDetail

--Select second highest salary from "EmployeeDetail" table.
select top 1 salary from
(select top 3 salary from EmployeeDetail
order by salary desc) T
order by salary

/*Write the query to get the department and department wise total(sum) salary, 
display it in ascending order according to salary.*/
select department, sum(salary) from EmployeeDetail
GROUP BY Department
order by sum(SALARY) desc

/* Write the query to get the department, total no. of departments, total(sum) salary 
with respect to department from "EmployeeDetail" table.*/
select department,sum(salary),count(*) from EmployeeDetail
group by Department

/* Get department wise average salary from "EmployeeDetail" table order by salary 
ascending*/
select Department,avg(salary) from EmployeeDetail
group by Department
order by avg(salary)

/* Write down the query to fetch Project name assign to more than one Employee*/
select employeedetailId ,count(*) as [total Project] from Projectdetail
group by employeedetailId
having count(*) >1


