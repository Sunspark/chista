CREATE TABLE stg_Py_CreateSystem
(
    SystemKeyPhrase varchar(100) NOT NULL
  , SystemName varchar(100) NULL
  , "Description" varchar(1000) NULL
  
  , LoadDate datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
  , RecordSource nvarchar(500) NULL
  
  , SystemHashKey char(32) NULL
  , HashDiff char(32) NULL
);