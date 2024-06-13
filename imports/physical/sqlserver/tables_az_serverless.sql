-- This query gets table data from the data dictionary of SQL server (Azure Synapse Serverless)
-- This is different from the plain SQL server code as there are different system views available.
-- Notably, the ROW_COUNT field stays null.
-- [TODO] Add the code for getting the description from the extended properties
-- https://www.mssqltips.com/sqlservertip/5384/working-with-sql-server-extended-properties/
-- MS_Description

-- USAGE:
-- Alter the top two variables to be your server name and DB, as well as the USE statement if desired.
-- Use your DB interface tool of choice to extract results to a CSV



USE your_database_here; -- this can't be a variable :(

DECLARE @target_database VARCHAR(255) = 'your_database_here';
DECLARE @target_servername VARCHAR(255) = 'your_server_here';

WITH
tables AS (
  SELECT
      @target_servername AS [SERVER_NAME]
    , @target_database AS [DATABASE_NAME]
    , S.name AS [SCHEMA_NAME]
    , T.name AS [TABLE_NAME]
    , NULL AS [ROW_COUNT]
    , CASE
      WHEN (T.type = 'U' AND T.is_external = 1) THEN 'EX'
      ELSE T.type
    END AS [TABLE_TYPE]
    , CASE
      WHEN (T.type_desc = 'USER_TABLE' AND T.is_external = 1) THEN 'EXTERNAL_TABLE'
      ELSE T.type_desc
    END AS [TABLE_TYPE_DESCRIPTION]
    , (
      SELECT
        COUNT(*)
      FROM
        [INFORMATION_SCHEMA].[COLUMNS] C
      WHERE
        C.TABLE_CATALOG = @target_database
        AND C.TABLE_SCHEMA = S.name
        AND C.TABLE_NAME = T.name
    ) AS [COLUMN_COUNT]
    -- doesn't have descriptions .. yet
    , NULL AS [TABLE_DESCRIPTION]
  FROM
    sys.tables AS T
    INNER JOIN sys.schemas AS S ON (
      T.schema_id = S.schema_id
    )
)
, views AS (
  SELECT
      @target_servername AS [SERVER_NAME]
    , @target_database AS [DATABASE_NAME]
    , S.name AS [SCHEMA_NAME]
    , T.name AS [TABLE_NAME]
    , NULL AS [ROW_COUNT]
    , T.type AS [TABLE_TYPE]
    , T.type_desc AS [TABLE_TYPE_DESCRIPTION]
    , (
      SELECT
        COUNT(*)
      FROM
        [INFORMATION_SCHEMA].[COLUMNS] C
      WHERE
        C.TABLE_CATALOG = @target_database
        AND C.TABLE_SCHEMA = S.name
        AND C.TABLE_NAME = T.name
    ) AS [COLUMN_COUNT]
    -- doesn't have descriptions .. yet
    , NULL AS [TABLE_DESCRIPTION]
  FROM
    sys.views AS T
    INNER JOIN sys.schemas AS S ON (
      T.schema_id = S.schema_id
    )
)
SELECT * FROM tables
UNION
SELECT * FROM views
; 