-- THESE ARE PUBLIC STORAGE ACCOUNTS

SELECT * 
FROM OPENROWSET(
    BULK 'https://datasource87983.blob.core.windows.net/csv/emp.csv',
    FORMAT = 'CSV',
    PARSER_VERSION = '2.0',
    HEADER_ROW = TRUE) AS test


    -------------------------------------------------

SELECT * 
FROM OPENROWSET(
    BULK 'https://datasource87983.blob.core.windows.net/csv/emp.csv',
    FORMAT = 'CSV',
    PARSER_VERSION = '2.0',
    HEADER_ROW = TRUE)
WITH 
  -- SPECIFY WHICH SPECIFIC COLUMNS YOU NEED 
  -- COLUMN NAME SHOULD BE EXACTLY SAME AS IN FILE (CASE SENSITIVE)
  -- ELSE WILL CREATE A COULMN WITH VALUES AS NULL
  -- FOR SPACES IN COLUMN YOU CAN ALSO USE "TETX TEXT" VS [TEXT TEXT]
([Employee ID] INT,
[First Name] NVARCHAR(100)) AS test

===========================

SELECT *  
FROM OPENROWSET(
    BULK 'https://datasource87983.blob.core.windows.net/csv/QueryResult.csv',
    FORMAT = 'CSV',
    PARSER_VERSION = '2.0',
    HEADER_ROW = TRUE) AS test

-- File 'https://csg10032002cb36da87.blob.core.windows.net/test/emp.csv' cannot be opened because it does not exist or it is used by another process.
-- means synapse can't reach your file ... 
   
