-- A Physical Foreign Key is a relation between two Physical Attributes
-- Sometimes multiple Physical Attributes relate to multiple Physical Attributes, in which case Order matters
-- A key always has a name
-- A key may be present in the database and ENFORCED
-- A key may be present in the database and NOTENFORCED
-- A key may NOT be present in the database and hence is purely LOGICAL

CREATE TABLE rv_h_PhysicalForeignKey
(
    PhysicalForeignKeyHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , PhysicalForeignKeyName varchar(1000) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_h_PhysicalForeignKey" ON "rv_h_PhysicalForeignKey" (PhysicalForeignKeyHashKey);
CREATE UNIQUE INDEX "UK_rv_h_PhysicalForeignKey" ON "rv_h_PhysicalForeignKey" (PhysicalForeignKeyName);

CREATE TABLE rv_l_PhysicalForeignKeyPhysicalAttributePhysicalAttribute
(
    PhysicalForeignKeyPhysicalAttributePhysicalAttributeHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , PhysicalForeignKeyHashKey char(32) NOT NULL
  , PhysicalAttribute_childHashKey varchar(100) NOT NULL
  , PhysicalAttribute_parentHashKey varchar(100) NOT NULL
  , OrdinalPosition INT NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_l_PhysicalForeignKeyPhysicalAttributePhysicalAttribute" ON "rv_l_PhysicalForeignKeyPhysicalAttributePhysicalAttribute" (PhysicalForeignKeyPhysicalAttributePhysicalAttributeHashKey);
CREATE UNIQUE INDEX "UK_rv_l_PhysicalForeignKeyPhysicalAttributePhysicalAttribute" ON "rv_l_PhysicalForeignKeyPhysicalAttributePhysicalAttribute" (
    PhysicalForeignKeyHashKey
  , PhysicalAttribute_childHashKey
  , PhysicalAttribute_parentHashKey
  , OrdinalPosition
);

CREATE TABLE rv_s_PhysicalForeignKey
(
    PhysicalForeignKeyHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  , Enforcement varchar(11) NULL -- one of ENFORCED, NOTENFORCED, LOGICAL
  , EffectiveStart datetime NULL
  , EffectiveEnd datetime NULL
)
;
CREATE UNIQUE INDEX "PK_rv_s_PhysicalForeignKey" ON "rv_s_PhysicalForeignKey" (
  PhysicalForeignKeyHashKey
  , LoadDate
);