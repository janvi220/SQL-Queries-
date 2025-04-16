
create database Join_practice
 create table Employee(
 EID int primary key,
 Ename varchar(20),
 Salary decimal(10,2) check (salary>10000),
 MID int,
 DID int)

 use Join_practice

 create table Manager(
 MID int,
 Mname varchar(20),
 DID int)

 create table Department(
 DID int,
Dname varchar(20))

create table Project(
PID int primary key,
Pname varchar(20),
EID int)

INSERT INTO Employee (EID, Ename, Salary, MID, DID)
VALUES
    (1, 'David', 12000.00, 101, 1),
    (2, 'Emma', 15000.00, 101, 1),
    (3, 'Frank', 20000.00, 102, 2),
    (4, 'Grace', 13000.00, 103, 3),
    (5, 'Helen', 25000.00, 104, 4),
    (6, 'Ivy', 18000.00, 103, 3),
    (7, 'Jack', 11000.00, 102, 2);


	INSERT INTO Manager (MID, Mname, DID)
VALUES
    (101, 'John', 1),
    (102, 'Alice', 2),
    (103, 'Bob', 3),
    (104, 'Carol', 4);

	INSERT INTO Department (DID, Dname)
VALUES
    (1, 'Sales'),
    (2, 'HR'),
    (3, 'IT'),
    (4, 'Finance');

	INSERT INTO Project (PID, Pname, EID)
VALUES 
    (1001, 'Alpha', 1),
    (1002, 'Walmart', 2),
    (1003, 'Gamma', 3),
    (1004, 'Delta', 7),
    (1005, 'Epsilon', 5),
	(1006,'Blockchain',7),
	(1007,'Banking System',2)
	

/* 1. Fetch Employee name & department name they belong to*/
select e.Ename, d.Dname from Employee e
inner join Department d
on e.DID = d.DID

/* 2. Fetch all Employee & department name*/
select e.Ename, d.Dname from Employee e
left join Department d
on e.DID = d.DID

/* 3. Fetch Employee name, Department name, manager name & project name they are working on*/
select e.Ename, d.Dname , m.Mname,p.Pname from Employee e
inner join Department d on e.DID = d.DID
inner JOIN Manager m on e.MID = m.MID
inner JOIN Project P ON e.EID = p.EID

/* 4.Fetch Employee who are working on more than 1 project*/
select e.Ename, count(p.pid) as total_project, e.eid from Employee e
left join Project p
on e.EID = p.EID
group by e.ename, e.eid
having count(e.EID) >= 1

/* 5.Fetch Employee who are not working on anu project*/
select e.Ename, p.Pname from Employee e
left join Project p
on e.EID = p.EID
where p.EID is null 

/* 6.Fetch Employee who are working on project-walmart*/
select e.Ename, p.Pname from Employee e
left join Project p
on e.EID = p.EID
where p.Pname = 'walmart'