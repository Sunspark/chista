CREATE VIEW bv_DatabricksDataTypeFromSQLServer AS
SELECT 
	PhysicalAttributeHashKey
	, LoadDate

	, CASE
		WHEN DATA_TYPE IN ('char', 'nchar', 'varchar', 'nvarchar') THEN 'STRING'
		WHEN DATA_TYPE IN ('datetime', 'datetime2') THEN 'TIMESTAMP_NTZ'
		WHEN DATA_TYPE = 'date' THEN 'DATE'
		WHEN DATA_TYPE = 'smallint' THEN 'SMALLINT'
		WHEN DATA_TYPE = 'int' THEN 'INT'
		WHEN DATA_TYPE = 'bigint' THEN 'BIGINT'
		WHEN DATA_TYPE IN ('decimal', 'numeric') THEN 'DECIMAL(' || NUMERIC_PRECISION || ',' || NUMERIC_SCALE || ')'
		WHEN DATA_TYPE = 'bit' THEN 'BOOLEAN'
		WHEN DATA_TYPE = 'varbinary' THEN 'BINARY'
		ELSE 'INVESTIGATE'
	END AS Databricks_Data_Type

FROM
	rv_s_PhysicalAttribute_SqlServerScrape
;