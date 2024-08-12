CREATE VIEW out_ConceptualEntityRelationsForYed AS

SELECT
    hm.ModelKeyPhrase
  , ROW_NUMBER() OVER (
    PARTITION BY lcer.ConceptualEntityConceptualEntity_RelatedHashKey
    ORDER BY
        hb.BusinessName
      , sba.BusinessAreaName
  ) AS CER_ROW_NUMBER
  , hb.BusinessName
  , sba.BusinessAreaName
  , hce.ConceptualEntityHashKey
  , sce.EntityName AS ConceptualEntity
  , sce.DisplayName AS CE_DisplayName
  , lcer.ForwardRelationPhrase
  , hcer.ConceptualEntityHashKey AS ConceptualEntity_RelatedHashKey
  , scer.EntityName AS ConceptualEntity_Related
  , scer.DisplayName AS CER_DisplayName
FROM
  rv_l_ConceptualEntityConceptualEntity_Related lcer
  INNER JOIN rv_h_ConceptualEntity hce ON (
    lcer.ConceptualEntityHashKey = hce.ConceptualEntityHashKey
  )
  INNER JOIN rv_l_ModelConceptualEntity lmce ON (
    lmce.ConceptualEntityHashKey = hce.ConceptualEntityHashKey
  )
  INNER JOIN rv_h_Model hm ON (
    lmce.ModelHashKey = hm.ModelHashKey
  )
  INNER JOIN rv_h_ConceptualEntity hcer ON (
    lcer.ConceptualEntity_RelatedHashKey = hcer.ConceptualEntityHashKey
  )
  LEFT JOIN rv_s_ConceptualEntity_Chista AS sce ON (
    hce.ConceptualEntityHashKey = sce.ConceptualEntityHashKey
    AND sce.LoadDate = (
      SELECT MAX(z.LoadDate)
      FROM rv_s_ConceptualEntity_Chista AS z
      WHERE z.ConceptualEntityHashKey = sce.ConceptualEntityHashKey
    )
  )
  LEFT JOIN rv_s_ConceptualEntity_Chista AS scer ON (
    hcer.ConceptualEntityHashKey = scer.ConceptualEntityHashKey
    AND scer.LoadDate = (
      SELECT MAX(z.LoadDate)
      FROM rv_s_ConceptualEntity_Chista AS z
      WHERE z.ConceptualEntityHashKey = scer.ConceptualEntityHashKey
    )
  )
  LEFT JOIN rv_s_ConceptualEntityConceptualEntity_Related AS scecer ON (
    lcer.ConceptualEntityConceptualEntity_RelatedHashKey = scecer.ConceptualEntityConceptualEntity_RelatedHashKey
    AND scecer.LoadDate = (
      SELECT MAX(z.LoadDate)
      FROM rv_s_ConceptualEntityConceptualEntity_Related AS z
      WHERE z.ConceptualEntityConceptualEntity_RelatedHashKey = scecer.ConceptualEntityConceptualEntity_RelatedHashKey
    )
  )
  -- Go to Business Area
  INNER JOIN rv_l_BusinessAreaConceptualEntity lbace ON (
    lbace.ConceptualEntityHashKey = hce.ConceptualEntityHashKey
  )
  INNER JOIN rv_h_BusinessArea hba ON (
    lbace.BusinessAreaHashKey = hba.BusinessAreaHashKey
  )
  LEFT JOIN rv_s_BusinessArea AS sba ON (
    hba.BusinessAreaHashKey = sba.BusinessAreaHashKey
    AND sba.LoadDate = (
      SELECT MAX(z.LoadDate)
      FROM rv_s_BusinessArea AS z
      WHERE z.BusinessAreaHashKey = sba.BusinessAreaHashKey
    )
  )
  -- Go to Business
  INNER JOIN rv_l_BusinessBusinessArea lbba ON (
    lbba.BusinessAreaHashKey = hba.BusinessAreaHashKey
  )
  INNER JOIN rv_h_Business hb ON (
    lbba.BusinessHashKey = hb.BusinessHashKey
  )
WHERE
  scecer.isDeleted = 0
;