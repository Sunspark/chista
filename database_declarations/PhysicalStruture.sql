CREATE TABLE rv_h_PhysicalStructure
(
    PhysicalStructureHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , PhysicalStructureKeyPhrase varchar(100) NOT NULL
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