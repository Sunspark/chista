CREATE TABLE rv_h_BusinessArea
(
    BusinessAreaHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , BusinessAreaKeyPhrase varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_h_BusinessArea" ON "rv_h_BusinessArea" (BusinessAreaHashKey);
CREATE UNIQUE INDEX "UK_rv_h_BusinessArea" ON "rv_h_BusinessArea" (BusinessAreaKeyPhrase);

CREATE TABLE rv_s_BusinessArea
(
    BusinessAreaHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  , BusinessAreaName varchar(100) NULL
  , Description varchar(1000) NULL
  , isDeleted boolean NULL DEFAULT 0
)
;
CREATE UNIQUE INDEX "PK_rv_s_BusinessArea" ON "rv_s_BusinessArea" (
  BusinessAreaHashKey
  , LoadDate
);

CREATE TABLE rv_l_ModelBusinessArea
(
    ModelBusinessAreaHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , ModelHashKey varchar(100) NOT NULL
  , BusinessAreaHashKey varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_l_ModelBusinessArea" ON "rv_l_ModelBusinessArea" (ModelBusinessAreaHashKey);
CREATE UNIQUE INDEX "UK_rv_l_ModelBusinessArea" ON "rv_l_ModelBusinessArea" (
  ModelHashKey
  , BusinessAreaHashKey
);

CREATE TABLE rv_l_BusinessBusinessArea
(
    BusinessBusinessAreaHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , BusinessHashKey varchar(100) NOT NULL
  , BusinessAreaHashKey varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_l_BusinessBusinessArea" ON "rv_l_BusinessBusinessArea" (BusinessBusinessAreaHashKey);
CREATE UNIQUE INDEX "UK_rv_l_BusinessBusinessArea" ON "rv_l_BusinessBusinessArea" (
  BusinessHashKey
  , BusinessAreaHashKey
);
