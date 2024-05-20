CREATE TABLE rv_h_Business
(
    BusinessHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , BusinessName varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_h_Business" ON "rv_h_Business" (BusinessHashKey);
CREATE UNIQUE INDEX "UK_rv_h_Business" ON "rv_h_Business" (BusinessName);

-- No satellite table

CREATE TABLE rv_l_ModelBusiness
(
    ModelBusinessHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , ModelHashKey varchar(100) NOT NULL
  , BusinessHashKey varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_l_ModelBusiness" ON "rv_l_ModelBusiness" (ModelBusinessHashKey);
CREATE UNIQUE INDEX "UK_rv_l_ModelBusiness" ON "rv_l_ModelBusiness" (
  ModelHashKey
  , BusinessHashKey
);
