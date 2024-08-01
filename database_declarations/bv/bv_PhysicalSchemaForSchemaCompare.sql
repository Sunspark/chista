CREATE VIEW bv_PhysicalSchemaForSchemaCompare AS
SELECT DISTINCT
  SERVER_NAME
  , DATABASE_NAME
  , SCHEMA_NAME
FROM
  out_PhysicalStructureCurrentForSchemaCompare
;