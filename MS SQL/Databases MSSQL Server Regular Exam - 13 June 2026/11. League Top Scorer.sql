CREATE FUNCTION udf_LeagueTopScorer(@LeagueName NVARCHAR(50))
RETURNS TABLE
AS
RETURN
    SELECT TOP (1) WITH TIES
           p.Name AS PlayerName, 
           ps.Goals AS TotalGoals
      FROM Players AS p
      JOIN PlayerStats AS ps ON p.Id = ps.PlayerId
      JOIN PlayersTeams AS pt ON p.Id = pt.PlayerId
      JOIN Teams AS t         ON pt.TeamId = t.Id
      JOIN Leagues AS l       ON t.LeagueId = l.Id
     WHERE l.Name = @LeagueName
  ORDER BY ps.Goals DESC;