USE [Minions]

CREATE TABLE [People](
  [Id] BIGINT UNIQUE NOT NULL,
  [Name] NVARCHAR(50) NOT NULL,
  [Picture] VARBINARY(MAX),
  CHECK(LEN([Picture]) <= 921600),
  [Height] DECIMAL (3,2),
  [Weight] DECIMAL (3,2),
  [Gender] CHAR(1) NOT NULL,
  [Birthdate] DATETIME2 NOT NULL,
  [Biography] NVARCHAR(MAX)
);

INSERT INTO People (Name, Picture, Height, Weight, Gender, Birthdate, Biography)
VALUES 
('Ivan Petrov', NULL, 1.80, 75.50, 'm', '1995-04-12', 'Software developer from Sofia.'),
('Maria Georgieva', NULL, 1.65, 55.20, 'f', '1998-09-21', 'Student and designer.'),
('Georgi Ivanov', NULL, 1.90, 90.00, 'm', '1990-01-05', 'Athlete and coach.'),
('Elena Dimitrova', NULL, 1.70, 60.30, 'f', '1993-11-30', 'Teacher with 10 years experience.'),
('Nikolay Stoyanov', NULL, 1.75, 80.10, 'm', '1987-06-15', 'Engineer working in automotive industry.');