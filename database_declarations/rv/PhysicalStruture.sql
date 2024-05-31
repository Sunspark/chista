
CREATE TABLE rv_h_PhysicalStructure
(
    PhysicalStructureHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , PhysicalStructureKeyPhrase varchar(1000) NOT NULL -- System.server_name.database.schema.table
)
;
CREATE UNIQUE INDEX "PK_rv_h_PhysicalStructure" ON "rv_h_PhysicalStructure" (PhysicalStructureHashKey);
CREATE UNIQUE INDEX "UK_rv_h_PhysicalStructure" ON "rv_h_PhysicalStructure" (PhysicalStructureKeyPhrase);

CREATE TABLE rv_s_PhysicalStructure_IntellifloOffice_Client
(
    PhysicalStructureHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  , PhysicalStructureName varchar(100) NULL
  , isDeleted boolean NULL DEFAULT 0
  , PhysicalStructureType varchar(100) NULL
)
;
CREATE UNIQUE INDEX "PK_rv_s_PhysicalStructure_IntellifloOffice_Client" ON "rv_s_PhysicalStructure_IntellifloOffice_Client" (
  PhysicalStructureHashKey
  , LoadDate
);

CREATE TABLE rv_s_PhysicalStructure_SqlServerScrape
(
    PhysicalStructureHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  , SERVER_NAME varchar(100) NULL
  , "DATABASE_NAME" varchar(100) NULL
  , SCHEMA_NAME varchar(100) NULL
  , TABLE_NAME varchar(100) NULL
  , ROW_COUNT int NULL
  , TABLE_TYPE varchar(100) NULL
  , TABLE_TYPE_DESCRIPTION varchar(100) NULL
  , COLUMN_COUNT int NULL
  , TABLE_DESCRIPTION varchar(1000) NULL
)
;
CREATE UNIQUE INDEX "PK_rv_s_PhysicalStructure_SqlServerScrape" ON "rv_s_PhysicalStructure_SqlServerScrape" (
  PhysicalStructureHashKey
  , LoadDate
);

CREATE TABLE rv_s_PhysicalStructure_XRMMetadata
(
    PhysicalStructureHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  , "Entity" varchar(100) NULL
  , "Plural Display Name" varchar(100) NULL
  , "Description" varchar(1000) NULL
  , "Schema Name" varchar(100) NULL
  , "Logical Name" varchar(100) NULL
  , "Object Type Code" int NULL
  , "Is Custom Entity" bit NULL
  , "Ownership Type" varchar(100) NULL
  , "SERVER_NAME" varchar(100) NULL
)
;
CREATE UNIQUE INDEX "PK_rv_s_PhysicalStructure_XRMMetadata" ON "rv_s_PhysicalStructure_XRMMetadata" (
  PhysicalStructureHashKey
  , LoadDate
);

CREATE TABLE rv_s_PhysicalStructure_AnalysisTag
(
    PhysicalStructureHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , Tag varchar(100) NULL
  , StartDate datetime NULL
  , EndDate datetime NULL
)
;
CREATE UNIQUE INDEX "PK_rv_s_PhysicalStructure_AnalysisTag" ON "rv_s_PhysicalStructure_AnalysisTag" (
  PhysicalStructureHashKey
  , LoadDate
  , Tag
);

CREATE TABLE rv_l_ModelPhysicalStructure
(
    ModelPhysicalStructureHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , ModelHashKey varchar(100) NOT NULL
  , PhysicalStructureHashKey varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_l_ModelPhysicalStructure" ON "rv_l_ModelPhysicalStructure" (ModelPhysicalStructureHashKey);
CREATE UNIQUE INDEX "UK_rv_l_ModelPhysicalStructure" ON "rv_l_ModelPhysicalStructure" (
  ModelHashKey
  , PhysicalStructureHashKey
);