SELECT TOP 10 
       t1.Name AS HomeTeamName, 
       t2.Name AS AwayTeamName, 
       l.Name  AS LeagueName, 
       FORMAT(m.MatchDate, 'yyyy-MM-dd') AS MatchDate
  FROM Matches      AS m
  JOIN Teams        AS t1 ON m.HomeTeamId = t1.Id
  JOIN Teams        AS t2 ON m.AwayTeamId = t2.Id
  JOIN Leagues      AS l  ON m.LeagueId   = l.Id
 WHERE m.MatchDate >= '2024-09-01' 
   AND m.MatchDate <  '2024-09-16'
   AND l.Id % 2 = 0
ORDER BY m.MatchDate ASC, 
         t1.Name ASC;