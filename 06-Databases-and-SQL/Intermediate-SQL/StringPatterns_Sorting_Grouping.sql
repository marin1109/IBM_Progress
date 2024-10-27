-- Retrieve first and last names of employees whose first name starts with 'S'
SELECT F_NAME, L_NAME FROM EMPLOYEES WHERE F_NAME LIKE 'S%';

-- Retrieve all columns of employees, ordered by birth date in ascending order
SELECT * FROM EMPLOYEES ORDER BY B_DATE;

-- Retrieve department ID and average salary for each department where the average salary is greater than or equal to 60,000
SELECT DEP_ID, AVG(SALARY) FROM EMPLOYEES GROUP BY DEP_ID HAVING AVG(SALARY) >= 60000;

-- Retrieve department ID and average salary (alias as 'avgs') for each department where the average salary is greater than or equal to 60,000,
-- and order the results by average salary in descending order
SELECT DEP_ID, AVG(SALARY) as avgs FROM EMPLOYEES GROUP BY DEP_ID HAVING avgs >= 60000 ORDER BY avgs DESC;
