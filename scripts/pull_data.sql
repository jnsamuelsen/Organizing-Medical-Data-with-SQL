-- Combining the COPY statement with JOINs we can output any dataset we want out of the database (here the output file is in csv format)

-- Making a dataset containing just the patientinfo table
COPY patientinfo TO '/home/jnsam/cirrhosis_task/output_datasets/patientinfo.csv' DELIMITER ',' CSV HEADER;

-- Making a dataset containing age from the patientinfo table, edema from the histology table, and platelets from the chemicalcomp table
COPY (
SELECT patientinfo.id, patientinfo.age, histology.edema, chemicalcomp.platelets
FROM patientinfo
INNER JOIN histology ON patientinfo.id = histology.id
INNER JOIN chemicalcomp ON patientinfo.id = chemicalcomp.id
) TO '/home/jnsam/cirrhosis_task/output_datasets/age_edema_platelets.csv' DELIMITER ',' CSV HEADER;

-- Making a dataset containing the full patientinfo table, hepatomegaly from the histology table, and copper from the chemicalcomp table
COPY (
SELECT patientinfo.*, histology.hepatomegaly, chemicalcomp.copper
FROM patientinfo
LEFT JOIN histology ON patientinfo.id = histology.id
LEFT JOIN chemicalcomp ON patientinfo.id = chemicalcomp.id
) TO '/home/jnsam/cirrhosis_task/output_datasets/patientinfo_hepatomegaly_copper.csv' DELIMITER ',' CSV HEADER;
