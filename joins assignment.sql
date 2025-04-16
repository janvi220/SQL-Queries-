use JAN2025

create table employeedetail(
Eid int,
Did int,
Ename varchar(100),
salary money)

INSERT INTO employeedetail (Eid, Did, Ename, salary) 
VALUES 
(1, 101, 'John Doe', 50000),
(2, 102, 'Jane Smith', 60000),
(3, 103, 'Robert Brown', 55000),
(4, 104, 'Emily Davis', 52000),
(5, 105, 'William Wilson', 58000);

INSERT INTO employeedetail (Eid, Did, Ename, salary) 
VALUES 
(6, 106, 'Sam Curran', 50000)
INSERT INTO employeedetail (Eid, Did, Ename, salary) 
VALUES 
(7, 107, 'phil salt', 40000)


create table departmentdetail(
Did int,
Dname varchar(100),
managername varchar(100))

INSERT INTO departmentdetail (Did, Dname, managername) 
VALUES 
(101, 'HR', 'Michael Smith'),
(102, 'Finance', 'Sarah Johnson'),
(103, 'IT', 'David Brown'),
(104, 'Marketing', 'Emma Wilson'),
(105, 'Sales', 'James Anderson');

INSERT INTO departmentdetail (Did, managername) 
VALUES 
(106,  'Michael Smith')
INSERT INTO departmentdetail (Did,Dname, managername) 
VALUES 
(107,  'HR','Michael Stark')

/* 1.List all employee and their department names.*/

select e.ename,d.dname from employeedetail e
join departmentdetail d
on e.Did = d.Did

/* 2.List all employees and their department names, including employees who are not assigned to any department.*/
select e.Eid,e.ename,d.dname from employeedetail e
left join departmentdetail d
on e.Did = d.Did

/* 3.list all departments and the number of employees in each department*/
select d.Dname, count(e.eid) from departmentdetail d
left join employeedetail e
on e.did = d.did
group by d.dname

/* 4.find all employee with the highest salary*/
select * from employeedetail
where salary = (select max(salary) from employeedetail)	

/* 5.List all employees who work in the QA department.*/
select e.Ename from employeedetail e
join departmentdetail d
on e.did = d.did
where d.Dname = 'HR'

/* 6.List all departments managed by 'Mitcheal Smith'.*/
	select Dname from departmentdetail 
	where managername ='Michael Smith'

/* 7.List all employees who work in departments managed by 'Mitcheal Smith'.*/
select e.ename from employeedetail e
join departmentdetail d
on e.did = d.did
where d.managername = 'Michael Smith' 


select departmentdetail.did, ename,did,sum(salary) 
from departmentdetail,employeedetail
where departmentdetail.did = employeedetail.did
group by departmentdetail.did, ename,did
