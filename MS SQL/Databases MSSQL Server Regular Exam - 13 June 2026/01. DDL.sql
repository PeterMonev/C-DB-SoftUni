CREATE DATABASE EuroLeagues;

USE EuroLeagues;

CREATE TABLE Leagues
(
    Id INT IDENTITY PRIMARY KEY,
  Name NVARCHAR(50) NOT NULL
);

CREATE TABLE Teams
(
      Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL UNIQUE,
    City NVARCHAR(50) NOT NULL,
LeagueId INT NOT NULL,

CONSTRAINT FK_Teams_Leagues
   FOREIGN KEY (LeagueId)
REFERENCES Leagues(Id)
);

CREATE TABLE Players
(
      Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
Position NVARCHAR(20) NOT NULL
);

CREATE TABLE Matches
(
           Id INT IDENTITY PRIMARY KEY,
   HomeTeamId INT NOT NULL,
   AwayTeamId INT NOT NULL,
    MatchDate DATETIME2 NOT NULL,
HomeTeamGoals INT NOT NULL DEFAULT 0,
AwayTeamGoals INT NOT NULL DEFAULT 0,
     LeagueId INT NOT NULL,

   CONSTRAINT FK_Matches_HomeTeam
      FOREIGN KEY (HomeTeamId)
   REFERENCES Teams(Id),

   CONSTRAINT FK_Matches_AwayTeam
      FOREIGN KEY (AwayTeamId)
   REFERENCES Teams(Id),

   CONSTRAINT FK_Matches_Leagues
      FOREIGN KEY (LeagueId)
   REFERENCES Leagues(Id)
);

CREATE TABLE PlayersTeams
(
   PlayerId INT NOT NULL,
     TeamId INT NOT NULL,

 CONSTRAINT PK_PlayersTeams
PRIMARY KEY (PlayerId, TeamId),

 CONSTRAINT FK_PlayersTeams_Players
FOREIGN KEY (PlayerId)
 REFERENCES Players(Id),

 CONSTRAINT FK_PlayersTeams_Teams
FOREIGN KEY (TeamId)
 REFERENCES Teams(Id)
);

CREATE TABLE PlayerStats
(
  PlayerId INT PRIMARY KEY,
     Goals INT NOT NULL DEFAULT 0,
   Assists INT NOT NULL DEFAULT 0,

CONSTRAINT FK_PlayerStats_Players
   FOREIGN KEY (PlayerId)
REFERENCES Players(Id)
);

CREATE TABLE TeamStats
(
TeamId INT PRIMARY KEY,
  Wins INT NOT NULL DEFAULT 0,
 Draws INT NOT NULL DEFAULT 0,
Losses INT NOT NULL DEFAULT 0,

CONSTRAINT FK_TeamStats_Teams
   FOREIGN KEY (TeamId)
REFERENCES Teams(Id)
);