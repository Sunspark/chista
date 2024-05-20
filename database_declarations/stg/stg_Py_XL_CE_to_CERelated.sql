CREATE TABLE stg_Py_XL_CE_to_CERelated
(
    ConceptualEntityKeyPhrase varchar(500) NOT NULL
  , ConceptualEntity_RelatedKeyPhrase varchar(500) NOT NULL

  , ConceptualEntityConceptualEntity_RelatedKeyPhrase varchar(601) NOT NULL

  , LoadDate datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
  , RecordSource nvarchar(500) NULL

  , label_forward nvarchar(500) NULL
  , isDeleted boolean NOT NULL DEFAULT 0
  , DeletedDate datetime NULL
  
  , ConceptualEntityConceptualEntity_RelatedHashKey char(32) NULL
  , ConceptualEntityHashKey char(32) NULL
  , ConceptualEntity_RelatedHashKey char(32) NULL
  , HashDiff char(32) NULL
);