WITH Nums AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS num
    FROM
        sys.all_columns AS c1
        CROSS JOIN sys.all_columns AS c2
    WHERE
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) <= 1000
),
Primes AS (
    SELECT n.num
    FROM Nums AS n
    WHERE n.num > 1 AND NOT EXISTS (
        SELECT 1
        FROM Nums AS d
        WHERE d.num > 1 AND d.num * d.num <= n.num AND n.num % d.num = 0
    )
)
SELECT STRING_AGG(P.num, '&') WITHIN GROUP (ORDER BY P.num)
FROM Primes AS P;