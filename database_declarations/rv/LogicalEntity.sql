CREATE TABLE rv_h_LogicalEntity
(
    LogicalEntityHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , LogicalEntityKeyPhrase varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_h_LogicalEntity" ON "rv_h_LogicalEntity" (LogicalEntityHashKey);
CREATE UNIQUE INDEX "UK_rv_h_LogicalEntity" ON "rv_h_LogicalEntity" (LogicalEntityKeyPhrase);

CREATE TABLE rv_s_LogicalEntity
(
    LogicalEntityHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  , LogicalEntityName varchar(100) NULL
  , isDeleted boolean NULL DEFAULT 0
  , "Description" varchar(1000) NULL
)
;
CREATE UNIQUE INDEX "PK_rv_s_LogicalEntity" ON "rv_s_LogicalEntity" (
  LogicalEntityHashKey
  , LoadDate
);

CREATE TABLE rv_l_ModelLogicalEntity
(
    ModelLogicalEntityHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , ModelHashKey varchar(100) NOT NULL
  , LogicalEntityHashKey varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_l_ModelLogicalEntity" ON "rv_l_ModelLogicalEntity" (ModelLogicalEntityHashKey);
CREATE UNIQUE INDEX "UK_rv_l_ModelLogicalEntity" ON "rv_l_ModelLogicalEntity" (
  ModelHashKey
  , LogicalEntityHashKey
);

CREATE TABLE rv_l_LogicalEntityLogicalEntity_Related
(
    LogicalEntityLogicalEntity_RelatedHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , PrimaryLogicalEntityHashKey varchar(100) NOT NULL
  , SecondaryLogicalEntityHashKey varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_l_LogicalEntityLogicalEntity_Related" ON "rv_l_LogicalEntityLogicalEntity_Related" (LogicalEntityLogicalEntity_RelatedHashKey);
CREATE UNIQUE INDEX "UK_rv_l_LogicalEntityLogicalEntity_Related" ON "rv_l_LogicalEntityLogicalEntity_Related" (
  PrimaryLogicalEntityHashKey
  , SecondaryLogicalEntityHashKey
);

CREATE TABLE rv_s_LogicalEntityLogicalEntity_Related
(
    LogicalEntityLogicalEntity_RelatedHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  , ForwardWords varchar(100) NULL
  , ReverseWords varchar(100) NULL
  , EffectiveStart datetime NULL
  , EffectiveEnd datetime NULL
)
;
CREATE UNIQUE INDEX "PK_rv_s_LogicalEntityLogicalEntity_Related" ON "rv_s_LogicalEntityLogicalEntity_Related" (
  LogicalEntityLogicalEntity_RelatedHashKey
  , LoadDate
);