create database  storeprocedure
use  storedprocedure
execute sp_tables
--store procedure
/*why use:1.reusability
2.encapsulation
3.perfomance
4.security
*/

--usecase of store procedure
--1.add a new customer to the database
select * from customers
alter procedure addNewCustomer
@cid int,
@cfname varchar(20),
@clname varchar(20),
@cemail varchar(20)
as 
begin 
	insert into customers(CustomerID,FirstName,LastName,Email) 
	values (@cid, @cfname,@clname ,@cemail)
end

exec addNewCustomer '6' ,'Rajat','Patidar','rajat.patidar@example.com'

--2.update the price of a product
alter procedure updatePrice
@pid int,
@price decimal(10,2)
as
begin
	update Products set  Pprice=@price 
	where ProductID=@pid 
end

exec updatePrice 1,85000
drop proc updatePrice

select * from Products
--3.delete an order
select *from Orderss

create procedure deleteOrder
@order_id int
as
begin
	delete from Orderss
	where Orderid = @order_id
end

exec deleteOrder 2

--get the total number of orders for a customer
select * from Orderss
insert into Orderss values 
(1,10,25058,'2025-02-10'),
(2,56,23620,'2023-03-02'),
(2,66,225620,'2023-05-02')

create procedure totalOrder
@order_id int,
@quantity int output
as
begin
	select @quantity = count(*) from Orderss
	where  Orderid = @order_id 
end

declare @id int
exec totalOrder 2, @id output
select @id	

--synytax for store procedure
create procedure getempdeparcity --give name as storeprocedure spgetempdeparcity
as
begin
select department,city from employeedetails
end

--alter procedure
Alter procedure getempdeparcity
@department varchar(20),
@city varchar(20)
as
begin
select department,city from employeedetails
where department = @department and city = @city
end


--show syntax for all procedure
sp_helptext getempdeparcity

create procedure getdepidgend
@depid int,
@gender varchar(20)
with encryption--not everyone can see the result for security purpose
as
begin
select DID,GENDER FROM employeedetailS
end

--executing
getdepidgend 101,'MALE'
getempdeparcity 'QA','Vadodara'
getempdeparcity @city='Vadodara',@department='QA'--order does not matter 
exec getempdeparcity
execute getempdeparcity

--drop procedure
drop proc getempdeparcity 

create table Orderdetail
(cusid int,
orderid int,
orderdate date,
totalamount money)

insert into Orderdetail values
(1,101,'2023-4-4',1500),
(2,102,'2024-5-12',400),
(3,103,'2022-6-14',500),
(4,104,'2021-7-5',600)

select *from Orderdetail

create procedure Getcusdetail
@cid int
as
begin
select cusid,orderid,orderdate,totalamount from Orderdetail
where cusid = @cid
end

Getcusdetail 1 --executing 

create table products
(pid int,
pname varchar(150),
price money)

create procedure productdetail
@productname varchar(150),
@pprice money
as
begin
insert into products(pname,price)
values(@productname,@pprice)
end 
productdetail 'phone',1500

select *from products

--stored procedure with output/out parameter
create procedure DoubleNumber
@InputNumber int,
@OutputNumber int output
as
begin
set @OutputNumber=@InputNumber*2
end

declare @result int --here @result and outputnumber both as same data type
exec DoubleNumber 5, @result output
select @result as result

--alter (it is used for reusability)
alter procedure DoubleNumber
@InputNumber int,
@OutputNumber int output
as
begin
set @OutputNumber=@InputNumber*3
end

create procedure calculatebill
@NumberofCoffee int,
@PriceperCoffee decimal(10,2),
@Totalbill int output
as
begin
set @Totalbill=@NumberofCoffee * @PriceperCoffee
end

drop procedure calculatebill

declare @Customerbill int
exec calculatebill 2,500, @Customerbill output
select  @Customerbill

--difference between sp_helptext and sp_help
sp_helptext  calculatebill
sp_help  calculatebill
sp_depends  employees--give table table

/*PRACTICE*/

/*Get Customer Details: Create a stored procedure that takes a CustomerID as input and returns the
customer's FirstName, LastName, and Email from a Customers table.*/

create table customers(
CustomerID int,
FirstName varchar(50),
LastName varchar(50),
Email varchar(255))

INSERT INTO customers (CustomerID, FirstName, LastName, Email) VALUES
(1, 'John', 'Doe', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'jane.smith@example.com'),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com'),
(4, 'Emily', 'Davis', 'emily.davis@example.com'),
(5, 'Robert', 'Brown', 'robert.brown@example.com');

create procedure customerdetail
@cid int
as
begin
select FirstName, LastName, Email from customers
where CustomerID = @cid
end

customerdetail 1

/*Add a New Product:Create a stored procedure that takes ProductID, ProductName, Description, and
Price as input and inserts a new product into a Products table.*/
create table products
(Pid int,
Pname varchar(150),
Decription varchar(100),
Price money)
drop table products

create procedure addnewProduct
@ppid int,
@pname varchar(20),
@Pdes varchar(20),
@Price money output
as
begin
		insert into Products(ProductID,ProductName,PDescription,Pprice )
		values (@ppid,@pname,@Pdes,@Price)
end

addnewProduct 7,'shirt','Prada',250000
select *from products

