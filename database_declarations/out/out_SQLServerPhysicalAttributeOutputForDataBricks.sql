CREATE VIEW out_SQLServerPhysicalAttributeOutputForDataBricks AS
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
 
  -- this block will need to be overwritten in post-processing, but gives the basis for re-writing/ filtering.
    sat.SERVER_NAME
  , sat."DATABASE_NAME"
  , sat.SCHEMA_NAME
  , sat.TABLE_NAME
  , sat.COLUMN_NAME

  , 'YES' AS IS_NULLABLE
  , dat.Databricks_Data_Type AS DATA_TYPE

  -- Tags/Desc are carried from the base analysis (so that we don't have to analyse fully again), are expected to be modified.
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
  INNER JOIN bv_DatabricksDataTypeFromSQLServer AS dat ON (
    ps.PhysicalAttributeHashKey = dat.PhysicalAttributeHashKey
    AND dat.LoadDate = (
      SELECT MAX(z.LoadDate)
      FROM bv_DatabricksDataTypeFromSQLServer AS z
      WHERE z.PhysicalAttributeHashKey = dat.PhysicalAttributeHashKey
    )
  )
;