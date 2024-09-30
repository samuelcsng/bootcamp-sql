-- create new database
CREATE DATABASE ORG;
-- show all database;
SHOW DATABASES;
-- get into database
USE ORG;

-- create table worker
CREATE TABLE WORKER (
	WORKER_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY NUMERIC(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

-- inesrt data to worker
INSERT INTO WORKER
	(FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		('Monika', 'Arora', 100000, '21-02-20 09:00:00', 'HR'),
		('Niharika', 'Verma', 80000, '21-06-11 09:00:00', 'Admin'),
		('Vishal', 'Singhal', 300000, '21-02-20 09:00:00', 'HR'),
		('Mohan', 'Sarah', 300000, '12-03-19 09:00:00', 'Admin'),
		('Amitabh', 'Singh', 500000, '21-02-20 09:00:00', 'Admin'),
		('Vivek', 'Bhati', 490000, '21-06-11 09:00:00', 'Admin'),
		('Vipul', 'Diwan', 200000, '21-06-11 09:00:00', 'Account'),
		('Satish', 'Kumar', 75000, '21-01-20 09:00:00', 'Account'),
		('Geetika', 'Chauhan', 90000, '21-04-11 09:00:00', 'Admin');
SELECT * FROM WORKER;

-- create table bonus
CREATE TABLE BONUS (
	WORKER_REF_ID INTEGER,
	BONUS_AMOUNT NUMERIC(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker (WORKER_ID)
);

-- Task 1: insert data into table BONUS
-- Vivek, with amount 32000 and bonus date 2021 Nov 02
-- Vivek, with amount 20000 and bonus date 2022 Nov 02
-- Amitabh, with amount 21000 and bonus date 2021 Nov 02
-- Geetika, with amount 30000 and bonus date 2021 Nov 02
-- Satish, with amount 4500 and bonus date 2022 Nov 02
INSERT INTO BONUS
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
    (6, 32000, str_to_date('2021 Nov 02', '%Y %b %d')),
    (6, 20000, str_to_date('2022 Nov 02', '%Y %b %d')),
    (5, 21000, str_to_date('2021 Nov 02', '%Y %b %d')),
    (9, 30000, str_to_date('2021 Nov 02', '%Y %b %d')),
    (8, 4500,  str_to_date('2022 Nov 02', '%Y %b %d'))
;
SELECT * FROM BONUS;

-- Task 2:
-- Write an SQL query to show the second highest salary among all workers.
-- SELECT MAX(SALARY) FROM WORKER;
SELECT 
	SALARY
FROM WORKER 
WHERE SALARY < (SELECT MAX(SALARY) FROM WORKER)
ORDER BY SALARY DESC
LIMIT 1;

-- Task 3:
-- Write an SQL query to print the name of employees having the highest salary in each department.
WITH
DEPARTMENT_HIGHEST_SALARY AS (
SELECT
	DEPARTMENT,
	MAX(SALARY) AS HIGHEST_SALARY
FROM WORKER
GROUP BY DEPARTMENT
),
DEPARTMENT_EMPLOYEE_WITH_HIGHEST_SALARY AS (
SELECT
	D.DEPARTMENT,
    W.FIRST_NAME,
    W.LAST_NAME
FROM DEPARTMENT_HIGHEST_SALARY D
LEFT JOIN WORKER W ON D.DEPARTMENT = W.DEPARTMENT
WHERE W.SALARY = D.HIGHEST_SALARY
)
SELECT * FROM DEPARTMENT_EMPLOYEE_WITH_HIGHEST_SALARY;


-- Task 4:
-- Write an SQL query to fetch the list of employees with the same salary.
SELECT
	-- SALARY,
    -- COUNT(1) AS COUNT,
    group_concat(FIRST_NAME) AS SAME_SALARY_LIST
FROM WORKER
GROUP BY SALARY
HAVING (COUNT(1) > 1);


-- Task 5:
-- Write an SQL query to find the worker names with salaries + bonus in 2021
WITH
WORKER_BONUS_2021 AS (
SELECT
	*
FROM BONUS
WHERE year(BONUS_DATE) = 2021
),
WORKER_NAMES_WITH_TOTAL_SALARIES_BONUS_2021 AS (
SELECT
	W1.FIRST_NAME,
    W1.LAST_NAME,
    -- W1.SALARY,
    -- ifnull(W2.BONUS_AMOUNT, 0) AS BONUS,
    W1.SALARY + ifnull(W2.BONUS_AMOUNT, 0) AS TOTAL
    -- W2.BONUS_DATE
FROM WORKER W1
LEFT JOIN WORKER_BONUS_2021 W2 ON W1.WORKER_ID = W2.WORKER_REF_ID 
)
SELECT * FROM WORKER_NAMES_WITH_TOTAL_SALARIES_BONUS_2021;


-- Task 6 (Please complete Task 1-5 first):
-- Try to delete all the records in table WORKER
-- Study the reason why the data cannot be deleted
DELETE FROM WORKER;
-- FAIL BECAUSE 
-- THE RECORDS WITH THE PRIMARY KEY (WORKER_ID) HAS FOREIGN KEY CONSTRAINTS REFERENCING IT 
-- FROM OTHER TABLE (BONUS)


-- Task 7 (Please complete Task 6 first):
-- Try to drop table WORKER
-- Study the reason why the table cannot be deleted
DROP TABLE WORKER;
-- FOREIGN KEY CONSTRAINTS