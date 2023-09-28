# Write your MySQL query statement below
SELECT e1.name
FROM Employee e1
INNER JOIN (
    SELECT managerId, COUNT(*) AS directReportsCount
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(*) >= 5
) e2 ON e1.id = e2.managerId;