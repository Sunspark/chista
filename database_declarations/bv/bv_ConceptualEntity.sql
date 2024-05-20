CREATE VIEW bv_ConceptualEntity AS
SELECT
    h.ConceptualEntityKeyPhrase
  , h.ConceptualEntityHashKey
  , s.Name AS ConceptualEntityName
  , s.Description
  , s.Definition
  , s."Data Subject Area" AS BusinessAreaName
FROM
  rv_h_ConceptualEntity AS h
  LEFT JOIN rv_s_ConceptualEntity_iServer AS s ON (
    h.ConceptualEntityHashKey = s.ConceptualEntityHashKey
    AND s.LoadDate = (
      SELECT MAX(z.LoadDate)
      FROM rv_s_ConceptualEntity_iServer AS z
      WHERE z.ConceptualEntityHashKey = s.ConceptualEntityHashKey
    )
  )
WHERE
  s.isDeleted = 0
;