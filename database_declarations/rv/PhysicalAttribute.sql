CREATE TABLE rv_h_PhysicalAttribute
(
    PhysicalAttributeHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , PhysicalAttributeKeyPhrase varchar(1000) NOT NULL -- System.server_name.database.schema.table.field
)
;
CREATE UNIQUE INDEX "PK_rv_h_PhysicalAttribute" ON "rv_h_PhysicalAttribute" (PhysicalAttributeHashKey);
CREATE UNIQUE INDEX "UK_rv_h_PhysicalAttribute" ON "rv_h_PhysicalAttribute" (PhysicalAttributeKeyPhrase);

CREATE TABLE rv_s_PhysicalAttribute_SqlServerScrape
(
    PhysicalAttributeHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  , SERVER_NAME varchar(100) NULL
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
)
;
CREATE UNIQUE INDEX "PK_rv_s_PhysicalAttribute_SqlServerScrape" ON "rv_s_PhysicalAttribute_SqlServerScrape" (
  PhysicalAttributeHashKey
  , LoadDate
);

CREATE TABLE rv_s_PhysicalAttribute_XRMMetadata
(
    PhysicalAttributeHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  , "SERVER_NAME" varchar(100) NULL
  , "DATABASE_NAME" varchar(100) NULL
  , "SCHEMA_NAME" varchar(100) NULL
  , "entity_logical_name" varchar(100) NULL
  , "Logical Name" varchar(100) NULL
  , "Schema Name" varchar(100) NULL
  , "Display Name" varchar(100) NULL
  , "Attribute Type" varchar(100) NULL
  , "Description" varchar(1000) NULL
  , "Custom Attribute" bit NULL
  , "Type" varchar(100) NULL
  , "Additional data" varchar(1000) NULL
)
;
CREATE UNIQUE INDEX "PK_rv_s_PhysicalAttribute_XRMMetadata" ON "rv_s_PhysicalAttribute_XRMMetadata" (
  PhysicalAttributeHashKey
  , LoadDate
);

CREATE TABLE rv_s_PhysicalAttribute_AnalysisTag
(
    PhysicalAttributeHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , Tag varchar(100) NULL
  , StartDate datetime NULL
  , EndDate datetime NULL
)
;
CREATE UNIQUE INDEX "PK_rv_s_PhysicalAttribute_AnalysisTag" ON "rv_s_PhysicalAttribute_AnalysisTag" (
  PhysicalAttributeHashKey
  , LoadDate
  , Tag
);

CREATE TABLE rv_s_PhysicalAttribute_SynLinkJSON
(
    PhysicalAttributeHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  , "entity_name" varchar(100) NULL
  , "name" varchar(100) NULL
  , "dataType" varchar(100) NULL
  , "maxLength" int NULL
  , "precision" int NULL
  , "scale" int NULL
  , "SERVER_NAME" varchar(100) NULL
  , "DATABASE_NAME" varchar(100) NULL
  , "SCHEMA_NAME" varchar(100) NULL
)
;
CREATE UNIQUE INDEX "PK_rv_s_PhysicalAttribute_SynLinkJSON" ON "rv_s_PhysicalAttribute_SynLinkJSON" (
  PhysicalAttributeHashKey
  , LoadDate
);

CREATE TABLE rv_s_PhysicalAttribute_Mysql
(
    PhysicalAttributeHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  , "SERVER_NAME" TEXT
  , "DATABASE_NAME" TEXT
  , "SCHEMA_NAME" TEXT
  , "TABLE_NAME" TEXT
  , "COLUMN_NAME" TEXT
  , "ORDINAL_POSITION" INTEGER
  , "COLUMN_DEFAULT" TEXT
  , "IS_NULLABLE" TEXT
  , "DATA_TYPE" TEXT
  , "CHARACTER_MAXIMUM_LENGTH" INTEGER
  , "CHARACTER_OCTET_LENGTH" INTEGER
  , "NUMERIC_PRECISION" INTEGER
  , "NUMERIC_SCALE" INTEGER
  , "CHARACTER_SET_NAME" TEXT
  , "COLLATION_NAME" TEXT
  , "COLUMN_TYPE" TEXT
  , "COLUMN_KEY" TEXT
  , "EXTRA" TEXT
  , "COLUMN_COMMENT" TEXT
)
;
CREATE UNIQUE INDEX "PK_rv_s_PhysicalAttribute_Mysql" ON "rv_s_PhysicalAttribute_Mysql" (
  PhysicalAttributeHashKey
  , LoadDate
);

