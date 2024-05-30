CREATE TABLE "stg_Py_SqlServerCsvToPhysicalStructure" (
    SERVER_NAME varchar(100) NULL
  , "DATABASE_NAME" varchar(100) NULL
  , SCHEMA_NAME varchar(100) NULL
  , TABLE_NAME varchar(100) NULL
  , ROW_COUNT int NULL
  , TABLE_TYPE varchar(100) NULL
  , TABLE_TYPE_DESCRIPTION varchar(100) NULL
  , COLUMN_COUNT int NULL
  , TABLE_DESCRIPTION varchar(1000) NULL

  , RecordSource  nvarchar(500) NULL
  , LoadDate datetime NOT NULL

  , ModelKeyPhrase varchar(1000) NULL
  , SystemKeyPhrase varchar(1000) NULL
  , PhysicalStructureKeyPhrase varchar(1000) NULL
  , ModelPhysicalStructureKeyPhrase varchar(1000) NULL
  , SystemPhysicalStructureKeyPhrase varchar(1000) NULL

  , ModelHashKey char(32) NULL
  , SystemHashKey char(32) NULL
  , PhysicalStructureHashKey char(32) NULL
  , ModelPhysicalStructureHashKey char(32) NULL
  , SystemPhysicalStructureHashKey char(32) NULL
  , HashDiff char(32) NULL
);