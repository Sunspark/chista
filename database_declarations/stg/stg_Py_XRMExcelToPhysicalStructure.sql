CREATE TABLE "stg_Py_XRMExcelToPhysicalStructure" (
    "Entity" varchar(100) NULL
  , "Plural Display Name" varchar(100) NULL
  , "Description" varchar(1000) NULL
  , "Schema Name" varchar(100) NULL
  , "Logical Name" varchar(100) NULL
  , "Object Type Code" int NULL
  , "Is Custom Entity" bit NULL
  , "Ownership Type" varchar(100) NULL
  , "SERVER_NAME" varchar(100) NULL

  , "RecordSource" nvarchar(500) NULL
  , "LoadDate" datetime NOT NULL

  , "ModelKeyPhrase" varchar(100) NULL
  , "SystemKeyPhrase" varchar(100) NULL
  , "PhysicalStructureKeyPhrase" varchar(1000) NULL
  , "ModelPhysicalStructureKeyPhrase" varchar(1000) NULL
  , "SystemPhysicalStructureKeyPhrase" varchar(1000) NULL

  , "ModelHashKey" char(32) NULL
  , "SystemHashKey" char(32) NULL
  , "PhysicalStructureHashKey" char(32) NULL
  , "ModelPhysicalStructureHashKey" char(32) NULL
  , "SystemPhysicalStructureHashKey" char(32) NULL
  , "HashDiff" char(32) NULL

);