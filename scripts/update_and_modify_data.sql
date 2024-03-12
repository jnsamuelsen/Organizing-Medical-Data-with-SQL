-- Update the values of the spiders column in the histology table
UPDATE histology
SET spiders = 'N'
WHERE histologyid > 312;

-- Update the status column for the patient with id = 10 in the patientinfo table
UPDATE patientinfo
SET status = 'C'
WHERE id = 10; 

-- Change the datatype of the spiders column in the histology table to VARCHAR(1)
ALTER TABLE histology
ALTER COLUMN spiders TYPE VARCHAR(1);

