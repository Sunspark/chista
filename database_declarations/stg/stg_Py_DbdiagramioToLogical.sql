CREATE TABLE stg_Py_DbdiagramioToLogical
(
    ModelKeyPhrase varchar(100) NOT NULL
  , LogicalEntityKeyPhrase varchar(100) NOT NULL
  , LogicalEntityName varchar(100) NULL
  , isDeleted boolean NULL
  
  , ModelLogicalEntityKeyPhrase varchar(201) NOT NULL
  
  , LoadDate datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
  , RecordSource nvarchar(500) NULL
  
  , ModelHashKey char(32) NULL
  , LogicalEntityHashKey char(32) NULL
  , ModelLogicalEntityHashKey char(32) NULL
  , HashDiff char(32) NULL
);