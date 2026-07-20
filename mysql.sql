CREATE DATABASE company;

USE company;

CREATE TABLE employees(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50) NOT NULL,
department VARCHAR(30),
salary INT,
city VARCHAR(30),
age INT
);

INSERT INTO employees
(emp_id, emp_name, department, salary, city, age)
VALUES
(01, 'Ali', 'Finance', 80000 , 'Lahore', 25),
(02, 'Sara', 'IT', 60000 , 'Lahore', 23),
(03, 'Ahmad', 'Sales', 65000 , 'Gujranwala', 28),
(04, 'Hassan', 'Finance', 80000 , 'Multan', 30),
(05, 'Zainab', 'Finance', 70000 , 'Sargodhah', 25),
(06, 'Zayan', 'IT', 90000 , 'Sialkot', 28),
(07, 'Zurain', 'HR', 100000 , 'Gujranwal', 27),
(08, 'Arayan', 'IT', 80000 , 'Sialkot', 26),
(09, 'Alayan', 'Finance', 70000 , 'Sialkot', 24),
(10, 'Ayat', 'HR', 950000 , 'Sialkot', 22);

SELECT * FROM employees;

SELECT emp_name, salary FROM employees;

SELECT DISTINCT department FROM employees;

SELECT * FROM employees
WHERE department = 'IT';

SELECT * FROM employees
WHERE salary > 70000;

SELECT * FROM employees
WHERE age BETWEEN 25 AND 30;

SELECT * FROM employees
WHERE city IN ('Lahore' , 'Karachi');

SELECT * FROM employees
WHERE department NOT IN('HR');

SELECT * FROM employees
ORDER BY salary DESC;

SELECT * FROM employees
ORDER BY emp_name ASC;

SELECT * FROM employees
ORDER BY salary DESC LIMIT 3;

SELECT MAX(salary)
FROM employees;

SELECT MIN(salary)
FROM employees;

SELECT AVG(salary)
FROM employees;

SELECT Sum(salary)
FROM employees;

SELECT COUNT(emp_id)
FROM employees;

SELECT department, COUNT(emp_id)
FROM employees
GROUP BY department;

SELECT department, AVG(salary)
FROM employees
GROUP BY department;

SELECT city, MAX(salary)
FROM employees
GROUP BY city;

SELECT department, COUNT(emp_id)
FROM employees
GROUP BY department
HAVING COUNT(emp_id)> 3;

SELECT city, MAX(salary)
FROM employees
GROUP BY city
HAVING MAX(salary) >= 70000;

SELECT city, AVG(salary)
FROM employees
GROUP BY city
HAVING AVG(salary) >= 70000;

UPDATE employees
SET salary =  65000
WHERE emp_id = 2;

SELECT * FROM employees;

UPDATE employees
SET department = 'Finance'
WHERE department = 'Sales';

UPDATE employees
SET salary = salary + 5000
WHERE department = 'IT';

SELECT * FROM employees;

DELETE FROM employees
WHERE emp_id = 3;

SELECT * FROM employees;

DELETE FROM employees
WHERE department = 'HR';

SELECT * FROM employees;

ALTER TABLE employees
ADD COLUMN email VARCHAR(100);

SELECT * FROM employees;

ALTER TABLE employees
RENAME TO emp_info;

ALTER TABLE emp_info
CHANGE COLUMN department emp_department 
VARCHAR(30) NOT NULL ;

SELECT * FROM emp_info;

ALTER TABLE emp_info
MODIFY COLUMN age VARCHAR(50) NOT NULL;

ALTER TABLE emp_info
DROP email;

SELECT * FROM emp_info;

SELECT MAX(salary)
FROM (
	SELECT * 
    FROM emp_info 
    WHERE city = 'Sialkot') 
    AS Temp;

SELECT  
	salary , emp_name
FROM emp_info
WHERE salary > (
	SELECT AVG(salary) 
    FROM emp_info 
    );

SELECT  salary , emp_name
FROM emp_info
WHERE salary = (
	SELECT MAX(salary) 
    FROM emp_info 
    );

SELECT *
FROM emp_info
WHERE emp_department =(
	SELECT emp_department 
    FROM emp_info 
    WHERE emp_name = 'Ali'
    );


SELECT * 
FROM emp_info
WHERE Salary > (
	SELECT salary 
    FROM emp_info 
    WHERE emp_name = 'sara'
    );
    
    SELECT 
			emp_name, 
			salary
    FROM emp_info
    WHERE salary > (
		SELECT salary
        FROM emp_info 
        WHERE emp_name = 'Hassan'
        );

SELECT 
	emp_name, emp_department
FROM emp_info
WHERE emp_department = (
	SELECT emp_department 
    FROM emp_info 
    WHERE emp_name = 'Zayan'
    );

SELECT * 
FROM emp_info 
WHERE salary = (
	SELECT MIN(salary) 
	FROM emp_info
    );
    
SELECT * 
FROM emp_info 
WHERE salary > (
	SELECT AVG(salary) 
    FROM emp_info
    )
AND salary <> (
	SELECT MAX(salary) 
    FROM emp_info
    );
    
SELECT MAX(salary)
    FROM emp_info
    WHERE salary <> ( 
		SELECT MAX(salary) 
        FROM emp_info 
        )
AND  salary <> (
	SELECT MAX(salary) 
    FROM emp_info 
    WHERE salary <>(
		SELECT MAX(salary) 
		FROM emp_info
        )
	);

    
SELECT MAX(salary)
FROM emp_info
WHERE salary <> ( 
	SELECT MAX(salary) 
	FROM emp_info 
	)
AND  salary <> (
	SELECT MAX(salary) 
    FROM emp_info 
    WHERE salary <>(
		SELECT MAX(salary) 
		FROM emp_info
        )
	)
AND  salary <> (
	SELECT MAX(salary) 
    FROM emp_info 
    WHERE salary <> (SELECT MAX(salary) FROM emp_info
	 salary <> (SELECT MAX(salary) FROM emp_info)

    )
);

SELECT * 
FROM emp_info 
WHERE salary > (SELECT AVG(salary) FROM emp_info);




