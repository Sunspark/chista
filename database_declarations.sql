-------------------------------------------------------
-- Words for IDs
-------------------------------------------------------
CREATE TABLE BasicWordList (
    BasicWord TEXT PRIMARY KEY
  , WordLength INTEGER
);

CREATE TABLE "AppUsedId" ("AppUsedId" TEXT PRIMARY KEY);

CREATE VIEW NewKeyPhrase AS
SELECT
  a.fish AS NewKeyPhrase
FROM
  (
    SELECT
      (SELECT BasicWord FROM BasicWordList WHERE WordLength > 2 ORDER BY RANDOM() LIMIT 1)
      || '.'
      || (SELECT BasicWord FROM BasicWordList WHERE WordLength > 2 ORDER BY RANDOM() LIMIT 1)
      || '.'
      || (SELECT BasicWord FROM BasicWordList WHERE WordLength > 2 ORDER BY RANDOM() LIMIT 1)
      AS fish
  ) AS a
WHERE
  a.fish NOT IN (SELECT AppUsedId FROM AppUsedId)
;

-------------------------------------------------------
-- Models
-------------------------------------------------------

CREATE TABLE rv_h_Model
(
    ModelHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , ModelKeyPhrase varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_h_Model" ON "rv_h_Model" (ModelHashKey);
CREATE UNIQUE INDEX "UK_rv_h_Model" ON "rv_h_Model" (ModelKeyPhrase);

CREATE TABLE rv_s_Model
(
    ModelHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  , ModelName varchar(100) NULL
  , ModelConceptLevel varchar(100) NULL
  , ModelType varchar(100) NULL
  , isDeleted boolean NULL DEFAULT 0
)
;
CREATE UNIQUE INDEX "PK_rv_s_Model" ON "rv_s_Model" (
  ModelHashKey
  , LoadDate
);

CREATE TABLE stg_Py_CreateModel
(
    ModelKeyPhrase varchar(100) NOT NULL
  , ModelName varchar(100) NULL
  , ModelConceptLevel varchar(100) NULL
  , ModelType varchar(100) NULL
  
  , LoadDate datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
  , RecordSource nvarchar(500) NULL
  
  , ModelHashKey char(32) NULL
  , HashDiff char(32) NULL
);

CREATE VIEW bv_Model AS
SELECT
    h.ModelKeyPhrase
  , s.ModelName
  , s.ModelConceptLevel
  , s.ModelType
  , s.isDeleted
FROM
  rv_h_Model AS h
  LEFT JOIN rv_s_Model AS s ON (
    h.ModelHashKey = s.ModelHashKey
    AND s.LoadDate = (
      SELECT MAX(z.LoadDate)
      FROM rv_s_Model AS z
      WHERE z.ModelHashKey = s.ModelHashKey
    )
  )
;

-------------------------------------------------------
-- Logical Entities
-------------------------------------------------------

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


