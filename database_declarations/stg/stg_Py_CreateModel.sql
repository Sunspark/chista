CREATE TABLE stg_Py_CreateModel
(
    ModelKeyPhrase varchar(100) NOT NULL
  , ModelName varchar(100) NULL
  , ModelConceptLevel varchar(100) NULL
  , ModelType varchar(100) NULL
  
  , LoadDate datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
  , RecordSource nvarchar(500) NULL
  
  , ModelHashKey char(32) NULL
  , HashDiff char(32) NULL
);