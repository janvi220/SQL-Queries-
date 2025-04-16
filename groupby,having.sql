
--GROUP BY AND HAVING
/* Find the department with an average salary greater than 20000*/
select DEPARTMENT,AVG(SALARY) FROM EMPLOYEEDETAILS 
GROUP BY DEPARTMENT,SALARY
HAVING AVG(SALARY)> 20000

/* List the cities where the average employee age is greater than 20*/
select CITY, avg(EAGE) FROM EMPLOYEEDETAILS
GROUP BY CITY,EAGE
HAVING EAGE > 20

/* Find the department with more than 5 employees*/
SELECT DEPARTMENT, COUNT(*) FROM EMPLOYEEDETAILS
GROUP BY DEPARTMENT
HAVING COUNT(*) > 2

/* List the cities where the total salary of all employees exceeds 30000*/
SELECT CITY, SUM(SALARY) FROM EMPLOYEEDETAILS
GROUP BY CITY, SALARY
HAVING SUM(SALARY) > 30000

/* Find the department where the average age of employees is between 20 and 25*/
SELECT DEPARTMENT FROM EMPLOYEEDETAILS
GROUP BY DEPARTMENT
HAVING AVG(EAGE) BETWEEN 20 AND 25



