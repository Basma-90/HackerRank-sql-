WITH RECURSIVE PatternCTE AS (
    SELECT 20 AS R
    UNION ALL
    SELECT R - 1
    FROM PatternCTE
    WHERE R > 1
)
SELECT REPEAT('* ', R) AS Pattern
FROM PatternCTE;
