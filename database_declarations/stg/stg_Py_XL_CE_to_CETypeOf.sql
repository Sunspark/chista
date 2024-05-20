CREATE TABLE stg_Py_XL_CE_to_CETypeOf
(
    ConceptualEntityKeyPhrase varchar(500) NOT NULL
  , ConceptualEntity_TypeOfKeyPhrase varchar(500) NOT NULL

  , ConceptualEntityConceptualEntity_TypeOfKeyPhrase varchar(601) NOT NULL

  , LoadDate datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
  , RecordSource nvarchar(500) NULL
  
  , ConceptualEntityConceptualEntity_TypeOfHashKey char(32) NULL
  , ConceptualEntityHashKey char(32) NULL
  , ConceptualEntity_TypeOfHashKey char(32) NULL
);