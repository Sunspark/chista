CREATE TABLE stg_Py_ExcelToBusinessArea
(
    ModelKeyPhrase varchar(100) NOT NULL
  , BusinessName varchar(100) NOT NULL
  , BusinessAreaKeyPhrase varchar(100) NOT NULL -- model+businessArea
  , BusinessAreaName varchar(100) NULL
  , Description varchar(1000) NULL
  , isDeleted boolean NULL
  
  , ModelBusinessAreaKeyPhrase varchar(201) NOT NULL
  , BusinessBusinessAreaKeyPhrase varchar(201) NOT NULL
  
  , LoadDate datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
  , RecordSource nvarchar(500) NULL
  
  , ModelHashKey char(32) NULL
  , BusinessAreaHashKey char(32) NULL --BusinessAreaKeyPhrase
  , ModelBusinessAreaHashKey char(32) NULL
  , BusinessHashKey char(32) NULL
  , BusinessBusinessAreaHashKey char(32) NULL
  , HashDiff char(32) NULL
);
