-- Set up the tables: PatientInfo, Histology, ChemicalComp
CREATE TABLE PatientInfo (ID INT PRIMARY KEY, Age INT, Sex CHAR(1), Status TEXT, N_Days INT, Stage INT);

CREATE TABLE Histology (ID INT, Ascites CHAR(1), Hepatomegaly CHAR(1), Spiders CHAR(1), Edema CHAR(1));

CREATE TABLE ChemicalComp (ID INT, Bilirubin FLOAT, Cholesterol INT, Albumin FLOAT, Copper INT, Alk_Phos FLOAT, SGOT FLOAT, Triglycerides INT, Platelets INT, Prothrombin FLOAT);

-- Load the processed csv files into the empty DB tables
COPY patientinfo FROM '/tmp/cirrhosis_PatientInfo.csv' DELIMITER ',' CSV HEADER;

COPY histology FROM '/tmp/cirrhosis_Histology.csv' DELIMITER ',' CSV HEADER;

COPY chemicalcomp FROM '/tmp/cirrhosis_ChemicalComp.csv' DELIMITER ',' CSV HEADER;

-- In the DBMS (here postgres/psql is used), we add the new unique identifier columns (HistologyID and ChemicalCompID) to Histology and ChemicalComp as SERIAL datatypes
-- Then make the new columns into primary keys
ALTER TABLE histology ADD HistologyID SERIAL;
ALTER TABLE histology ADD PRIMARY KEY (histologyid);

ALTER TABLE chemicalcomp ADD ChemicalCompID SERIAL;
ALTER TABLE chemicalcomp ADD PRIMARY KEY (chemicalcompid);
