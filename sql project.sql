show databases;
use liveclass;
show databases;
DROP DATABASE IF EXISTS liveclass;

CREATE DATABASE IF NOT EXISTS liveclass;
use liveclass;
DROP TABLE IF EXISTS worker;
create table worker
(WORKER_ID INT NOT NULL,
FIRST_NAME VARCHAR(25) NOT NULL,
LAST_NAME VARCHAR(15) NOT NULL,
SALARY INT NOT NULL,
JOINING_DATE varchar(50) NOT NULL,
DEPARTMENT VARCHAR(15) NOT NULL
);

INSERT INTO worker(WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT)
VALUES
('001','Monika','Arora','100000','2014-02-20 09:00:00','HR'),
('002','Niharika','Verma','80000','2014-06-11 09:00:00', 'Admin'),
('003','Vishal','Singhal','300000', '2014-02-20 09:00:00','HR'),
('004','Amitabh','Singh','500000','2014-02-20 09:00:00','Admin'),
('005','Vivek','Bhati','500000','2014-06-11 09:00:00','Admin'),
('006','Vipul','Diwan','200000', '2014-06-11 09:00:00','Account'),
('007','Satish','Kumar','75000','2014-01-20 09:00:00','Account'),
('008','Geetika','Chauhan','90000','2014-04-11 09:00:00','Admin');

select * from worker;
DROP TABLE IF EXISTS bonus;
create table bonus
(WORKER_REF_ID INT NOT NULL,
BONUS_DATE VARCHAR(50) NOT NULL,
BONUS_AMOUNT INT NOT NULL);

INSERT INTO bonus(WORKER_REF_ID,BONUS_DATE,BONUS_AMOUNT)
VALUES
('1','2016-02-20 00:00:00','5000'),
('2','2016-06-11 00:00:00','3000'),
('3','2016-02-20 00:00:00','4000'),
('1','2016-02-20 00:00:00','4500'),
('2','2016-06-11 00:00:00','3500');

select * from bonus;

DROP TABLE IF EXISTS title;
create table title
(WORKER_REF_ID INT NOT NULL,
WORKER_TITLE VARCHAR(50) NOT NULL,
AFFECTED_FROM VARCHAR(50) NOT NULL);

INSERT INTO title(WORKER_REF_ID,WORKER_TITLE,AFFECTED_FROM)
VALUES
('1','Manager','2016-02-20 00:00:00'),
('2','Executive','2016-06-11 00:00:00'),
('8','Executive','2016-06-11 00:00:00'),
('5','Manager','2016-06-11 00:00:00'),
('4','Asst.Manager','2016-06-11 00:00:00'),
('7','Executive','2016-06-11 00:00:00'),
('6','Lead','2016-06-11 00:00:00'),
('7','Lead','2016-06-11 00:00:00');
select * from title;

-- 1- write an sql query to fetch "first_name" from workbook using the alias name as "worker_name".

select FIRST_NAME as WORKER_NAME
FROM worker;

-- 2- WRITE an sql query to fetch 'FIRST_NAME' FROM  worker table in upper case

select upper(FIRST_NAME) FROM worker;

-- 3 write an sql query to fetch uniques values of 'Department' from work table
 select count(distinct(DEPARTMENT)) from worker;
 
 -- 4- write an sql query to print the first three characters of First_name from worktable.
 select substr(FIRST_NAME,1,3) from worker;
 
 -- 5 - write an query ti find the position of the alphbate ('a') in the firsatname column 'Amitabh' from worker table.

 SELECT  POSITION('a' IN FIRST_NAME)
FROM worker
where FIRST_NAME = 'Amitabh';

-- 6 - write a sql query to print the 'fist_name'  from worktable after removing the species from the write side.
 select Rtrim(FIRST_NAME) FROM worker;
 
 -- 7 - write a an sql query to print the Department from worker table afetr removing white spaces from the left side.
 select ltrim(DEPARTMENT) FROM worker;
 
 -- 8 - write an sql query that fetches the uniqes values of Department from worker table and printa its length.
 select length(count(distinct(DEPARTMENT))) FROM worker;
 
 -- 9 - write an sql query to print the first_name from work table after replacing 'a' with 'A'
 select  replace(FIRST_NAME,'a','A') from worker;
 
 -- 10 -- write an sql query to print the first_name and last_name from worker table into a single column complete_name . A space char should separate them.
 select concat(FIRST_NAME,'',LAST_NAME) AS complete_name from worker;
 
 -- 11- write an sql query to print  all worker details from the worker table order by FIRST_NAME Ascending.
 
 select WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT
 from worker
 order by FIRST_NAME asc;
 
 -- 12- write an sql quiry to print all worker details from the worker table order by first_name ascending and department descending
select * FROM worker
order by  DEPARTMENT DESC, FIRST_NAME ASC;
 
 -- 13- write an sql query to print details for workers with the first name as 'Vipul' and 'Satish from worker table.
 select * from worker
 where FIRST_NAME IN ('Vipul','Satish');
 
 -- 14 - write an sql query to print details of workers excludiing first names,'Vipul and 'Satish from worker table.alter
  select * from worker
 where FIRST_NAME IN ('Vipul','Satish');
 
 -- 15 - write an sql query to print details of workers with department name 'Admin'.
select * from worker
where DEPARTMENT IN ('Admin');

