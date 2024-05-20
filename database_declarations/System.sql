-- The conceptual System, not the server name (which should be in the Physical Structure)
CREATE TABLE rv_h_System
(
    SystemHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , SystemKeyPhrase varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_h_System" ON "rv_h_System" (SystemHashKey);
CREATE UNIQUE INDEX "UK_rv_h_System" ON "rv_h_System" (SystemKeyPhrase);

CREATE TABLE rv_s_System
(
    SystemHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  , SystemName varchar(100) NULL
  , isDeleted boolean NULL DEFAULT 0
  , "Description" varchar(1000) NULL
)
;
CREATE UNIQUE INDEX "PK_rv_s_System" ON "rv_s_System" (
  SystemHashKey
  , LoadDate
);

-- Systems have dbs have tables
CREATE TABLE rv_l_SystemPhysicalStructure
(
    SystemPhysicalStructureHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , SystemHashKey varchar(100) NOT NULL
  , PhysicalStructureHashKey varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_l_SystemPhysicalStructure" ON "rv_l_SystemPhysicalStructure" (SystemPhysicalStructureHashKey);
CREATE UNIQUE INDEX "UK_rv_l_SystemPhysicalStructure" ON "rv_l_SystemPhysicalStructure" (
  SystemHashKey
  , PhysicalStructureHashKey
);
