CREATE TABLE stg_Py_DbdiagramioToLogical
(
    ModelKeyPhrase varchar(100) NOT NULL
  , LogicalEntityKeyPhrase varchar(100) NOT NULL
  , LogicalEntityName varchar(100) NULL
  , isDeleted boolean NULL
  
  , ModelLogicalEntityKeyPhrase varchar(201) NOT NULL
  
  , LoadDate datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
  , RecordSource nvarchar(500) NULL
  
  , ModelHashKey char(32) NULL
  , LogicalEntityHashKey char(32) NULL
  , ModelLogicalEntityHashKey char(32) NULL
  , HashDiff char(32) NULL
);

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

