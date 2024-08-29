CREATE VIEW out_PhysicalForeignKeys AS
WITH
PhysicalAttributes AS (
	-- this CTE will need to be re-written when more attributes have FK's
	-- needs COALESCE
	SELECT
		pa.PhysicalAttributeHashKey
		, SERVER_NAME
		, DATABASE_NAME
		, SCHEMA_NAME
		, TABLE_NAME
		, COLUMN_NAME
	FROM
		rv_h_PhysicalAttribute pa
		INNER JOIN rv_s_PhysicalAttribute_Mysql AS pamy ON (
			pa.PhysicalAttributeHashKey = pamy.PhysicalAttributeHashKey
			AND pamy.LoadDate = (
				SELECT MAX(z.LoadDate)
				FROM rv_s_PhysicalAttribute_Mysql AS z
				WHERE z.PhysicalAttributeHashKey = pamy.PhysicalAttributeHashKey
			)
		)	
)




SELECT
	lpfk.PhysicalForeignKeyPhysicalAttributePhysicalAttributeHashKey
	, lpfk.PhysicalForeignKeyHashKey
	, lpfk.PhysicalAttribute_childHashKey
	, lpfk.PhysicalAttribute_parentHashKey
	
	, hpac.SERVER_NAME AS SERVER_NAME_CHILD
	, hpac.DATABASE_NAME AS DATABASE_NAME_CHILD
	, hpac.SCHEMA_NAME AS SCHEMA_NAME_CHILD
	, hpac.TABLE_NAME AS TABLE_NAME_CHILD
	, hpac.COLUMN_NAME AS COLUMN_NAME_CHILD

	, hpap.SERVER_NAME AS SERVER_NAME_PARENT
	, hpap.DATABASE_NAME AS DATABASE_NAME_PARENT
	, hpap.SCHEMA_NAME AS SCHEMA_NAME_PARENT
	, hpap.TABLE_NAME AS TABLE_NAME_PARENT
	, hpap.COLUMN_NAME AS COLUMN_NAME_PARENT

	, lpfk.OrdinalPosition AS ORDINAL_POSITION
	, hpfk.PhysicalForeignKeyName AS CONSTRAINT_NAME
	, spfk.Enforcement AS CONSTRAINT_ENFORCEMENT
FROM
	rv_l_PhysicalForeignKeyPhysicalAttributePhysicalAttribute lpfk
	INNER JOIN rv_h_PhysicalForeignKey hpfk ON (
		lpfk.PhysicalForeignKeyHashKey = hpfk.PhysicalForeignKeyHashKey
	)
	INNER JOIN rv_s_PhysicalForeignKey AS spfk ON (
		hpfk.PhysicalForeignKeyHashKey = spfk.PhysicalForeignKeyHashKey
		AND spfk.LoadDate = (
			SELECT MAX(z.LoadDate)
			FROM rv_s_PhysicalForeignKey AS z
			WHERE z.PhysicalForeignKeyHashKey = spfk.PhysicalForeignKeyHashKey
		)
	)	
	INNER JOIN PhysicalAttributes hpac ON (
		lpfk.PhysicalAttribute_childHashKey = hpac.PhysicalAttributeHashKey
	)
	INNER JOIN PhysicalAttributes hpap ON (
		lpfk.PhysicalAttribute_parentHashKey = hpap.PhysicalAttributeHashKey
	)
;