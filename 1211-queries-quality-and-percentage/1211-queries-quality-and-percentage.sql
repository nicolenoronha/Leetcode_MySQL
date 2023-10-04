# Write your MySQL query statement below
WITH QueryQuality AS (
    SELECT query_name,
           SUM(rating / position) / COUNT(*) AS quality,
           SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) / COUNT(*) * 100 AS poor_query_percentage
    FROM Queries
    GROUP BY query_name
)
SELECT query_name,
       ROUND(quality, 2) AS quality,
       ROUND(poor_query_percentage, 2) AS poor_query_percentage
FROM QueryQuality;
