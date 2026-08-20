SELECT l.Name AS LeagueName, 
       CAST(ROUND(AVG(CAST(m.HomeTeamGoals + m.AwayTeamGoals AS FLOAT)), 2) AS FLOAT) AS AvgScoringRate
  FROM Leagues AS l
  JOIN Matches AS m ON l.Id = m.LeagueId
GROUP BY l.Name
ORDER BY AvgScoringRate DESC;