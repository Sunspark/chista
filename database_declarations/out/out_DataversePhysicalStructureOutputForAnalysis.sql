CREATE VIEW out_DataversePhysicalStructureOutputForAnalysis AS
WITH
  tag AS (
    SELECT 
      tag.PhysicalStructureHashKey
      , GROUP_CONCAT(tag.Tag, ";") AS Tags -- This is STRING_AGG in T-SQL
    FROM
      rv_s_PhysicalStructure_AnalysisTag tag
    WHERE
      tag.LoadDate = (
        SELECT MAX(z.LoadDate)
        FROM rv_s_PhysicalStructure_AnalysisTag AS z
        WHERE z.PhysicalStructureHashKey = tag.PhysicalStructureHashKey
      )
      AND tag.EndDate IS NULL
    GROUP BY
      tag.PhysicalStructureHashKey
	)
SELECT
  ps.PhysicalStructureHashKey
	, ps.PhysicalStructureKeyPhrase
 
  , sat."SERVER_NAME"
  , sat."DATABASE_NAME"
  , sat."SCHEMA_NAME"
  , sat."Logical Name"
  , sat."Schema Name"
  , sat."Entity"
  , sat."Plural Display Name"
  , sat."Object Type Code"
  , sat."Is Custom Entity"
  , sat."Ownership Type"

  , eu."CountAttributes"
  , eu."CountCustomAttributes"
  , eu."CountRows"
  , CASE
		WHEN eu."ErrorMessage" IS NOT NULL
		THEN 1
		ELSE 0
	END AS "isRowCountError"

	, sat."Description"
  , tag."Tags"

FROM
	rv_h_PhysicalStructure ps
	INNER JOIN rv_s_PhysicalStructure_XRMMetadata AS sat ON (
    ps.PhysicalStructureHashKey = sat.PhysicalStructureHashKey
    AND sat.LoadDate = (
      SELECT MAX(z.LoadDate)
      FROM rv_s_PhysicalStructure_XRMMetadata AS z
      WHERE z.PhysicalStructureHashKey = sat.PhysicalStructureHashKey
    )
  )
  LEFT OUTER JOIN rv_s_PhysicalStructure_XRMEntityUsage AS eu ON (
    ps.PhysicalStructureHashKey = eu.PhysicalStructureHashKey
    AND eu.LoadDate = (
      SELECT MAX(z.LoadDate)
      FROM rv_s_PhysicalStructure_XRMEntityUsage AS z
      WHERE z.PhysicalStructureHashKey = eu.PhysicalStructureHashKey
    )
  )
  LEFT OUTER JOIN tag ON (
    ps.PhysicalStructureHashKey = tag.PhysicalStructureHashKey
  )  