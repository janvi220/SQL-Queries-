create database emp
use emp

/* Create below table and give constraint and perform the queries.
Create sales table
sale_id
product_id,
customer_id,
sale_date,
quantity,
price,
region,*/

create table sales(
sale_id int primary key,
product_id int not null,
customer_id int not null ,
sale_date date,
quantity int check (quantity > 0),
price decimal(10,2) check (price> 100),
region varchar(20))


-- Insert sample sales records
-- Insert sample sales records
INSERT INTO sales (sale_id, product_id, customer_id, sale_date, quantity, price, region)
VALUES 
    (1, 101, 1001, '2025-01-10', 5, 150.0, 'North'),
    (2, 102, 1002, '2025-01-12', 3, 200.0, 'South'),
    (3, 103, 1003, '2025-01-14', 10, 250.0, 'East'),
    (4, 104, 1004, '2025-01-16', 8, 120.0, 'West'),
    (5, 105, 1005, '2025-01-18', 2, 180.0, 'North'),
    (6, 106, 1006, '2025-01-20', 7, 300.0, 'South'),
    (7, 107, 1007, '2025-01-22', 4, 220.0, 'East'),
    (8, 108, 1008, '2025-01-24', 6, 140.0, 'West'),
    (9, 109, 1009, '2025-01-26', 9, 350.0, 'North'),
    (10, 110, 1010, '2025-01-28', 11, 400.0, 'South');

    
 
 /* 1. Write a query to find the total sales amount for each product.*/
select product_id, sum(quantity*price) from sales group by product_id 

/* 2. Write a query to find the average quantity sold for each region.*/
select region, avg(quantity) from sales 
group by region

/* 3. Write a query to count the number of sales for each customer.*/
select customer_id , count(quantity) from sales 
group by customer_id

/* 4. Write a query to find the maximum sale amount in each region.*/
select max(quantity*price),region from sales 
group by region 

/* 5. Write a query to find the minimum quantity sold for each product.*/
select min(quantity),product_id from sales 
group by product_id

/* 6. Write a query to find the total sales amount for each product, but only include
products with total sales greater than 1000.*/
select product_id,sum(quantity*price) from sales
group by product_id
having sum(quantity*price) > 1000

/* 7. Write a query to find the average quantity sold for each region, but only include
regions with more than 10 sales. */
select region, avg(quantity) from sales
group by region
having avg(quantity) > 5

/* 8. Write a query to find the total sales amount for each customer, but only include
customers with a maximum sale amount greater than 500.*/
select sum(quantity* price),customer_id from sales
group by customer_id 
having max(quantity* price) > 500

/* 9. Write a query to find the average sale amount for each customer, but only include
customers with more than 5 sales.*/
select avg(quantity*price),customer_id from sales
group by customer_id
having sum(quantity) > 5

/* 10. Write a query to find the total sales amount for each region, but only include regions
with total sales greater than 5000.*/
select avg(quantity*price),region from sales
group by region
having avg(quantity*price)>500
	
--AGGRIGATE FUNCTION
use JAN2025
/* 1) How many rows are in the Employeedetails table? */
select count(*) AS COUNT from EMPLOYEEDETAILS

/* 2) How many rows in the Employeedetails table do not have a NULL value in the Age column?*/
select EAGE from EMPLOYEEDETAILS 
WHERE EAGE IS NOT NULL

/* 3) What is the average Salary for QA Department?*/
SELECT AVG(SALARY) AS AVRAGE_SALARY FROM EMPLOYEEDETAILS WHERE DEPARTMENT = 'QA'

/* 5) How expensive is the highest Salary in the Employeedetails table?*/
SELECT MAX(SALARY) AS HIGHEST_SALARY FROM EMPLOYEEDETAILS

/* 6) What is the total salary expenditure for the entire company*/
SELECT SUM(SALARY) AS TOTAL_SALARY FROM EMPLOYEEDETAILS

/* 7) What is the average age of employees in the "FS" department?*/
SELECT AVG(EAGE) AS AVG_AGE FROM EMPLOYEEDETAILS WHERE DEPARTMENT = 'FS'

/* 8)What is the youngest employee's age in the company?*/
SELECT MIN(EAGE) FROM EMPLOYEEDETAILS

/* 9) How many different cities are employees located in?*/
SELECT COUNT(CITY) FROM EMPLOYEEDETAILS