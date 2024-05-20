CREATE TABLE rv_h_LogicalAttribute
(
    LogicalAttributeHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , LogicalAttributeKeyPhrase varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_h_LogicalAttribute" ON "rv_h_LogicalAttribute" (LogicalAttributeHashKey);
CREATE UNIQUE INDEX "UK_rv_h_LogicalAttribute" ON "rv_h_LogicalAttribute" (LogicalAttributeKeyPhrase);

CREATE TABLE rv_s_LogicalAttribute
(
    LogicalAttributeHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  , LogicalAttributeName varchar(100) NULL
  , isDeleted boolean NULL DEFAULT 0
  , "Description" varchar(1000) NULL
  , "Type" varchar(100) NULL
  , "Length" varchar(100) NULL
  , "Precision" varchar(100) NULL
  , "ReferenceDataset" varchar(100) NULL -- for naming the thing that ENUM types should look at, this should probably expand
)
;
CREATE UNIQUE INDEX "PK_rv_s_LogicalAttribute" ON "rv_s_LogicalAttribute" (
  LogicalAttributeHashKey
  , LoadDate
);

-- An entity has attributes
CREATE TABLE rv_l_LogicalEntityLogicalAttribute
(
    LogicalEntityLogicalAttributeHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , LogicalEntityHashKey varchar(100) NOT NULL
  , LogicalAttributeHashKey varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_l_LogicalEntityLogicalAttribute" ON "rv_l_LogicalEntityLogicalAttribute" (LogicalEntityLogicalAttributeHashKey);
CREATE UNIQUE INDEX "UK_rv_l_LogicalEntityLogicalAttribute" ON "rv_l_LogicalEntityLogicalAttribute" (
  LogicalEntityHashKey
  , LogicalAttributeHashKey
);

-- A logical attribute is held in a physical field
CREATE TABLE rv_l_LogicalAttributePhysicalAttribute
(
    LogicalAttributePhysicalAttributeHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , LogicalAttributeHashKey varchar(100) NOT NULL
  , PhysicalAttributeHashKey varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_l_LogicalAttributePhysicalAttribute" ON "rv_l_LogicalAttributePhysicalAttribute" (LogicalAttributePhysicalAttributeHashKey);
CREATE UNIQUE INDEX "UK_rv_l_LogicalAttributePhysicalAttribute" ON "rv_l_LogicalAttributePhysicalAttribute" (
  LogicalAttributeHashKey
  , PhysicalAttributeHashKey
);

CREATE TABLE rv_s_LogicalAttributePhysicalAttribute
(
    LogicalAttributePhysicalAttributeHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  , RelationNotes varchar(1000) NULL
  , EffectiveStart datetime NULL
  , EffectiveEnd datetime NULL
)
;
CREATE UNIQUE INDEX "PK_rv_s_LogicalAttributePhysicalAttribute" ON "rv_s_LogicalAttributePhysicalAttribute" (
  LogicalAttributePhysicalAttributeHashKey
  , LoadDate
);