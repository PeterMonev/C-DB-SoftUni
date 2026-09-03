SELECT DepartmentID, MAX(Salary) AS ThirdHighestSalary
FROM Employees e
WHERE 2 = (
    SELECT COUNT(DISTINCT Salary)
    FROM Employees
    WHERE DepartmentID = e.DepartmentID
      AND Salary > e.Salary
)
GROUP BY DepartmentID;