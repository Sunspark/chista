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