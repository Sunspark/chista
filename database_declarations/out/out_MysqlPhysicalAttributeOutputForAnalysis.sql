CREATE VIEW out_MysqlPhysicalAttributeOutputForAnalysis AS
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
  , sat.NUMERIC_SCALE
  , sat.CHARACTER_SET_NAME
  , sat.COLLATION_NAME
  , sat.COLUMN_TYPE
  , sat.COLUMN_KEY
  , sat.EXTRA

  , sat.COLUMN_COMMENT

  , tag."Tags"
 
FROM
  rv_h_PhysicalAttribute ps
  INNER JOIN rv_s_PhysicalAttribute_Mysql AS sat ON (
    ps.PhysicalAttributeHashKey = sat.PhysicalAttributeHashKey
    AND sat.LoadDate = (
      SELECT MAX(z.LoadDate)
      FROM rv_s_PhysicalAttribute_Mysql AS z
      WHERE z.PhysicalAttributeHashKey = sat.PhysicalAttributeHashKey
    )
  )
  LEFT OUTER JOIN tag ON (
    ps.PhysicalAttributeHashKey = tag.PhysicalAttributeHashKey
  )

;