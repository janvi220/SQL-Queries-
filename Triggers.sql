/* create trigger for logging of deleted employees*/

create database triggers
use triggers

create table tblemployee(
id int,
ename varchar(20),
email varchar(50),
departmentid int,
salary money,
DOB date,
experience varchar(20))


drop table tblemployee

INSERT INTO tblemployee VALUES
(1, 'John Doe', 'johndoe@example.com', 101, 60000,'2000-05-11','3y'),
(2, 'Jane Smith', 'janesmith@example.com', 102, 70000,'2004-10-12','5y'),
(3, 'Robert Brown', 'robertbrown@example.com', 103, 65000,'2003-02-22','8y'),
(4, 'Emily Davis', 'emilydavis@example.com', 104, 72000,'2001-12-23','2y'),
(5, 'Michael Johnson', 'michaeljohnson@example.com', 101, 80000,'2002-02-20','7y');

create table tblemployeedeletelog
(
id int,
deletedate datetime)

create trigger tr_tblemployee_afterdelete
on tblemployee
after delete
as 
begin	
	insert into tblemployeedeletelog(id,deletedate)
	select id,GETDATE() from deleted
end
delete from tblemployee where id in (1,2)

select*from tblemployee


/* 2. Create a Trigger for Updating Employee's Last Modified Date on Update*/
create trigger tr_employeeupdate
on tblemployee
after update 
as
begin
	update tblemployee
	set lastmodified = GETDATE()
	from inserted i
	where tblemployee.id = i.id
end

/*3. Trigger to keep log of department IDs that have been deleted. */

create table tblemployeedeletelogid
(
departmentid int,
deletedate datetime)

create trigger tr_tblemployee_afterdelete
on tblemployee
after delete
as 
begin	
	insert into tblemployeedeletelogid(departmentid,deletedate)
	select departmentid,GETDATE()
	from deleted
end
delete from tblemployee where departmentid in (103,104)

/* 4. Create Trigger to prevent duplicate email addresses from being entered in the 
Employees table.*/

create trigger tr_uniqueEmployeeEmail
on tblemployee
after insert,update
as
begin
	if exists (select 1 from inserted i
		join tblemployee e on i.email = e.email


/* 5. Create a Trigger if a column named Status is not provided during an insert, set its 
default value to 'Pending'.*/
default value to 'pending'

create trigger tr_SetDefaultStatus
instead of insert
on Orders
as
begin
	insert into Orders(OrderId, Status)
	select OrderId,ISNULL(Status,'Pending')
	from inserted
end

--AFTER INSERT
create trigger trgafterinsert
on tblemployee
after insert
as
begin
	declare @emp_DOB date, @age int, @emp_expe varchar(20)

	select @emp_DOB = DOB from inserted 
	select @emp_expe = experience from inserted 

--employee age
set @age = year(getdate())-year(@emp_DOB)
if @age > 25
begin
	print 'not elogible age'
	rollback
end

else if @emp_expe <5
begin
	print 'not eligible '
	rollback
end
else
begin
	print 'successfully'
end
end;

insert into tblemployee (id,ename,salary,experience)
values(1,'janvi',50000,4)

select *from tblemployee

--AFTER UPDATE
create table employeehistory(
id int,
ename varchar(20),
old_value varchar(100),
new_value varchar(100),
record_datetime datetime)

INSERT INTO employeehistory (id, ename, old_value, new_value, record_datetime)
VALUES 
(1, 'John Doe', '50000', '55000', '2025-03-01 10:30:00'),
(2, 'Jane Smith', 'HR Manager', 'Senior HR Manager', '2025-03-10 14:20:00'),
(3, 'Alice Brown', 'New York', 'Los Angeles', '2025-03-15 09:45:00'),
(4, 'Mike Johnson', '2020-05-01', '2025-03-01', '2025-03-20 13:10:00'),
(5, 'Emily Davis', 'Project A', 'Project B', '2025-03-21 08:55:00');

select * from employeehistory

create trigger trgafterupdate
on tblemployee   
after update
as
declare @emp_id int,
@emp_name varchar(20),
@emp_oldname varchar(100),
@emp_sal  money,
@emp_oldsal money;

select @emp_id = id from inserted 
select @emp_name = ename from inserted
select @emp_oldname = ename from deleted
select @emp_sal = salary from inserted 
select @emp_oldsal = salary from deleted

if update(ename)
begin
insert into employeehistory(id,ename,old_value,new_value,record_datetime)
values(@emp_id,'ename',@emp_oldname,@emp_name,getdate())
end
if update(salary)
begin
insert into employeehistory(id,ename,old_value,new_value,record_datetime)
values(@emp_id,'ename',@emp_oldname,@emp_name,getdate())
end

--before update
select * from tblemployee
update tblemployee set ename = 'virat' where id = 1
--after update
select * from tblemployee
select * from employeehistory


--AFTER DELETE

create table employeeBackup(
id int,
ename varchar(20),
email varchar(50),
salary money,
DOB date,
experience varchar(20),
record_datetime datetime)

-- Insert sample data into employeeBackup
INSERT INTO employeeBackup (id, ename, email, salary, DOB, experience, record_datetime)
VALUES 
(1, 'John Doe', 'john.doe@example.com', 60000, '1990-02-15', '5y', '2025-03-21 10:00:00'),
(2, 'Jane Smith', 'jane.smith@example.com', 75000, '1987-05-20', '8y', '2025-03-21 10:15:00'),
(3, 'Alice Brown', 'alice.brown@example.com', 50000, '1995-12-10', '3y', '2025-03-21 10:30:00'),
(4, 'Mike Johnson', 'mike.johnson@example.com', 80000, '1983-07-18', '10y', '2025-03-21 10:45:00'),
(5, 'Emily Davis', 'emily.davis@example.com', 55000, '1992-11-25', '4y', '2025-03-21 11:00:00');
delete from employeeBackup
alter trigger afterdelete
on tblemployee
after delete
as
declare @id int, @ename varchar(20),@salary money,@dob date,@age int,@experience varchar(20)
select @id = id from deleted 
select @ename = ename from deleted 
select @salary = salary from deleted
select @dob = DOB from deleted
select @experience = experience from deleted

insert into employeeBackup (id, ename, salary, DOB, experience, record_datetime)
values(@id,@ename,@salary,@dob,@experience,GETDATE())
print'employee details inserted successfully'

--before delete
select * from tblemployee
select * from employeeBackup

delete from tblemployee where id = 2

--after delete 
select * from tblemployee
select * from employeeBackup