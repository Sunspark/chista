CREATE VIEW out_DataversePhysicalAttributeOutputForDataBricks AS
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
  , NULL AS "DATABASE_NAME"
  , NULL AS SCHEMA_NAME
  , sat."entity_logical_name" AS TABLE_NAME
  , sat."Logical Name" AS COLUMN_NAME

  , 'YES' AS IS_NULLABLE
  , dat.Databricks_Data_Type AS DATA_TYPE

  -- Tags/Desc are carried from the base analysis (so that we don't have to analyse fully again), are expected to be modified.
  , sat."Description" AS COLUMN_DESCRIPTION
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
  INNER JOIN bv_DatabricksDataTypeFromDataverse AS dat ON (
    ps.PhysicalAttributeHashKey = dat.PhysicalAttributeHashKey
    AND dat.LoadDate = (
      SELECT MAX(z.LoadDate)
      FROM bv_DatabricksDataTypeFromDataverse AS z
      WHERE z.PhysicalAttributeHashKey = dat.PhysicalAttributeHashKey
    )
  )
;  