-- Retrieve 3 distinct movie titles released in 2015, skipping the first 5 results
SELECT DISTINCT Title FROM FilmLocations WHERE ReleaseYear = 2015 LIMIT 3 OFFSET 5;

-- Retrieve up to 10 distinct movie titles released in 2015
SELECT DISTINCT Title FROM FilmLocations WHERE ReleaseYear = 2015 LIMIT 10;

-- Retrieve 50 distinct movie titles without any specific condition
SELECT DISTINCT Title FROM FilmLocations LIMIT 50;

-- Count the number of distinct distributors for films where Clint Eastwood is the primary actor
SELECT Count(DISTINCT Distributor) FROM FilmLocations WHERE Actor1 = 'Clint Eastwood';

-- Retrieve distinct movie titles and directors, excluding those filmed at 'City Hall'
SELECT DISTINCT Title, Director FROM FilmLocations WHERE Locations <> 'City Hall';

-- Retrieve distinct movie titles and their release years for films released after the year 2000
SELECT DISTINCT Title, ReleaseYear FROM FilmLocations WHERE ReleaseYear > 2000;

-- Count the total number of films released before 1950
SELECT Count(*) FROM FilmLocations WHERE ReleaseYear < 1950;

-- Count the number of films filmed at "Russian Hill"
SELECT Count(Title) FROM FilmLocations WHERE Locations = "Russian Hill";

-- Count the total number of filming locations for films directed by Woody Allen
SELECT COUNT(Locations) FROM FilmLocations WHERE Director = "Woody Allen";
