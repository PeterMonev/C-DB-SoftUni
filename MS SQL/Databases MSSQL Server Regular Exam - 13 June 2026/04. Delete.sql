DELETE FROM PlayerStats
      WHERE PlayerId IN (
     SELECT pt.PlayerId 
       FROM PlayersTeams AS pt
       JOIN Teams AS t ON pt.TeamId = t.Id
       JOIN Leagues AS l ON t.LeagueId = l.Id
      WHERE l.Name = 'Eredivisie'
);

DELETE FROM PlayersTeams
 WHERE PlayerId IN (
SELECT pt.PlayerId 
  FROM PlayersTeams AS pt
  JOIN Teams AS t ON pt.TeamId = t.Id
  JOIN Leagues AS l ON t.LeagueId = l.Id
 WHERE l.Name = 'Eredivisie'
);

 DELETE FROM Players
  WHERE Id IN (
 SELECT p.Id 
   FROM Players AS p
   JOIN PlayersTeams AS pt ON p.Id = pt.PlayerId
   JOIN Teams AS t ON pt.TeamId = t.Id
   JOIN Leagues AS l ON t.LeagueId = l.Id
  WHERE l.Name = 'Eredivisie'
);