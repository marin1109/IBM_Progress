-- Insert a new instructor with the information of Sandip Saha
INSERT INTO Instructor (ins_id, lastname, firstname, city, country) 
VALUES(4, 'Saha', 'Sandip', 'Edmonton', 'CA');

-- Insert two new instructors with the information of John Doe and Jane Doe
INSERT INTO Instructor (ins_id, lastname, firstname, city, country) 
VALUES (5, 'John', 'Doe', 'Sydney', 'AU'), 
       (6, 'Jane', 'Doe', 'Dhaka', 'BD');

-- Insert a new instructor with the information of Antonio Cangiano
INSERT INTO Instructor (ins_id, lastname, firstname, city, country) 
VALUES (7, 'Antonio', 'Cangiano', 'Vancouver', 'CA');

-- Insert two new instructors with the information of Steve Ryan and Ramesh Sannareddy
INSERT INTO Instructor (ins_id, lastname, firstname, city, country) 
VALUES (8, 'Steve', 'Ryan', 'Barlby', 'GB'), 
       (9, 'Ramesh', 'Sannareddy', 'Hyderabad', 'IN');

-- Update the city of the instructor with ID 1 to 'Markham'
UPDATE Instructor 
SET city = 'Markham' 
WHERE ins_id = 1;

-- Update the city and country of the instructor with ID 4
UPDATE Instructor 
SET city = 'Dhaka', country = 'BD' 
WHERE ins_id = 4;

-- Delete the instructor where the first name is 'Hima'
DELETE FROM Instructor 
WHERE firstname = 'Hima';

-- Select all the data from the Instructor table
SELECT * FROM Instructor;
