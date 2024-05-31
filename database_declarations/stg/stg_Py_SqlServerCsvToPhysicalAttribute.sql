CREATE TABLE "stg_Py_SqlServerCsvToPhysicalAttribute" (
    SERVER_NAME varchar(100) NULL
  , "DATABASE_NAME" varchar(100) NULL
  , SCHEMA_NAME varchar(100) NULL
  , TABLE_NAME varchar(100) NULL
  , COLUMN_NAME varchar(100) NULL

  , ORDINAL_POSITION INT NULL
  , COLUMN_DEFAULT varchar(100) NULL
  , IS_NULLABLE bit NULL
  , DATA_TYPE varchar(20) NULL
  , CHARACTER_MAXIMUM_LENGTH INT NULL
  , CHARACTER_OCTET_LENGTH INT NULL
  , NUMERIC_PRECISION INT NULL
  , NUMERIC_PRECISION_RADIX INT NULL
  , NUMERIC_SCALE INT NULL
  , DATETIME_PRECISION INT NULL
  , CHARACTER_SET_CATALOG varchar(100) NULL
  , CHARACTER_SET_SCHEMA varchar(100) NULL
  , CHARACTER_SET_NAME varchar(100) NULL
  , COLLATION_CATALOG varchar(100) NULL
  , COLLATION_SCHEMA varchar(100) NULL
  , COLLATION_NAME varchar(100) NULL
  , DOMAIN_CATALOG varchar(100) NULL
  , DOMAIN_SCHEMA varchar(100) NULL
  , DOMAIN_NAME varchar(100) NULL
  , COLUMN_DESCRIPTION varchar(1000) NULL

  , RecordSource nvarchar(500) NOT NULL
  , LoadDate datetime NOT NULL
  , SystemKeyPhrase varchar(100) NULL
  , PhysicalStructureKeyPhrase varchar(1000) NULL
  , PhysicalAttributeKeyPhrase varchar(1000) NULL
  , PhysicalStructurePhysicalAttributeKeyPhrase varchar(2000) NULL
  , PhysicalStructureHashKey char(32) NULL
  , PhysicalAttributeHashKey char(32) NOT NULL
  , PhysicalStructurePhysicalAttributeHashKey char(32) NULL
  , HashDiff char(32) NOT NULL
)