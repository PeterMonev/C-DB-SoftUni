SELECT SUM([Difference]) AS SumDifference  FROM
(
SELECT 
      h.FirstName AS 'Host Wizard', 
      h.DepositAmount AS 'Host Wizard Deposit', 
      g.FirstName AS 'Guest Wizard', 
      g.DepositAmount AS 'Guest Wizard Deposit', 
      g.DepositAmount - h.DepositAmount AS 'Difference'
      FROM WizzardDeposits AS h 
JOIN WizzardDeposits AS g
ON h.Id = g.Id + 1
) AS DifferenceQuery