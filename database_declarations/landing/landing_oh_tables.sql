-- this table lands an extract from SQL server
-- similar to imports/physical/sqlserver/tables.sql
CREATE TABLE landing_oh_tables(
  "index" INT,
  SCHEMA_NAME TEXT,
  TABLE_NAME TEXT,
  ROW_COUNT INT,
  TABLE_TYPE TEXT,
  TABLE_TYPE_DESCRIPTION TEXT,
  COLUMN_COUNT INT
);