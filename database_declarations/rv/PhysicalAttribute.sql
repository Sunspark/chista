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

CREATE TABLE rv_s_PhysicalAttribute_dataverse
(
    PhysicalAttributeHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  ,
  SERVER_NAME TEXT,
  "Logical Name" TEXT,
  "Schema Name" TEXT,
  "Display Name" TEXT,
  "Attribute Type" TEXT,
  Description TEXT,
  "Custom Attribute" INT,
  Type TEXT,
  "Additional data" TEXT,
  entity_schema_name TEXT
)
;
CREATE UNIQUE INDEX "PK_rv_s_PhysicalAttribute_dataverse" ON "rv_s_PhysicalAttribute_dataverse" (
  PhysicalAttributeHashKey
  , LoadDate
);

CREATE TABLE rv_s_PhysicalAttribute_AnalysisTag
(
    PhysicalAttributeHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  , Tag varchar(100) NULL
  , StartDate datetime NULL
  , EndDate datetime NULL
)
;
CREATE UNIQUE INDEX "PK_rv_s_PhysicalAttribute_AnalysisTag" ON "rv_s_PhysicalAttribute_AnalysisTag" (
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
CREATE TABLE rv_l_PhysicalAttributePhysicalAttribute_fk
(
    PhysicalAttributePhysicalAttribute_fkHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , PhysicalAttribute_codeHashKey varchar(100) NOT NULL
  , PhysicalAttribute_valueHashKey varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_l_PhysicalAttributePhysicalAttribute_fk" ON "rv_l_PhysicalAttributePhysicalAttribute_fk" (PhysicalAttributePhysicalAttribute_fkHashKey);
CREATE UNIQUE INDEX "UK_rv_l_PhysicalAttributePhysicalAttribute_fk" ON "rv_l_PhysicalAttributePhysicalAttribute_fk" (
  PhysicalAttribute_codeHashKey
  , PhysicalAttribute_valueHashKey
);

CREATE TABLE rv_s_PhysicalAttributePhysicalAttribute_fk
(
    PhysicalAttributePhysicalAttribute_fkHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  , Enforcement varchar(11) NULL -- one of ENFORCED, NOTENFORCED, LOGICAL
  , EffectiveStart datetime NULL
  , EffectiveEnd datetime NULL
)
;
CREATE UNIQUE INDEX "PK_rv_s_PhysicalAttributePhysicalAttribute_fk" ON "rv_s_PhysicalAttributePhysicalAttribute_fk" (
  PhysicalAttributePhysicalAttribute_fkHashKey
  , LoadDate
);

-- [TODO] A Physical attribute can have constraints
