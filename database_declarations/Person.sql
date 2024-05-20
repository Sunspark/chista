CREATE TABLE rv_h_Person
(
    PersonHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , PersonKeyPhrase varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_h_Person" ON "rv_h_Person" (PersonHashKey);
CREATE UNIQUE INDEX "UK_rv_h_Person" ON "rv_h_Person" (PersonKeyPhrase);

CREATE TABLE rv_s_Person
(
    PersonHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  , PersonName varchar(100) NULL
  , EmailAddress varchar(1000) NULL
)
;
CREATE UNIQUE INDEX "PK_rv_s_Person" ON "rv_s_Person" (
  PersonHashKey
  , LoadDate
);

-- A logical entity has an owner/ steward/ responsible adult
CREATE TABLE rv_l_PersonLogicalEntity
(
    PersonLogicalEntityHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , PersonHashKey varchar(100) NOT NULL
  , LogicalEntityHashKey varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_l_PersonLogicalEntity" ON "rv_l_PersonLogicalEntity" (PersonLogicalEntityHashKey);
CREATE UNIQUE INDEX "UK_rv_l_PersonLogicalEntity" ON "rv_l_PersonLogicalEntity" (
  PersonHashKey
  , LogicalEntityHashKey
);

CREATE TABLE rv_s_PersonLogicalEntity
(
    PersonLogicalEntityHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  , RoleName varchar(100) NULL
  , EffectiveStart datetime NULL
  , EffectiveEnd datetime NULL
)
;
CREATE UNIQUE INDEX "PK_rv_s_PersonLogicalEntity" ON "rv_s_PersonLogicalEntity" (
  PersonLogicalEntityHashKey
  , LoadDate
);