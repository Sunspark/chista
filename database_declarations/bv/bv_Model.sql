CREATE VIEW bv_Model AS
SELECT
    h.ModelKeyPhrase
  , s.ModelName
  , s.ModelConceptLevel
  , s.ModelType
  , s.isDeleted
FROM
  rv_h_Model AS h
  LEFT JOIN rv_s_Model AS s ON (
    h.ModelHashKey = s.ModelHashKey
    AND s.LoadDate = (
      SELECT MAX(z.LoadDate)
      FROM rv_s_Model AS z
      WHERE z.ModelHashKey = s.ModelHashKey
    )
  )
;