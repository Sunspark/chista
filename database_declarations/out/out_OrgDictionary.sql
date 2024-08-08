-- Only Businesses that exist in a model are returned
CREATE VIEW out_BusinessForOrgDictionary AS
SELECT
    hm.ModelKeyPhrase
  , hb.BusinessName
  , sat."Description"
 
FROM
  rv_l_ModelBusiness l
  INNER JOIN rv_h_Business hb ON (
    l.BusinessHashKey = hb.BusinessHashKey
  )
  INNER JOIN rv_h_Model hm ON (
    l.ModelHashKey = hm.ModelHashKey
  )
	LEFT JOIN rv_s_Business AS sat ON (
    hb.BusinessHashKey = sat.BusinessHashKey
    AND sat.LoadDate = (
      SELECT MAX(z.LoadDate)
      FROM rv_s_Business AS z
      WHERE z.BusinessHashKey = sat.BusinessHashKey
    )
  )
;

-- Only Business Areas that exist in a model, and have a Business in a model are returned
CREATE VIEW out_BusinessAreaForOrgDictionary AS
SELECT
    hmb.ModelKeyPhrase AS BusinessModelKeyPhrase
  , hb.BusinessName
  , hmba.ModelKeyPhrase AS BusinessAreaModelKeyPhrase
  , sat.BusinessAreaName
  , sat.DisplayName
  , sat."Description"
  , sat.isDeleted
  , sat.BusinessContact

FROM
  rv_l_ModelBusinessArea lmba
  INNER JOIN rv_h_Model hmba ON (
    lmba.ModelHashKey = hmba.ModelHashKey
  )
  INNER JOIN rv_h_BusinessArea hba ON (
    lmba.BusinessAreaHashKey = hba.BusinessAreaHashKey
  )
	INNER JOIN rv_s_BusinessArea AS sat ON (
    hba.BusinessAreaHashKey = sat.BusinessAreaHashKey
    AND sat.LoadDate = (
      SELECT MAX(z.LoadDate)
      FROM rv_s_BusinessArea AS z
      WHERE z.BusinessAreaHashKey = sat.BusinessAreaHashKey
    )
  )
  INNER JOIN rv_l_BusinessBusinessArea lbba ON (
    lbba.BusinessAreaHashKey = hba.BusinessAreaHashKey
  )
  INNER JOIN rv_h_Business hb ON (
    lbba.BusinessHashKey = hb.BusinessHashKey
  )
  INNER JOIN rv_l_ModelBusiness lmb ON (
    lmb.BusinessHashKey = hb.BusinessHashKey
  )
  INNER JOIN rv_h_Model hmb ON (
    lmb.ModelHashKey = hmb.ModelHashKey
  )
;
  
-- Systems
CREATE VIEW out_SystemForOrgDictionary AS
SELECT
    SystemKeyPhrase
  , SystemName
  , isDeleted
	, "Description"
FROM
  bv_System
;

-- Only Entities in a model are retrieved
CREATE VIEW out_ConceptualEntityForOrgDictionary AS
SELECT
    sat."isDeleted"
  , hm.ModelKeyPhrase
  , sat."EntityName"
  , sat."DisplayName"
  , sat."Description"
  , sat."Synonyms"
  , sat."DataOwner"
  , sat."DataSteward"
 
FROM
  rv_l_ModelConceptualEntity l
  INNER JOIN rv_h_ConceptualEntity hce ON (
    l.ConceptualEntityHashKey = hce.ConceptualEntityHashKey
  )
  INNER JOIN rv_h_Model hm ON (
    l.ModelHashKey = hm.ModelHashKey
  )
	LEFT JOIN rv_s_ConceptualEntity_Chista AS sat ON (
    hce.ConceptualEntityHashKey = sat.ConceptualEntityHashKey
    AND sat.LoadDate = (
      SELECT MAX(z.LoadDate)
      FROM rv_s_ConceptualEntity_Chista AS z
      WHERE z.ConceptualEntityHashKey = sat.ConceptualEntityHashKey
    )
  )
;

-- Only Entities in a model are retrieved
CREATE VIEW out_ConceptualEntityRelationForOrgDictionary AS
SELECT
    hm.ModelKeyPhrase
  , sce.EntityName AS ConceptualEntity
  , lcer.ForwardRelationPhrase
  , scecer.ReverseRelationPhrase
  , scer.EntityName AS ConceptualEntity_Related
  , scecer.isDeleted
  , scecer."Description"

FROM
  rv_l_ModelConceptualEntity l
  INNER JOIN rv_h_ConceptualEntity hce ON (
    l.ConceptualEntityHashKey = hce.ConceptualEntityHashKey
  )
  INNER JOIN rv_h_Model hm ON (
    l.ModelHashKey = hm.ModelHashKey
  )
  INNER JOIN rv_l_ConceptualEntityConceptualEntity_Related lcer ON (
    lcer.ConceptualEntityHashKey = hce.ConceptualEntityHashKey
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
;

-- Business Area Entity Relations (which entities are in which business areas)
-- Only Things that exist in a model are returned
CREATE VIEW out_BusinessAreaConceptualEntityRelationForOrgDictionary AS
SELECT
    hb.BusinessName
  , hmba.ModelKeyPhrase AS BusinessAreaModelKeyPhrase
  , sba.BusinessAreaName
  , hmce.ModelKeyPhrase AS EntityModelKeyPhrase
  , sce.EntityName
  , sbace.isDeleted

FROM
  rv_l_BusinessAreaConceptualEntity lbace
  -- Go to personal Sat
	LEFT JOIN rv_s_BusinessAreaConceptualEntity AS sbace ON (
    lbace.BusinessAreaConceptualEntityHashKey = sbace.BusinessAreaConceptualEntityHashKey
    AND sbace.LoadDate = (
      SELECT MAX(z.LoadDate)
      FROM rv_s_BusinessAreaConceptualEntity AS z
      WHERE z.BusinessAreaConceptualEntityHashKey = sbace.BusinessAreaConceptualEntityHashKey
    )
  )
  -- Go to Conceptual Entity
  INNER JOIN rv_h_ConceptualEntity hce ON (
    lbace.ConceptualEntityHashKey = hce.ConceptualEntityHashKey
  )
  INNER JOIN rv_l_ModelConceptualEntity lce ON (
    lce.ConceptualEntityHashKey = hce.ConceptualEntityHashKey
  )
  INNER JOIN rv_h_Model hmce ON (
    lce.ModelHashKey = hmce.ModelHashKey
  )
	LEFT JOIN rv_s_ConceptualEntity_Chista AS sce ON (
    hce.ConceptualEntityHashKey = sce.ConceptualEntityHashKey
    AND sce.LoadDate = (
      SELECT MAX(z.LoadDate)
      FROM rv_s_ConceptualEntity_Chista AS z
      WHERE z.ConceptualEntityHashKey = sce.ConceptualEntityHashKey
    )
  )
  -- Go to Business Area
  INNER JOIN rv_h_BusinessArea hba ON (
    lbace.BusinessAreaHashKey = hba.BusinessAreaHashKey
  )
  INNER JOIN rv_l_ModelBusinessArea lmba ON (
    lmba.BusinessAreaHashKey = hba.BusinessAreaHashKey
  )
  INNER JOIN rv_h_Model hmba ON (
    lmba.ModelHashKey = hmba.ModelHashKey
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
;