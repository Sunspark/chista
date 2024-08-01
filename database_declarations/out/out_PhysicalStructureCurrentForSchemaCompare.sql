CREATE VIEW out_PhysicalStructureCurrentForSchemaCompare AS

-- Structures from SQL Server
SELECT
    SERVER_NAME
  , "DATABASE_NAME"
  , SCHEMA_NAME
  , TABLE_NAME
  , COLUMN_COUNT
FROM
	out_SQLServerPhysicalStructureOutputForAnalysis

UNION

-- Structures from Dataverse via XRM Toolbox
SELECT
    "SERVER_NAME"
  , "DATABASE_NAME"
  , "SCHEMA_NAME"
  , "Logical Name" AS TABLE_NAME
  , "CountAttributes" AS COLUMN_COUNT
FROM
	out_DataversePhysicalStructureOutputForAnalysis

UNION

-- Structures from Dataverse via Synapse Link JSON
SELECT
    "SERVER_NAME"
  , "DATABASE_NAME"
  , "SCHEMA_NAME"
  , "name" AS TABLE_NAME
  , NULL AS COLUMN_COUNT

FROM
	rv_h_PhysicalStructure ps
	INNER JOIN rv_s_PhysicalStructure_SynLinkJSON AS sat ON (
    ps.PhysicalStructureHashKey = sat.PhysicalStructureHashKey
    AND sat.LoadDate = (
      SELECT MAX(z.LoadDate)
      FROM rv_s_PhysicalStructure_SynLinkJSON AS z
      WHERE z.PhysicalStructureHashKey = sat.PhysicalStructureHashKey
    )
  )
;