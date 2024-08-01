CREATE VIEW out_PhysicalStructureCurrentForSchemaCompare AS

SELECT
    SERVER_NAME
  , "DATABASE_NAME"
  , SCHEMA_NAME
  , TABLE_NAME
  , COLUMN_COUNT
FROM
	out_SQLServerPhysicalStructureOutputForAnalysis

UNION
	
SELECT
    "SERVER_NAME"
  , "DATABASE_NAME"
  , "SCHEMA_NAME"
  , "Logical Name" AS TABLE_NAME
  , "CountAttributes" AS COLUMN_COUNT
FROM
	out_DataversePhysicalStructureOutputForAnalysis
;