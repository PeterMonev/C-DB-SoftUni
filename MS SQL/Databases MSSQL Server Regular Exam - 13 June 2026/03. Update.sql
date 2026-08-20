UPDATE ps
   SET ps.Goals = ps.Goals + 1
  FROM PlayerStats AS ps
  JOIN Players AS p ON ps.PlayerId = p.Id
  JOIN PlayersTeams AS pt ON p.Id = pt.PlayerId
  JOIN Teams AS t ON pt.TeamId = t.Id
  JOIN Leagues AS l ON t.LeagueId = l.Id
 WHERE p.Position = 'Forward' 
   AND l.Name = 'La Liga';