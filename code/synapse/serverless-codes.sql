create DATABASE srvlessdb

create table sample (
    ID INT,
    name varchar(55)
)

-- you can't create tables
create TABLE Persons (
    ID int,
    FirstName varchar(255)
)

-- Serverless SQL 
-- openrowset 
-- external table
-- CETAS

/*
============================ OPENROWSET =====================================
******** It behaves Like Table **********
- it do not saves any results in your sql pool
- Creates a temp view of data 
- Best for Ad Hoc Queries 
- To get Data from ADLS,Blob etc 
*/

select * 
from 
OPENROWSET(
    -- source
    BULK 'https://synapseadlsfilestore97.blob.core.windows.net/filesystem/csv/2019.csv',
    format = 'CSV',
    -- necassary if it can't auto detect schema
    PARSER_VERSION = '2.0',
    HEADER_ROW = TRUE
)   
as data_2019
-- if you do not provide nickname raises error = A correlation name must be specified for the bulk rowset in the from clause.

/*

1. make chnage in CSV file in ADLS
2. RUn Openrowset Query one moretime
3. See the lastest results 
Hence, Openrowset great feature to verify chnages in dataset :) 

*/

select * from sys.tables

select count(CustomerName) as Total_customers
FROM
OPENROWSET(
    -- source
    BULK 'https://synapseadlsfilestore97.blob.core.windows.net/filesystem/csv/2019.csv',
    format = 'CSV',
    -- necassary if it can't auto detect schema
    PARSER_VERSION = '2.0',
    HEADER_ROW = TRUE
) as data_2019

-- Total Customers in 2019 was 1201 


select count(CustomerName) as Total_customers
from 
OPENROWSET(
    -- source
    BULK 'https://synapseadlsfilestore97.blob.core.windows.net/filesystem/csv/2020.csv',
    format = 'CSV',
    -- necassary if it can't auto detect schema
    PARSER_VERSION = '2.0',
    HEADER_ROW = TRUE
) as data_2020

-- Resukt from above = 2733


-- ============================ WITHOUT USING ANY JOINS or COMPLICATED QUery you combine Data =================

select count(CustomerName) as Total_customers
from 
OPENROWSET(
    -- source
    BULK 'https://synapseadlsfilestore97.blob.core.windows.net/filesystem/csv/*.csv',
    format = 'CSV',
    -- necassary if it can't auto detect schema
    PARSER_VERSION = '2.0',
    HEADER_ROW = TRUE
) as all_files

-- NOw we get combined reslts from 2019 and 2022 data = 3934

-- OPENROWSET Behaves like tables 

/*
******************************************
*    WITH CALUSE WITH OPENROWSET         *
*  USe it to overide the Inferred Schema *
******************************************
*/
select *
from 
OPENROWSET(
    -- source
    BULK 'https://synapseadlsfilestore97.blob.core.windows.net/filesystem/csv/*.csv',
    format = 'CSV',
    -- necassary if it can't auto detect schema
    PARSER_VERSION = '2.0',
    HEADER_ROW = TRUE
)
With (
    --cloumn datatype
    SalesOrderNumber VARCHAR(255),
    SalesOrderLineNumber VARCHAR(255),
    OrderDate date,
    CustomerName VARCHAR(255),
    emailaddress VARCHAR(500),
    item VARCHAR(500),
    Quantity int,
    UnitPrice float,
    TaxAmount float
)
 as all_files
where UnitPrice = 3578.27


/*
  Create a External Table
**************************************************************  
An external table points to data located in Hadoop, Azure Storage blob, 
or Azure Data Lake Storage. You can use external tables to read data
 from files or write data to files in Azure Storage.
***************************************************************
*/

-- STEPS TO CREATE AN EXTERNAL TABLE
-- 1. External Data source (from where to pick data) ===> Authenticating info
-- 2. External File format (related settings)
-- 3. create table (schema => column, data type)

CREATE EXTERNAL DATA SOURCE myBlobStorage
WITH (
    LOCATION = 'https://synapseadlsfilestore97.blob.core.windows.net/filesystem'
);

-- Step 2: Create External File Format
CREATE EXTERNAL FILE FORMAT CsvFileFormat
WITH (
    FORMAT_TYPE = DELIMITEDTEXT,
    FORMAT_OPTIONS (
        FIELD_TERMINATOR = ',',
        STRING_DELIMITER = '"',
        FIRST_ROW = 2
    )
);

CREATE EXTERNAL TABLE [data_2019_at6] (
    SalesOrderNumber VARCHAR(255),
    SalesOrderLineNumber VARCHAR(255),
    OrderDate date,
    CustomerName VARCHAR(255),
    emailaddress VARCHAR(500),
    item VARCHAR(500),
    Quantity int,
    UnitPrice float,
    TaxAmount float
)
WITH (
    LOCATION = 'csv/2020.csv',
    DATA_SOURCE = myBlobStorage,
    FILE_FORMAT = CsvFileFormat
);

select * from sys.tables

select * from [data_2019_at6]


-- https://synapseadlsfilestore97.blob.core.windows.net/filesystem = Location
-- create external table = '/csv/*.csv'
