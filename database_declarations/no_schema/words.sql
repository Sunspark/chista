CREATE TABLE BasicWordList (
    BasicWord TEXT PRIMARY KEY
  , WordLength INTEGER
);

CREATE TABLE "AppUsedId" ("AppUsedId" TEXT PRIMARY KEY);

CREATE VIEW NewKeyPhrase AS
SELECT
  a.fish AS NewKeyPhrase
FROM
  (
    SELECT
      (SELECT BasicWord FROM BasicWordList WHERE WordLength > 2 ORDER BY RANDOM() LIMIT 1)
      || '.'
      || (SELECT BasicWord FROM BasicWordList WHERE WordLength > 2 ORDER BY RANDOM() LIMIT 1)
      || '.'
      || (SELECT BasicWord FROM BasicWordList WHERE WordLength > 2 ORDER BY RANDOM() LIMIT 1)
      AS fish
  ) AS a
WHERE
  a.fish NOT IN (SELECT AppUsedId FROM AppUsedId)
;