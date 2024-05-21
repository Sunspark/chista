-- This query gets column data from the data dictionary of SQL server
-- [TODO] Add the code for getting the description from the extended properties
-- https://www.mssqltips.com/sqlservertip/5384/working-with-sql-server-extended-properties/
-- MS_Description

-- USAGE:
-- Alter the top two elements of the 'SELECT' clause to be your server name and DB
-- Use your DB interface tool of choice to extract results to a CSV

SELECT
    'ServerNameHere' AS [SERVER_NAME]
  , 'YourDBHere' AS [DATABASE_NAME]
  , [TABLE_SCHEMA]
  , [TABLE_NAME]
  , [COLUMN_NAME]
  , [ORDINAL_POSITION]
  , [COLUMN_DEFAULT]
  , [IS_NULLABLE]
  , [DATA_TYPE]
  , [CHARACTER_MAXIMUM_LENGTH]
  , [CHARACTER_OCTET_LENGTH]
  , [NUMERIC_PRECISION]
  , [NUMERIC_PRECISION_RADIX]
  , [NUMERIC_SCALE]
  , [DATETIME_PRECISION]
  , [CHARACTER_SET_CATALOG]
  , [CHARACTER_SET_SCHEMA]
  , [CHARACTER_SET_NAME]
  , [COLLATION_CATALOG]
  , [COLLATION_SCHEMA]
  , [COLLATION_NAME]
  , [DOMAIN_CATALOG]
  , [DOMAIN_SCHEMA]
  , [DOMAIN_NAME]
  , NULL AS [COLUMN_DESCRIPTION]
FROM
  [INFORMATION_SCHEMA].[COLUMNS]
; 