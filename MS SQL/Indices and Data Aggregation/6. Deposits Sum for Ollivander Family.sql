SELECT DepositGroup, SUM(DepositAmount + DepositCharge + DepositInterest) AS 'TotalSum' FROM WizzardDeposits
WHERE MagicWandCreator = 'Ollivander family'
GROUP BY DepositGroup
