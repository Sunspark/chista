CREATE VIEW out_PhysicalAttributeCurrentForSchemaCompare AS

-- Structures from SQL Server
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

-- Structures from Dataverse via XRM Toolbox
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

UNION

-- Structures from Dataverse via Synapse Link JSON
SELECT
    "SERVER_NAME"
  , "DATABASE_NAME"
  , "SCHEMA_NAME"
  , "entity_name" AS TABLE_NAME
  , "name" AS COLUMN_NAME

  , NULL AS IS_NULLABLE
  , "dataType" AS DATA_TYPE
  , "maxLength" AS CHARACTER_MAXIMUM_LENGTH
  , "precision" AS NUMERIC_PRECISION
  , "scale" AS NUMERIC_SCALE
 
FROM
	rv_h_PhysicalAttribute ps
	INNER JOIN rv_s_PhysicalAttribute_SynLinkJSON AS sat ON (
    ps.PhysicalAttributeHashKey = sat.PhysicalAttributeHashKey
    AND sat.LoadDate = (
      SELECT MAX(z.LoadDate)
      FROM rv_s_PhysicalAttribute_SynLinkJSON AS z
      WHERE z.PhysicalAttributeHashKey = sat.PhysicalAttributeHashKey
    )
  )
;