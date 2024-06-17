CREATE VIEW bv_SQLServerPhysicalStructureOutputForAnalysis AS
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
 
  , SERVER_NAME
  , "DATABASE_NAME"
  , SCHEMA_NAME
  , TABLE_NAME
  , ROW_COUNT
  , TABLE_TYPE
  , TABLE_TYPE_DESCRIPTION
  , COLUMN_COUNT
  , TABLE_DESCRIPTION
  , tag."Tags"

FROM
	rv_h_PhysicalStructure ps
	INNER JOIN rv_s_PhysicalStructure_SqlServerScrape AS sat ON (
    ps.PhysicalStructureHashKey = sat.PhysicalStructureHashKey
    AND sat.LoadDate = (
      SELECT MAX(z.LoadDate)
      FROM rv_s_PhysicalStructure_SqlServerScrape AS z
      WHERE z.PhysicalStructureHashKey = sat.PhysicalStructureHashKey
    )
  )
  LEFT OUTER JOIN tag ON (
    ps.PhysicalStructureHashKey = tag.PhysicalStructureHashKey
  )
;