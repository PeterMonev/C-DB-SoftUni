SELECT 
    DepositGroup,
    SUM(DepositAmount + DepositCharge + DepositInterest) AS TotalSum
FROM WizzardDeposits
WHERE MagicWandCreator = 'Ollivander family'
GROUP BY DepositGroup
HAVING SUM(DepositAmount + DepositCharge + DepositInterest) < 150000
ORDER BY TotalSum DESC;