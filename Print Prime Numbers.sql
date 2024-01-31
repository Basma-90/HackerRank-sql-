WITH RECURSIVE NumbersCTE AS (
  SELECT 2 AS value
  UNION ALL
  SELECT value + 1
  FROM NumbersCTE
  WHERE value + 1 <= 1000 
)
SELECT GROUP_CONCAT(value SEPARATOR '&') AS primes
FROM NumbersCTE
WHERE NOT EXISTS (
  SELECT 1
  FROM NumbersCTE n
  WHERE n.value < NumbersCTE.value
    AND NumbersCTE.value % n.value = 0
) AND value > 1;
