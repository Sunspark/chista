CREATE TABLE "stg_Py_XRMExcelToPhysicalAttribute" (
  "RecordSource" nvarchar(500) NOT NULL
  , "LoadDate" datetime NOT NULL
  , "ModelKeyPhrase" varchar(100) NULL
  , "SystemKeyPhrase" varchar(100) NULL

  , "PhysicalStructureKeyPhrase" varchar(1000) NULL
  , "PhysicalAttributeKeyPhrase" varchar(1000) NULL
  , "PhysicalStructurePhysicalAttributeKeyPhrase" varchar(1000) NULL

  , "PhysicalStructureHashKey" char(32) NULL
  , "PhysicalAttributeHashKey" char(32) NULL
  , "PhysicalStructurePhysicalAttributeHashKey" char(32) NULL
  , "HashDiff" char(32) NULL

  , "SERVER_NAME" varchar(100) NULL
  , "entity_logical_name" varchar(100) NULL
  , "Logical Name" varchar(100) NULL
  , "Schema Name" varchar(100) NULL
  , "Display Name" varchar(100) NULL
  , "Attribute Type" varchar(100) NULL
  , "Description" varchar(1000) NULL
  , "Custom Attribute" bit NULL
  , "Type" varchar(100) NULL
  , "Additional data" varchar(1000) NULL
);