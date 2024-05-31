CREATE VIEW bv_DataversePhysicalStructureAttributeCount AS
SELECT
  pa.SERVER_NAME
  , pa."entity_logical_name"
  , COUNT(*) AS AttributeCount
FROM
  rv_s_PhysicalAttribute_XRMMetadata pa
WHERE
  pa.LoadDate = (
    SELECT MAX(z.LoadDate)
    FROM rv_s_PhysicalAttribute_XRMMetadata AS z
    WHERE z.PhysicalAttributeHashKey = pa.PhysicalAttributeHashKey
  )
GROUP BY
  pa.SERVER_NAME
  , pa."entity_logical_name"
;