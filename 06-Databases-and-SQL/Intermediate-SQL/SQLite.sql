-- Calculate the average salary from the top 5 lowest salaries in the EMPLOYEES table
SELECT AVG(SALARY) FROM 
(SELECT SALARY FROM EMPLOYEES ORDER BY SALARY LIMIT 5) as TopSalaries;

-- Retrieve first and last names of employees whose age is greater than the average age of all employees
SELECT F_NAME, L_NAME 
FROM EMPLOYEES 
WHERE TIMESTAMPDIFF(YEAR, B_DATE, CURRENT_DATE) > 
(
    -- Calculate the average age of all employees
    SELECT AVG(TIMESTAMPDIFF(YEAR, B_DATE, CURRENT_DATE)) 
    FROM EMPLOYEES
);

-- Retrieve employee ID, years of service, and the average years of service across all job histories
SELECT EMPL_ID, TIMESTAMPDIFF(YEAR, START_DATE, CURRENT_DATE) AS Years_Service, 
(SELECT AVG(TIMESTAMPDIFF(YEAR, START_DATE, CURRENT_DATE)) FROM JOB_HISTORY) AS AVG_SERVICE 
FROM JOB_HISTORY;
