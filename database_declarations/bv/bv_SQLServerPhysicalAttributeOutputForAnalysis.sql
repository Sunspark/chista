CREATE VIEW bv_SQLServerPhysicalAttributeOutputForAnalysis AS
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
 
  , sat.SERVER_NAME
  , sat."DATABASE_NAME"
  , sat.SCHEMA_NAME
  , sat.TABLE_NAME
  , sat.COLUMN_NAME

  , sat.ORDINAL_POSITION
  , sat.COLUMN_DEFAULT
  , sat.IS_NULLABLE
  , sat.DATA_TYPE
  , sat.CHARACTER_MAXIMUM_LENGTH
  , sat.CHARACTER_OCTET_LENGTH
  , sat.NUMERIC_PRECISION
  , sat.NUMERIC_PRECISION_RADIX
  , sat.NUMERIC_SCALE
  , sat.DATETIME_PRECISION
  , sat.CHARACTER_SET_CATALOG
  , sat.CHARACTER_SET_SCHEMA
  , sat.CHARACTER_SET_NAME
  , sat.COLLATION_CATALOG
  , sat.COLLATION_SCHEMA
  , sat.COLLATION_NAME
  , sat.DOMAIN_CATALOG
  , sat.DOMAIN_SCHEMA
  , sat.DOMAIN_NAME
  , sat.COLUMN_DESCRIPTION

  , tag."Tags"
 
FROM
	rv_h_PhysicalAttribute ps
	INNER JOIN rv_s_PhysicalAttribute_SqlServerScrape AS sat ON (
    ps.PhysicalAttributeHashKey = sat.PhysicalAttributeHashKey
    AND sat.LoadDate = (
      SELECT MAX(z.LoadDate)
      FROM rv_s_PhysicalAttribute_SqlServerScrape AS z
      WHERE z.PhysicalAttributeHashKey = sat.PhysicalAttributeHashKey
    )
  )
  LEFT OUTER JOIN tag ON (
    ps.PhysicalAttributeHashKey = tag.PhysicalAttributeHashKey
  )
;