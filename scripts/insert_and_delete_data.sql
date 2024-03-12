-- Inserting a new record into the histology table
-- Since the primary key is the SERIAL datatype we don't need to specify that one
INSERT INTO histology (id, ascites, hepatomegaly, spiders, edema)
VALUES (50, 'Y', 'N', 'N', 'N');

-- Inserting multiple new records into the histology table
INSERT INTO histology (id, ascites, hepatomegaly, spiders, edema)
VALUES (95, 'Y', 'N', 'N', 'N'), (128, 'N', 'Y', 'N', 'Y');

----------------------------------------------------------------------------

-- We can delete the inserted entries again with the DELETE statement
DELETE FROM histology
WHERE histologyid > 418;
