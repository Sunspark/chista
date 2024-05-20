-- System.server_name.database.schema.table.field
CREATE TABLE rv_h_PhysicalAttribute
(
    PhysicalAttributeHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , PhysicalAttributeKeyPhrase varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_h_PhysicalAttribute" ON "rv_h_PhysicalAttribute" (PhysicalAttributeHashKey);
CREATE UNIQUE INDEX "UK_rv_h_PhysicalAttribute" ON "rv_h_PhysicalAttribute" (PhysicalAttributeKeyPhrase);

CREATE TABLE rv_s_PhysicalAttribute_sqlserver
(
    PhysicalAttributeHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  ,
  SERVER_NAME TEXT,
  "DATABASE_NAME" TEXT,
  TABLE_SCHEMA TEXT,
  TABLE_NAME TEXT,
  COLUMN_NAME TEXT,
  ORDINAL_POSITION INT,
  COLUMN_DEFAULT REAL,
  IS_NULLABLE TEXT,
  DATA_TYPE TEXT,
  CHARACTER_MAXIMUM_LENGTH REAL,
  CHARACTER_OCTET_LENGTH REAL,
  NUMERIC_PRECISION REAL,
  NUMERIC_PRECISION_RADIX REAL,
  NUMERIC_SCALE REAL,
  DATETIME_PRECISION REAL,
  CHARACTER_SET_CATALOG REAL,
  CHARACTER_SET_SCHEMA REAL,
  CHARACTER_SET_NAME TEXT,
  COLLATION_CATALOG REAL,
  COLLATION_SCHEMA REAL,
  COLLATION_NAME TEXT,
  DOMAIN_CATALOG REAL,
  DOMAIN_SCHEMA REAL,
  DOMAIN_NAME REAL
)
;
CREATE UNIQUE INDEX "PK_rv_s_PhysicalAttribute_sqlserver" ON "rv_s_PhysicalAttribute_sqlserver" (
  PhysicalAttributeHashKey
  , LoadDate
);

CREATE TABLE rv_s_PhysicalAttribute_dataverse
(
    PhysicalAttributeHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  ,
  SERVER_NAME TEXT,
  "Logical Name" TEXT,
  "Schema Name" TEXT,
  "Display Name" TEXT,
  "Attribute Type" TEXT,
  Description TEXT,
  "Custom Attribute" INT,
  Type TEXT,
  "Additional data" TEXT,
  entity_schema_name TEXT
)
;
CREATE UNIQUE INDEX "PK_rv_s_PhysicalAttribute_dataverse" ON "rv_s_PhysicalAttribute_dataverse" (
  PhysicalAttributeHashKey
  , LoadDate
);

-- A structure has attributes
CREATE TABLE rv_l_PhysicalStructurePhysicalAttribute
(
    PhysicalStructurePhysicalAttributeHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , PhysicalStructureHashKey varchar(100) NOT NULL
  , PhysicalAttributeHashKey varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_l_PhysicalStructurePhysicalAttribute" ON "rv_l_PhysicalStructurePhysicalAttribute" (PhysicalStructurePhysicalAttributeHashKey);
CREATE UNIQUE INDEX "UK_rv_l_PhysicalStructurePhysicalAttribute" ON "rv_l_PhysicalStructurePhysicalAttribute" (
  PhysicalStructureHashKey
  , PhysicalAttributeHashKey
);

-- A Physical attribute can transform to one or many other Physical Attributes
CREATE TABLE rv_l_PhysicalAttributePhysicalAttribute_transform
(
    PhysicalAttributePhysicalAttribute_transformHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , PhysicalAttribute_sourceHashKey varchar(100) NOT NULL
  , PhysicalAttribute_destinationHashKey varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_l_PhysicalAttributePhysicalAttribute_transform" ON "rv_l_PhysicalAttributePhysicalAttribute_transform" (PhysicalAttributePhysicalAttribute_transformHashKey);
CREATE UNIQUE INDEX "UK_rv_l_PhysicalAttributePhysicalAttribute_transform" ON "rv_l_PhysicalAttributePhysicalAttribute_transform" (
  PhysicalAttribute_sourceHashKey
  , PhysicalAttribute_destinationHashKey
);

CREATE TABLE rv_s_PhysicalAttributePhysicalAttribute_transform
(
    PhysicalAttributePhysicalAttribute_transformHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  , TransformationNotes varchar(1000) NULL
  , EffectiveStart datetime NULL
  , EffectiveEnd datetime NULL
)
;
CREATE UNIQUE INDEX "PK_rv_s_PhysicalAttributePhysicalAttribute_transform" ON "rv_s_PhysicalAttributePhysicalAttribute_transform" (
  PhysicalAttributePhysicalAttribute_transformHashKey
  , LoadDate
);

-- A Physical attribute can have FK links
CREATE TABLE rv_l_PhysicalAttributePhysicalAttribute_fk
(
    PhysicalAttributePhysicalAttribute_fkHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  
  , PhysicalAttribute_codeHashKey varchar(100) NOT NULL
  , PhysicalAttribute_valueHashKey varchar(100) NOT NULL
)
;
CREATE UNIQUE INDEX "PK_rv_l_PhysicalAttributePhysicalAttribute_fk" ON "rv_l_PhysicalAttributePhysicalAttribute_fk" (PhysicalAttributePhysicalAttribute_fkHashKey);
CREATE UNIQUE INDEX "UK_rv_l_PhysicalAttributePhysicalAttribute_fk" ON "rv_l_PhysicalAttributePhysicalAttribute_fk" (
  PhysicalAttribute_codeHashKey
  , PhysicalAttribute_valueHashKey
);

CREATE TABLE rv_s_PhysicalAttributePhysicalAttribute_fk
(
    PhysicalAttributePhysicalAttribute_fkHashKey char(32) NOT NULL
  , LoadDate datetime NOT NULL
  , RecordSource nvarchar(500) NOT NULL
  , HashDiff char(32) NOT NULL
  
  , Enforcement varchar(11) NULL -- one of ENFORCED, NOTENFORCED, LOGICAL
  , EffectiveStart datetime NULL
  , EffectiveEnd datetime NULL
)
;
CREATE UNIQUE INDEX "PK_rv_s_PhysicalAttributePhysicalAttribute_fk" ON "rv_s_PhysicalAttributePhysicalAttribute_fk" (
  PhysicalAttributePhysicalAttribute_fkHashKey
  , LoadDate
);

-- [TODO] A Physical attribute can have constraints