-- 16 - write an sql query to print details of workers whose first_name contains 'a'

 select * from worker 
 where contains('FIRST_NAME','a');
 
 
 -- 17 Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’
 
 select * from worker where FIRST_NAME LIKE '%a';
 
 -- 18 - Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
  select * from worker where FIRST_NAME LIKE '_____h';
  
  -- 19 - Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
  select * from worker
  where SALARY between 100000 and 500000;
  
  -- 20 -  Write an SQL query to print details of the Workers who have joined in Feb’2014
  select * from worker
  where year(JOINING_DATE)='2014' and month(joining_date)='02';
  
  -- 21 - Write an SQL query to fetch the count of employees working in the department ‘Admin’.

SELECT count(FIRST_NAME)
FROM worker
WHERE DEPARTMENT = 'Admin' ;

-- 22 - Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select SALARY
from worker
where salary >=50000 or salary <= 100000 ;

-- 23 - Write an SQL query to fetch the no. of workers for each department in the descending order
select DEPARTMENT
from worker
order by DEPARTMENT desc;

-- 24 - Write an SQL query to print details of the Workers who are also Managers. \\\ \ \\

select e.WORKER_ID,e.FIRST_NAME,e.LAST_NAME,r.WORKER_TITLE
from worker as e
inner join title as r
on e.WORKER_ID = r.WORKER_ID;

-- 25 - . Write an SQL query to fetch duplicate records having matching data in some fields of a table.
select SALARY , count(*) as NumDuplicates
from worker
group by SALARY
having count(*) > 1;

-- 26- write an sql query to show only odd rows from a table
select * from title
where (WORKER_REF_ID % 2) = 1;

-- 27  Write an SQL query to show only even rows from a table.
select * from title
where mod(WORKER_REF_ID,2)=0;
 --              OR
select * from title
where (WORKER_REF_ID % 2) = 0;

-- 28 - Write an SQL query to clone a new table from another table
select * from title;

create table New_table as select * from title;

select * from New_table;

-- 29 -  Write an SQL query to fetch intersecting records of two tables.
select * from bonus
Inner join title
on bonus.WORKER_REF_ID = title.WORKER_REF_ID;



-- 30 -  Write an SQL query to show records from one table that another table does not have
select * FROM title
left join bonus
on title.WORKER_REF_ID = bonus.WORKER_REF_ID;

-- 31-  Write an SQL query to show the current date and time
select sysdate();

-- 32 Write an SQL query to show the top n (say 10) records of a table.
select * from worker orders limit 10;

SELECT * 
FROM  worker
ORDER BY salary DESc 
 limit 10 ;
 
 -- 33 - Write an SQL query to determine the nth (say n=5) highest salary from a table
 SELECT * 
FROM  worker
ORDER BY salary DESc 
 limit 5;
 
 -- 34 - . Write an SQL query to determine the 5th highest salary without using TOP or limit method

SELECT Salary
FROM Worker W1
WHERE 4 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Worker W2
 WHERE W2.Salary >= W1.Salary
 );



 
 
 -- 35 - Write an SQL query to fetch the list of employees with the same salary.

SELECT *
FROM worker
WHERE Salary IN (
    SELECT Salary
    FROM worker
    GROUP BY Salary
    HAVING COUNT(*) > 1
)


-- 36 - Write an SQL query to show the second highest salary from a table.
select max(SALARY) from worker
where SALARY not in (select max(SALARY) from worker) ;

-- 37 -  Write an SQL query to show one row twice in results from a table.
select * from worker
UNION ALL
select * from worker;

-- 38 - . Write an SQL query to fetch intersecting records of two tables.
select * from bonus
Inner join title
on bonus.WORKER_REF_ID = title.WORKER_REF_ID;



-- 39 -  Write an SQL query to fetch the first 50% records from a table.
select * from worker
where worker_id <= 
(select COUNT(WORKER_ID) /2 from worker)

-- 40 - Write an SQL query to fetch the departments that have less than five people in it
SELECT DEPARTMENT, COUNT(WORKER_ID) FROM worker
group by DEPARTMENT
having count(WORKER_ID) <5;

-- 41 - Write an SQL query to show all departments along with the number of people in there
SELECT DEPARTMENT, COUNT(WORKER_ID) FROM worker
group by DEPARTMENT;

-- 42 - Write an SQL query to show the last record from a tabLE
select * from worker
order by WORKER_ID desc
LIMIT 1;
-- 43 -  Write an SQL query to fetch the first row of a table.
select * from worker
order by WORKER_ID ASC
LIMIT 1;


-- 44 -  Write an SQL query to fetch the last five records from a table

select * from worker
order by WORKER_ID DESC
LIMIT 5;


-- 45 - Write an SQL query to print the name of employees having the highest salary in each department
select FIRST_NAME,LAST_NAME,DEPARTMENT,max(SALARY) from worker
group by DEPARTMENT ;



-- 46 - . Write an SQL query to fetch three max salaries from a table.
 SELECT * 
FROM  worker
ORDER BY salary DESc 
 limit 5;

-- 47 - Write an SQL query to fetch three min salaries from a table
 SELECT *
FROM  worker
ORDER BY salary 
 limit 3;

-- 48 -. Write an SQL query to fetch nth max salaries from a table.
select * from worker 
order by SALARY desc
limit n-1,1;

-- 49 - Write an SQL query to fetch departments along with the total salaries paid for each of them.
select  DEPARTMENT,sum(SALARY) FROM worker
group by DEPARTMENT;

-- 50 - Write an SQL query to fetch the names of workers who earn the highest salary
select FIRST_NAME,LAST_NAME,SALARY from worker
order by SALARY desc limit 1;
