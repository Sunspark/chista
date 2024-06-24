CREATE TABLE "stg_Py_SqlServerDataAnalysisToPhysicalAttribute" (
    SERVER_NAME varchar(100) NULL
  , "DATABASE_NAME" varchar(100) NULL
  , SCHEMA_NAME varchar(100) NULL
  , TABLE_NAME varchar(100) NULL
  , COLUMN_NAME varchar(100) NULL

  , "SCAN_DATE" char(8) NULL
  , "NULL_COUNT" int NULL
  , "NOT_NULL_COUNT" int NULL
  , "NULL_PERCENT" numeric(5,2) NULL
  , "NOT_NULL_PERCENT" numeric(5,2) NULL
  , "BLANK_COUNT" int NULL
  , "NOT_BLANK_COUNT" int NULL
  , "BLANK_PERCENT" numeric(5,2) NULL
  , "NOT_BLANK_PERCENT" numeric(5,2) NULL
  , "NULL_OR_BLANK_COUNT" int NULL
  , "NOT_NULL_OR_BLANK_COUNT" int NULL
  , "NULL_OR_BLANK_PERCENT" numeric(5,2) NULL
  , "NOT_NULL_OR_BLANK_PERCENT" numeric(5,2) NULL
  , "COUNT_DISTINCT" int NULL
  , "MIN_OF_NUMBER" real NULL
  , "MAX_OF_NUMBER" real NULL
  , "MIN_OF_DATE" varchar(30) NULL
  , "MAX_OF_DATE" varchar(30) NULL
  
  , RecordSource nvarchar(500) NOT NULL
  , LoadDate datetime NOT NULL
  , PhysicalAttributeKeyPhrase varchar(1000) NULL
  , PhysicalAttributeHashKey char(32) NOT NULL
  , HashDiff char(32) NOT NULL  
);