/*Update Product Price: Create a stored procedure that takes a ProductID and a NewPrice as input and
updates the price of the specified product in the Products table.*/
create procedure updatePprice
@pid int,
@price money output
as
begin
	update Products set Pprice = @price
	where ProductID = @pid
end

updatePprice 7 , 150000

/*Get Orders by Date Range:Create a stored procedure that takes StartDate and EndDate as input and returns all
orders placed within that date range from an Orders table.*/
create table Orders
(Orderid int,
Startdate date,
Enddate date)

INSERT INTO Orders (OrderID, StartDate, EndDate) VALUES
(101, '2022-03-01', '2024-03-05'),
(102, '2024-03-02', '2024-03-06'),
(103, '2023-03-03', '2024-03-07'),
(104, '2020-03-04', '2024-03-08'),
(105, '2021-03-05', '2023-03-09');

create procedure dateOrder
@sdate date,
@edate date
as
begin
	select * from Orders
	where Startdate = @sdate and Enddate = @edate
end

	dateOrder '2020-03-04', '2024-03-08'

/*Calculate Order Total: Create a stored procedure that takes an OrderID as input and calculates the total
amount of the order (sum of Quantity * UnitPrice from an OrderDetails table).
Return the total amount as an output parameter.*/
create table Orders1
(Orderid int,
Productid int,
Quantity int,
Unitprice money,
Orderdate date)
drop table Orders1
INSERT INTO Orders1  VALUES
(1,101, 5, 19.99, '2024-03-01'),
(2,102, 10, 9.50, '2024-03-02'),
(3,103, 3, 25.75, '2024-03-03'),
(4,104, 7, 15.20, '2024-03-04'),
(5,105, 2, 50.00, '2024-03-05');

create procedure calculatetotalorder
@qun int,
@unitP money,
@totalamount money output
as
begin
	Set @totalamount = @qun * @unitP
end

declare @result money
exec calculatetotalorder 7,25.75 ,@result output
select @result

drop procedure sptotalamount

/*Get Top N Products:Create a stored procedure that takes a number N as an input, and returns the top N
products by total sales from a products table, and an order details table.*/
create table prod
(Productid int,
Pname varchar(150),
Decription varchar(100),
Price money)
INSERT INTO Prod (ProductID, Pname, Decription, Price) VALUES
(101, 'Laptop', 'High-performance laptop', 75000.00),
(102, 'Smartphone', 'Latest 5G smartphone', 55000.00),
(103, 'Tablet', '10-inch display tablet', 30000.00),
(104, 'Smartwatch', 'Fitness tracking smartwatch', 15000.00),
(105, 'Headphones', 'Wireless noise-canceling headphones', 12000.00);
drop table prod
create table Orde
(Orderid int,
Productid int,
Quantity int,
Unitprice money,
Orderdate date)
drop table Orders1
INSERT INTO Orde  VALUES
(1,101, 5, 19.99, '2024-03-01'),
(2,102, 10, 9.50, '2024-03-02'),
(3,103, 3, 25.75, '2024-03-03'),
(4,104, 7, 15.20, '2024-03-04'),
(5,105, 2, 50.00, '2024-03-05');

create procedure fornproducts
@N int
as
begin
     select top(@N) p.Productid, p.PName, SUM(od.Quantity * od.UnitPrice) AS TotalSales
	 from prod p
	 JOIN Orde od ON od.ProductiD = p.ProductiD
	 GROUP BY p.ProductID, p.PName
	 ORDER BY TotalSales DESC;
end 

exec fornproducts 2


use JAN2025
/* Create a Stored Procedure to Retrieve details of All Employees*/

select * from EMPLOYEEDETAILS

create procedure allempdetails
as
begin
	select * from EMPLOYEEDETAILS
end

exec allempdetails

/* 2. Create a stored procedure that retrieves details of a specific employee by their ID.*/
create procedure foremployeeid
@emid int
as
begin	
	select * from EMPLOYEEDETAILS
	where EID = @emid
end

exec foremployeeid 2

/* 3. Create a procedure to insert a new employee into the Employees table.*/
create procedure addnewemployee
@emid int,
@emname varchar(20),
@emage int ,
@Edepart varchar(10),
@esalary money,
@Ecity varchar(20) output
as
begin 
	  insert into EMPLOYEEDETAILS (EID,ENAME,EAGE,DEPARTMENT,SALARY,CITY)
	  values (@emid,@emname,@emage, @Edepart,@esalary,@Ecity)
end

exec addnewemployee 11, 'meet',25,'DE',263004,'Pune'

/* 4. Create a procedure that returns the total number of employees with respect to their 
department.*/

alter procedure totalemployee  
@depart varchar(20)   
as  
begin  
     select count(EID) from EMPLOYEEDETAILS  
	where DEPARTMENT = @depart  
end

exec totalemployee 'DE' 

sp_helptext totalemployee

/* 5. Create a procedure to update the Experience of an employee by their ID.*/

create procedure updateemployee
@id int
as
begin 
		update EMPLOYEEDETAILS set experience = '2y'
		where EID = @id
end
exec updateemployee 2

UPDATE EMPLOYEEDETAILS
SET experience = '5 years'
WHERE EID = 2;
