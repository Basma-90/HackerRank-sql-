WITH TOTALCHALLENGES AS (
    SELECT
        hackers.hacker_id,
        hackers.name,
        COUNT(challenges.challenge_id) AS TOTAL
    FROM
        hackers
    INNER JOIN
        challenges ON hackers.hacker_id = challenges.hacker_id
    GROUP BY
        hackers.hacker_id,
        hackers.name
)

SELECT
    a.hacker_id,
    a.name,
    a.TOTAL
FROM
    TOTALCHALLENGES a
INNER JOIN (
    SELECT
        COUNT(1) AS rankie,
        TOTAL
    FROM
        TOTALCHALLENGES b
    GROUP BY
        TOTAL
) b ON a.TOTAL = b.TOTAL
CROSS JOIN (
    SELECT
        MAX(TOTAL) AS maxCount
    FROM
        TOTALCHALLENGES
) c
WHERE
    (a.TOTAL < c.maxCount AND rankie <= 1)
    OR a.TOTAL = c.maxCount
ORDER BY
    a.TOTAL DESC,
    a.hacker_id;
/*
problem link 
https://www.hackerrank.com/challenges/challenges/problem
*/

