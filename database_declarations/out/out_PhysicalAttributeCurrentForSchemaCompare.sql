CREATE VIEW out_PhysicalAttributeCurrentForSchemaCompare AS

SELECT
    SERVER_NAME
  , "DATABASE_NAME"
  , SCHEMA_NAME
  , TABLE_NAME
  , COLUMN_NAME

  , IS_NULLABLE
  , DATA_TYPE
  , CHARACTER_MAXIMUM_LENGTH
  , NUMERIC_PRECISION
  , NUMERIC_SCALE
FROM
	out_SQLServerPhysicalAttributeOutputForAnalysis

UNION
	
SELECT
    "SERVER_NAME"
  , "DATABASE_NAME"
  , "SCHEMA_NAME"
  , "entity_logical_name" AS TABLE_NAME
  , "Logical Name" AS COLUMN_NAME
	
	, NULL AS IS_NULLABLE
  , "Attribute Type" AS DATA_TYPE
	, NULL AS CHARACTER_MAXIMUM_LENGTH
	, NULL AS NUMERIC_PRECISION
	, NULL AS NUMERIC_SCALE
FROM
	out_DataversePhysicalAttributeOutputForAnalysis
;