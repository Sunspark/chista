CREATE TABLE stg_Py_iServerToConceptual
(
    ModelKeyPhrase varchar(100) NOT NULL
  , ConceptualEntityKeyPhrase varchar(500) NOT NULL
  , BusinessAreaKeyPhrase varchar(500) NULL

  , "Name" varchar(500) NOT NULL
  , "isDeleted" boolean NULL
  , "Description" varchar(1000) NULL
  , "Definition" varchar(1000) NULL
  , "SubType" varchar(100) NULL
  , "Data Subject Area" varchar(100) NULL
  , "Business Owner" varchar(100) NULL
  , "Data Steward" varchar(100) NULL
  , "Personally Identifiable Information" boolean NULL
  , "Categories" varchar(1000) NULL
  , "Model" varchar(100) NULL
  , "Date Last Modified" datetime NULL
  , "Category (General)" varchar(100) NULL
  , "Last Modified By" varchar(100) NULL
  , "Data Criticality" varchar(100) NULL
  , "Information Security Classification" varchar(100) NULL
  , "Type" varchar(100) NULL
  , "Owner" varchar(100) NULL
  , "Privacy Classification" varchar(100) NULL
  , "Source" varchar(100) NULL
  , "Storage" varchar(100) NULL
  , "Filter Set" varchar(100) NULL
  
  , ModelConceptualEntityKeyPhrase varchar(601) NOT NULL
  , BusinessAreaConceptualEntityKeyPhrase varchar(601) NULL

  , LoadDate datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
  , RecordSource nvarchar(500) NULL
  
  , ModelHashKey char(32) NULL
  , ConceptualEntityHashKey char(32) NULL
  , ModelConceptualEntityHashKey char(32) NULL
  , BusinessAreaHashKey varchar(100) NULL
  , BusinessAreaConceptualEntityHashKey char(32) NULL
  , HashDiff char(32) NULL
);

CREATE TABLE rv_h_ConceptualEntity
(
    ConceptualEntityHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , ConceptualEntityKeyPhrase varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_h_ConceptualEntity" ON "rv_h_ConceptualEntity" (ConceptualEntityHashKey);
CREATE UNIQUE INDEX "UK_rv_h_ConceptualEntity" ON "rv_h_ConceptualEntity" (ConceptualEntityKeyPhrase);

CREATE TABLE rv_s_ConceptualEntity_iServer
(
    ConceptualEntityHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  , "Name" varchar(500) NOT NULL
  , "isDeleted" boolean NOT NULL DEFAULT 0
  , "Description" varchar(1000) NULL
  , "Definition" varchar(1000) NULL
  , "SubType" varchar(100) NULL
  , "Data Subject Area" varchar(100) NULL
  , "Business Owner" varchar(100) NULL
  , "Data Steward" varchar(100) NULL
  , "Personally Identifiable Information" boolean NULL
  , "Categories" varchar(1000) NULL
  , "Model" varchar(100) NULL
  , "Date Last Modified" datetime NULL
  , "Category (General)" varchar(100) NULL
  , "Last Modified By" varchar(100) NULL
  , "Data Criticality" varchar(100) NULL
  , "Information Security Classification" varchar(100) NULL
  , "Type" varchar(100) NULL
  , "Owner" varchar(100) NULL
  , "Privacy Classification" varchar(100) NULL
  , "Source" varchar(100) NULL
  , "Storage" varchar(100) NULL
  , "Filter Set" varchar(100) NULL
)
;
CREATE UNIQUE INDEX "PK_rv_s_ConceptualEntity_iServer" ON "rv_s_ConceptualEntity_iServer" (
  ConceptualEntityHashKey
  , LoadDate
);

CREATE TABLE rv_l_ModelConceptualEntity
(
    ModelConceptualEntityHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , ModelHashKey varchar(100) NOT NULL
  , ConceptualEntityHashKey varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_l_ModelConceptualEntity" ON "rv_l_ModelConceptualEntity" (ModelConceptualEntityHashKey);
CREATE UNIQUE INDEX "UK_rv_l_ModelConceptualEntity" ON "rv_l_ModelConceptualEntity" (
  ModelHashKey
  , ConceptualEntityHashKey
);

CREATE VIEW bv_ConceptualEntity AS
SELECT
    h.ConceptualEntityKeyPhrase
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

CREATE TABLE rv_l_BusinessAreaConceptualEntity
(
    BusinessAreaConceptualEntityHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , BusinessAreaHashKey varchar(100) NOT NULL
  , ConceptualEntityHashKey varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_l_BusinessAreaConceptualEntity" ON "rv_l_BusinessAreaConceptualEntity" (BusinessAreaConceptualEntityHashKey);
CREATE UNIQUE INDEX "UK_rv_l_BusinessAreaConceptualEntity" ON "rv_l_BusinessAreaConceptualEntity" (
  BusinessAreaHashKey
  , ConceptualEntityHashKey
);

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

CREATE TABLE rv_l_ConceptualEntityConceptualEntity_TypeOf
(
    ConceptualEntityConceptualEntity_TypeOfHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , ConceptualEntityHashKey varchar(100) NOT NULL
  , ConceptualEntity_TypeOfHashKey varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_l_ConceptualEntityConceptualEntity_TypeOf" ON "rv_l_ConceptualEntityConceptualEntity_TypeOf" (ConceptualEntityConceptualEntity_TypeOfHashKey);
CREATE UNIQUE INDEX "UK_rv_l_ConceptualEntityConceptualEntity_TypeOf" ON "rv_l_ConceptualEntityConceptualEntity_TypeOf" (
  ConceptualEntityHashKey
  , ConceptualEntity_TypeOfHashKey
);

