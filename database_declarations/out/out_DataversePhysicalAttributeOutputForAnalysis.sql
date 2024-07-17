CREATE VIEW out_DataversePhysicalAttributeOutputForAnalysis AS
WITH
  tag AS (
    SELECT 
      tag.PhysicalAttributeHashKey
      , GROUP_CONCAT(tag.Tag, ";") AS Tags -- This is STRING_AGG in T-SQL
    FROM
      rv_s_PhysicalAttribute_AnalysisTag tag
    WHERE
      tag.LoadDate = (
        SELECT MAX(z.LoadDate)
        FROM rv_s_PhysicalAttribute_AnalysisTag AS z
        WHERE z.PhysicalAttributeHashKey = tag.PhysicalAttributeHashKey
      )
      AND tag.EndDate IS NULL
    GROUP BY
      tag.PhysicalAttributeHashKey
	)
SELECT
  ps.PhysicalAttributeHashKey
	, ps.PhysicalAttributeKeyPhrase
 
  , sat."SERVER_NAME"
  , sat."entity_logical_name"
  , sat."Logical Name"
  , sat."Schema Name"
  , sat."Display Name"
  , sat."Attribute Type"
  , sat."Custom Attribute"
  , sat."Type"
  , sat."Additional data"

	, sat."Description"
  , tag."Tags"
 
FROM
	rv_h_PhysicalAttribute ps
	INNER JOIN rv_s_PhysicalAttribute_XRMMetadata AS sat ON (
    ps.PhysicalAttributeHashKey = sat.PhysicalAttributeHashKey
    AND sat.LoadDate = (
      SELECT MAX(z.LoadDate)
      FROM rv_s_PhysicalAttribute_XRMMetadata AS z
      WHERE z.PhysicalAttributeHashKey = sat.PhysicalAttributeHashKey
    )
  )
  LEFT OUTER JOIN tag ON (
    ps.PhysicalAttributeHashKey = tag.PhysicalAttributeHashKey
  )