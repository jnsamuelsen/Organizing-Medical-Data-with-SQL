-- A JOIN clause is used to combine rows from two or more tables, based on a related column between the tables

-- The INNER JOIN returns records that have matching values in both tables
-- Inner join the histologyid, drug, and spiders column from the patientinfo and histology tables
SELECT histologyid, drug, spiders
FROM histology
INNER JOIN patientinfo ON histology.id = patientinfo.id;

-- The LEFT JOIN returns all records from the left table, and only the matching records from the right table
-- Left join the histologyid, drug, and spiders column from the patientinfo and histology tables
SELECT histologyid, drug, spiders
FROM histology
LEFT JOIN patientinfo ON histology.id = patientinfo.id;

-- The RIGHT JOIN returns all records from the right table, and only the matching records from the left table
-- Right join the histologyid, drug, and spiders column from the patientinfo and histology tables
SELECT histologyid, drug, spiders
FROM histology
RIGHT JOIN patientinfo ON histology.id = patientinfo.id;

-- The FULL JOIN returns all records from both tables, no matter if there is any matches between them
-- Full join the histologyid, drug, and spiders column from the patientinfo and histology tables
SELECT histologyid, drug, spiders
FROM histology
FULL JOIN patientinfo ON histology.id = patientinfo.id;

-- The CROSS JOIN returns all records from the right table for each record in the left table
-- This method can give very large table outputs! If we have 418 entries in patientinfo, and 418 entries in histology, the cross join will output a table of 418*418 = 174724 entries
-- Cross join the histologyid, drug, and spiders column from the patientinfo and histology tables
SELECT histologyid, drug, spiders
FROM histology
CROSS JOIN patientinfo;

-- The UNION operator is used to combine the result-set of two or more queries
SELECT id
FROM patientinfo
UNION
SELECT chemicalcompid
FROM chemicalcomp
ORDER BY id;

-- The GROUP BY clause groups rows that have the same values into summary rows (very useful for statistics and characterics exploration)
-- Count the number of patients that are in each stage of the disease
SELECT COUNT(id), stage
FROM patientinfo
GROUP BY stage;

-- Return the average age for each stage of the disease 
SELECT AVG(age), stage
FROM patientinfo
GROUP BY stage;

-- GROUP BY can also be used with a JOIN
-- Return the maximum cholesterol value (chemicalcomp table) for each of the three different status groups (patientinfo table)
SELECT patientinfo.status, MAX(chemicalcomp.cholesterol)
FROM chemicalcomp
LEFT JOIN patientinfo ON chemicalcomp.id = patientinfo.id
GROUP BY status;

-- The HAVING clause is used instead of the WHERE clause when making queries which includes aggregate functions
-- Return the stages that are represented more than 100 times in the patientinfo table
SELECT COUNT(id), stage
FROM patientinfo
GROUP BY stage
HAVING COUNT(id) > 100;

-- The CASE expression works like an if-else statement. It returns a value when the first condition is met
-- Return specific values if the drug column meets a specific condition
SELECT drug,
CASE
WHEN drug = 'Placebo' THEN 'Fake Drug'
WHEN drug = 'D-penicillamine' THEN 'Real Drug'
ELSE
'No Drug'
END AS "Drug Legitimacy"
FROM patientinfo;
