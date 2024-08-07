CREATE TABLE stg_Py_CSVToBusiness
(
    ModelKeyPhrase varchar(100) NOT NULL
  , BusinessName varchar(100) NULL
  , "Description" varchar(1000) NULL
  
  , ModelBusinessKeyPhrase varchar(201) NOT NULL
  
  , LoadDate datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
  , RecordSource nvarchar(500) NULL
  
  , ModelHashKey char(32) NULL
  , BusinessHashKey char(32) NULL
  , ModelBusinessHashKey char(32) NULL
  , HashDiff char(32) NULL
);
