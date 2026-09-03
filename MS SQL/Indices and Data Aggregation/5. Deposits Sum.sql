SELECT DepositGroup, SUM(DepositAmount + DepositInterest + DepositCharge) AS 'TotalSum' FROM WizzardDeposits
GROUP BY DepositGroup