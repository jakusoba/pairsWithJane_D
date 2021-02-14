-- Write queries to return the following:
-- Make the following changes in the "world" database.

-- 1. Add Superman's hometown, Smallville, Kansas to the city table. The 
-- countrycode is 'USA', and population of 45001. (Yes, I looked it up on 
-- Wikipedia.)
INSERT INTO city (name, countrycode, district, population)
VALUES ('Smallville','USA','Kansas',45001);


-- 2. Add Kryptonese to the countrylanguage table. Kryptonese is spoken by 0.0001
-- percentage of the 'USA' population.
INSERT INTO countrylanguage (countrycode, language, isofficial, percentage)
VALUES ('USA','Kryptonese','false',0.0001);

-- 3. After heated debate, "Kryptonese" was renamed to "Krypto-babble", change 
-- the appropriate record accordingly.
UPDATE countrylanguage 
SET language = 'Krypto-babble'
WHERE language = 'Kryptonese';

-- 4. Set the US captial to Smallville, Kansas in the country table.
UPDATE country
SET capital = (SELECT id FROM city WHERE name = 'Smallville')
WHERE code = 'USA';

-- 5. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)
--Did not succeed due to Smallville being the capital of USA
-- Also, violates the foreign key constraint

-- 6. Return the US captial to Washington.
UPDATE country
SET capital = (SELECT id FROM city WHERE name = 'Washington')
WHERE code = 'USA';

-- 7. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)
-- Did not succeed because the query violates the foreign key constraint


-- 8. Reverse the "is the official language" setting for all languages where the
-- country's year of independence is within the range of 1800 and 1972 
-- (exclusive). 
-- (590 rows affected)
UPDATE countrylanguage SET isofficial = not isofficial
WHERE countrycode IN (SELECT code FROM country WHERE indepyear BETWEEN 1800 AND 1972);


-- 9. Convert population so it is expressed in 1,000s for all cities. (Round to
-- the nearest integer value greater than 0.)
-- (4079 rows affected)

UPDATE city
SET population = (population * .001);
WHERE 

-- 10. Assuming a country's surfacearea is expressed in square miles, convert it to 
-- square meters for all countries where French is spoken by more than 20% of the 
-- population.
-- (7 rows affected)
UPDATE country
SET surfacearea = (surfacearea * 2589988)
WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language = 'French' AND percentage >= 20);

