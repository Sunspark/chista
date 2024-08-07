CREATE VIEW bv_System AS
SELECT
    h.SystemKeyPhrase
  , s.SystemName
  , s.isDeleted
	, s."Description"
FROM
  rv_h_System AS h
  LEFT JOIN rv_s_System AS s ON (
    h.SystemHashKey = s.SystemHashKey
    AND s.LoadDate = (
      SELECT MAX(z.LoadDate)
      FROM rv_s_System AS z
      WHERE z.SystemHashKey = s.SystemHashKey
    )
  )
;