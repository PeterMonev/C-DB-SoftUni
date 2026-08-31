SELECT e.FirstName, e.LastName, e.HireDate, d.Name FROM Employees AS e
JOIN Departments AS d
ON d.DepartmentID = e.DepartmentID
WHERE e.HireDate > '1999-01-01 00:00:00'
AND d.Name IN ('Finance','Sales')
ORDER BY e.HireDate