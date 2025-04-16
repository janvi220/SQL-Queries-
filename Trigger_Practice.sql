create database Triggerprac
use Triggerprac

--Triggers
--drop trigger <tablename>
--disable trigger <triggername > on <tablename>
--enable trigger <triggername > on <tablename>

--log every time a new customer is added to the customers table 
CREATE TABLE tblEmployee
(
  Id int Primary Key,
  Name nvarchar(30),
  Salary int,
  Gender nvarchar(10),
  DepartmentId int
)

Insert into tblEmployee values (1,'John', 5000, 'Male', 3)
Insert into tblEmployee values (2,'Mike', 3400, 'Male', 2)
Insert into tblEmployee values (3,'Pam', 6000, 'Female', 1)


CREATE TABLE tblEmployeeAudit
(
  Id int identity(1,1) primary key,
  AuditData nvarchar(1000)
)
--inserting command
CREATE TRIGGER tr_tblEMployee_ForInsert
ON tblEmployee
FOR INSERT
AS
BEGIN
 Declare @Id int
 Select @Id = Id from inserted
 
 insert into tblEmployeeAudit 
 values('New employee with Id  = ' + Cast(@Id as nvarchar(5)) + ' is added at ' + cast(Getdate() as nvarchar(20)))
END

disable trigger tr_tblEMployee_ForInsert on tblEmployee
enable trigger tr_tblEMployee_ForInsert on tblEmployee


Insert into tblEmployee values (7,'Tan', 2300, 'Female', 3)

CREATE TRIGGER tr_tblEMployee_ForDelete
ON tblEmployee
FOR DELETE
AS
BEGIN
 Declare @Id int
 Select @Id = Id from deleted
 
 insert into tblEmployeeAudit 
 values('An existing employee with Id  = ' + Cast(@Id as nvarchar(5)) + ' is deleted at ' + Cast(Getdate() as nvarchar(20)))
END

delete from tblEmployee where id=7
select *from tblEmployee
select *from tblEmployeeAudit

--to prevent the stockQuantity in a product table from becoming negative
create table Produc
(id int,
stockQuantity int,
Pname varchar(50))
INSERT INTO Produc (id, stockQuantity, Pname)
VALUES 
    (1, 100, 'Laptop'),
    (2, 50, 'Smartphone'),
    (3, 200, 'Headphones'),
    (4, 30, 'Monitor'),
    (5, 150, 'Keyboard');

create trigger preventNegativeStock
ON Produc
after UPDATE
AS
BEGIN
 if EXISTS (select 1 from inserted where StockQuantity<0)
 begin
 raiserror ('stockquantity can not be negative.',16,1);
 rollback transaction 
 end
 end

 update produc set stockQuantity=8 where id=4
 select *from Produc