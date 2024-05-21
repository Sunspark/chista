-- This query gets table data from the data dictionary of SQL server
-- [TODO] Add the code for getting the description from the extended properties
-- https://www.mssqltips.com/sqlservertip/5384/working-with-sql-server-extended-properties/
-- MS_Description

-- USAGE:
-- Alter the top two elements of the 'SELECT' clause to be your server name and DB
-- Use your DB interface tool of choice to extract results to a CSV

SELECT
    'ServerNameHere' AS [SERVER_NAME]
  , 'YourDBHere' AS [DATABASE_NAME]
  , S.name AS [SCHEMA_NAME]
  , T.name AS [TABLE_NAME]
  , I.rows AS [ROW_COUNT]
  , T.type AS [TABLE_TYPE]
  , T.type_desc AS [TABLE_TYPE_DESCRIPTION] -- this shows table or view
  , T.max_column_id_used AS [COLUMN_COUNT] -- This isn't exactly column count, but it's an exact proxy.
  -- doesn't have descriptions .. yet
FROM
  sys.tables AS T
  INNER JOIN sys.schemas AS S ON (
    T.schema_id = S.schema_id
  )
  INNER JOIN sys.sysindexes AS I ON (
    T.object_id = I.id 
    AND I.indid < 2
  )
; 