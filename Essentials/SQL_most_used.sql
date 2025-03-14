SHOW DATABASES;
USE 'database_name';
SHOW TABLES;
DESCRIBE 'table_name';
SHOW COLUMNS FROM 'table_name';
CREATE DATABASE 'database_name';
DROP DATABASE 'database_name';

-- Create Table --
CREATE TABLE table_name (
    column1 datatype constraints,
    column2 datatype constraints,
    ...
);
DROP TABLE table_name;


SELECT * FROM Explanations
WHERE Explanation LIKE '%history%' OR Question LIKE '%history%' OR Topic LIKE '%history%';
;
