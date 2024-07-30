CREATE TABLE "stg_Py_XRMExcelUsageToPhysicalStructure" (
    "SERVER_NAME" varchar(100) NULL
  , "DATABASE_NAME" varchar(100) NULL
  , "SCHEMA_NAME" varchar(100) NULL
  , "EntityName" varchar(100) NULL
  , "EntitySchemaName" varchar(100) NULL
  , "CountCustomAttributes" INTEGER NULL
  , "CountRows" INTEGER NULL
  , "ErrorMessage" varchar(1000) NULL
  , "CountAttributes" INTEGER NULL

  , "RecordSource" nvarchar(500) NULL
  , "LoadDate" datetime NOT NULL

  , "SystemKeyPhrase" varchar(100) NULL
  , "PhysicalStructureKeyPhrase" varchar(1000) NULL

  , "PhysicalStructureHashKey" char(32) NULL
  , "HashDiff" char(32) NULL
);