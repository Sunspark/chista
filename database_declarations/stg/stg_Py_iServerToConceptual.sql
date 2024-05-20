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