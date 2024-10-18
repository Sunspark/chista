CREATE VIEW bv_DatabricksDataTypeFromDataverse AS
SELECT 
	PhysicalAttributeHashKey
	, LoadDate

	, CASE
		WHEN "Attribute Type" IN ('Whole number', 'State', 'Status') THEN 'INT'
		WHEN "Attribute Type" = 'BigInt' THEN 'BIGINT'
		WHEN "Attribute Type" = 'Two options' THEN 'BOOLEAN'
		WHEN "Attribute Type" IN (
				'Uniqueidentifier'
			, 'Lookup'
			, 'Virtual'
			, 'Text'
			, 'Choice'
			, 'Multiline Text'
			, 'Choices'
			, 'Owner'
			, 'EntityName'
		) THEN 'STRING'
		WHEN "Attribute Type" = 'DateTime'
		THEN 
			CASE
				WHEN INSTR("Additional data", 'DateAndTime') > 0 THEN 'TIMESTAMP_NTZ'
				WHEN INSTR("Additional data", 'DateOnly') > 0 THEN 'DATE'
				ELSE 'INVESTIGATE'
			END
		WHEN "Attribute Type" IN ('Double', 'Currency', 'Decimal')
		THEN
			'DECIMAL('
			|| -- This expression extracts the maximum value from the "Additional data" field, the length of which (plus the scale amount) is the Precision
			(
				LENGTH(
					SUBSTR(
						"Additional data"
						, INSTR("Additional data", 'Maximum value: ') + 15
						, (INSTR("Additional data", 'Precision: ') - 1) - (INSTR("Additional data", 'Maximum value: ') + 15)
					)
				)
				+ CAST(
					SUBSTR("Additional data", INSTR("Additional data", 'Precision: ') + 11) -- This actually gets the scale, as the wording is confusing.
					AS INT
				)
			)
			|| ','
			|| SUBSTR("Additional data", INSTR("Additional data", 'Precision: ') + 11) -- This actually gets the scale, as the wording is confusing.
			|| ')'
		ELSE 'INVESTIGATE'
	END AS Databricks_Data_Type

FROM
	rv_s_PhysicalAttribute_XRMMetadata
;