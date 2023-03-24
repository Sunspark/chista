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