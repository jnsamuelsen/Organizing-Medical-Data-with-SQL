-- Simple SELECT statements using the WHERE clause to filter

-- Select all female patients
SELECT * FROM patientinfo
WHERE sex = 'F';

-- Select all patients that had placebo
SELECT * FROM patientinfo
WHERE drug = 'Placebo';

-- Select all patients that are in stage 3 or above
SELECT * FROM patientinfo
WHERE stage >= 3;

-- Select all entries in the histology table that have edema
SELECT * FROM histology
WHERE edema 'Y';

-- Select all entries in the chemicalcomp table that have a cholesterol value higher than 300 mg/dl
SELECT * FROM chemicalcomp
WHERE cholesterol > 300;

-- Select all entries in the chemicalcomp table that have a bilirubin value between 10 and 25 mg/dl
SELECT * FROM cheimcalcomp
WHERE bilirubin BETWEEN 10 and 25;

-- Select all patients that are not in stage 2
SELECT * FROM patientinfo
WHERE stage <> 2;

-- Select patients with a status that starts with 'C'
SELECT * FROM patientinfo
WHERE status LIKE 'C%';

-- Select patients that are in stage 1 and getting the drug D-penicillamine
SELECT * FROM patientinfo
WHERE stage = 1 AND drug = 'D-penicillamine';

-- Select entries from the histology table that have either ascites or spiders
SELECT * FROM histology
WHERE ascites = 'Y' OR spiders = 'Y';

-- Select patients that are in a stage within the list (2,3,4)
SELECT * FROM patientinfo
WHERE stage IN (2, 3, 4);

-- Select all patients where the drug column value is null
SELECT * FROM patientinfo
WHERE drug IS NULL;

-- The NOT operator can be used together with operators such as LIKE, IN, BETWEEN etc.
-- Select all entries in the chemicalcomp table where the copper value is not between 50 and 150 ug/day
SELECT * FROM chemicalcomp
WHERE copper NOT BETWEEN 50 and 150;

-- Select only distinct values from the status column in the patientinfo table
SELECT DISTINCT status FROM patientinfo;

-- The ORDER BY keyword can be used to sort the result in ascending or descending order
-- Select all patients and sort the result by the age field (ascending)
SELECT * FROM patientinfo
ORDER BY age;

-- To sort in descending order we just add the DESC keyword
SELECT * FROM patientinfo
ORDER BY age DESC;

-- Select the first 20 entries of the patientinfo table
SELECT * FROM patientinfo
LIMIT 20;

-- Select the first 20 entries starting from the 100th entry
SELECT * FROM patientinfo
LIMIT 20 OFFSET 100;

-- Select the minimum (non-zero) and maximum platelets value in the chemicalcomp table
SELECT MIN(platelets)
FROM chemicalcomp
WHERE platelets > 0;

SELECT MAX(platelets)
FROM chemicalcomp;

-- Count the number of patients in the data
SELECT COUNT(id)
FROM patientinfo;

-- Count the number of patient that in stage 4 of the disease
SELECT COUNT(id)
FROM patientinfo
WHERE stage = 4;

-- Sum up the total number of days between all patients
SELECT SUM(n_days)
FROM patientinfo;

-- Return the average age of all patients in the data
SELECT AVG(age)
FROM patientinfo;

-- Return the average age of all patients in stage 4 of the disease
SELECT AVG(age)
FROM patientinfo
WHERE stage = 4;