CREATE TABLE rv_s_PhysicalAttribute_DBMLtxt
(
    PhysicalAttributeHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  , "SERVER_NAME" TEXT
  , "DATABASE_NAME" TEXT
  , "SCHEMA_NAME" TEXT
  , "TABLE_NAME" TEXT
  , "COLUMN_NAME" TEXT
  , "DATA_TYPE" TEXT
)
;
CREATE UNIQUE INDEX "PK_rv_s_PhysicalAttribute_DBMLtxt" ON "rv_s_PhysicalAttribute_DBMLtxt" (
  PhysicalAttributeHashKey
  , LoadDate
);


-- A structure has attributes
CREATE TABLE rv_l_PhysicalStructurePhysicalAttribute
(
    PhysicalStructurePhysicalAttributeHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , PhysicalStructureHashKey varchar(100) NOT NULL
  , PhysicalAttributeHashKey varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_l_PhysicalStructurePhysicalAttribute" ON "rv_l_PhysicalStructurePhysicalAttribute" (PhysicalStructurePhysicalAttributeHashKey);
CREATE UNIQUE INDEX "UK_rv_l_PhysicalStructurePhysicalAttribute" ON "rv_l_PhysicalStructurePhysicalAttribute" (
  PhysicalStructureHashKey
  , PhysicalAttributeHashKey
);

-- A Physical attribute can transform to one or many other Physical Attributes
CREATE TABLE rv_l_PhysicalAttributePhysicalAttribute_transform
(
    PhysicalAttributePhysicalAttribute_transformHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , PhysicalAttribute_sourceHashKey varchar(100) NOT NULL
  , PhysicalAttribute_destinationHashKey varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_l_PhysicalAttributePhysicalAttribute_transform" ON "rv_l_PhysicalAttributePhysicalAttribute_transform" (PhysicalAttributePhysicalAttribute_transformHashKey);
CREATE UNIQUE INDEX "UK_rv_l_PhysicalAttributePhysicalAttribute_transform" ON "rv_l_PhysicalAttributePhysicalAttribute_transform" (
  PhysicalAttribute_sourceHashKey
  , PhysicalAttribute_destinationHashKey
);

CREATE TABLE rv_s_PhysicalAttributePhysicalAttribute_transform
(
    PhysicalAttributePhysicalAttribute_transformHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  , TransformationNotes varchar(1000) NULL
  , EffectiveStart datetime NULL
  , EffectiveEnd datetime NULL
)
;
CREATE UNIQUE INDEX "PK_rv_s_PhysicalAttributePhysicalAttribute_transform" ON "rv_s_PhysicalAttributePhysicalAttribute_transform" (
  PhysicalAttributePhysicalAttribute_transformHashKey
  , LoadDate
);

-- A Physical attribute can have FK links
-- Foreign Keys are in PhysicalForeignKey

-- [TODO] A Physical attribute can have constraints

CREATE TABLE "rv_s_PhysicalAttribute_SqlServerDataAnalysis" (
    PhysicalAttributeHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL

  , SERVER_NAME varchar(100) NULL
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
);
CREATE UNIQUE INDEX "PK_rv_s_PhysicalAttribute_SqlServerDataAnalysis" ON "rv_s_PhysicalAttribute_SqlServerDataAnalysis" (
  PhysicalAttributeHashKey
  , LoadDate
);