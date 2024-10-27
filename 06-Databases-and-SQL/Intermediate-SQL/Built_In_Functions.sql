-- Calculate the total cost of all rescues
SELECT SUM(COST) FROM PETRESCUE;

-- Calculate the total cost and alias the result as SUM_OF_COST
SELECT SUM(COST) AS SUM_OF_COST FROM PETRESCUE;

-- Find the maximum quantity of rescued animals
SELECT MAX(QUANTITY) FROM PETRESCUE;

-- Find the minimum quantity of rescued animals
SELECT MIN(QUANTITY) FROM PETRESCUE;

-- Calculate the average cost of all rescues
SELECT AVG(COST) FROM PETRESCUE;

-- Round the cost of all rescues to the nearest whole number
SELECT ROUND(COST) FROM PETRESCUE;

-- Round the cost of all rescues to 0 decimal places
SELECT ROUND(COST, 0) FROM PETRESCUE;

-- Round the cost of all rescues to 2 decimal places
SELECT ROUND(COST, 2) FROM PETRESCUE;

-- Get the length of the animal name for each rescue
SELECT LENGTH(ANIMAL) FROM PETRESCUE;

-- Convert the animal name to uppercase for each rescue
SELECT UCASE(ANIMAL) FROM PETRESCUE;

-- Convert the animal name to lowercase for each rescue
SELECT LCASE(ANIMAL) FROM PETRESCUE;

-- Extract the day from the rescue date for each rescue
SELECT DAY(RESCUEDATE) FROM PETRESCUE;

-- Extract the month from the rescue date for each rescue
SELECT MONTH(RESCUEDATE) FROM PETRESCUE;

-- Extract the year from the rescue date for each rescue
SELECT YEAR(RESCUEDATE) FROM PETRESCUE;

-- Add 3 days to the rescue date for each rescue
SELECT DATE_ADD(RESCUEDATE, INTERVAL 3 DAY) FROM PETRESCUE;

-- Add 2 months to the rescue date for each rescue
SELECT DATE_ADD(RESCUEDATE, INTERVAL 2 MONTH) FROM PETRESCUE;

-- Subtract 3 days from the rescue date for each rescue
SELECT DATE_SUB(RESCUEDATE, INTERVAL 3 DAY) FROM PETRESCUE;

-- Calculate the difference in days between the current date and the rescue date
SELECT DATEDIFF(CURRENT_DATE, RESCUEDATE) FROM PETRESCUE;

-- Convert the difference in days between the current date and the rescue date to a date value
SELECT FROM_DAYS(DATEDIFF(CURRENT_DATE, RESCUEDATE)) FROM PETRESCUE;

-- Calculate the average cost of rescues where the animal is a dog (in uppercase)
SELECT AVG(COST) AS AVG_COST FROM PETRESCUE WHERE UCASE(ANIMAL) = 'DOG';

-- Retrieve distinct animal names in uppercase from all rescues
SELECT DISTINCT(UCASE(ANIMAL)) FROM PETRESCUE;

-- Retrieve all information for rescues where the animal is a cat (in lowercase)
SELECT * FROM PETRESCUE WHERE LCASE(ANIMAL) = 'cat';

-- Count the number of rescues that occurred in the month of May
SELECT COUNT(*) FROM PETRESCUE WHERE MONTH(RESCUEDATE) = 5;

-- Retrieve the ID and add 1 year to the rescue date for each rescue
SELECT ID, DATE_ADD(RESCUEDATE, INTERVAL 1 YEAR) FROM PETRESCUE;
