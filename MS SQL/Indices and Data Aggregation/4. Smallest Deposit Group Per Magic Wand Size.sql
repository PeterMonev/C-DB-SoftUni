SELECT TOP(2) DepositGroup, AVG(MagicWandSize) AS 'WandSize' FROM WizzardDeposits
GROUP BY DepositGroup
ORDER BY WandSize