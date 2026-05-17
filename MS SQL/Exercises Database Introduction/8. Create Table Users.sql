CREATE TABLE [Users]
(
    [Id] INT PRIMARY KEY IDENTITY,
    Username VARCHAR(30) NOT NULL UNIQUE,
    Password VARCHAR(26) NOT NULL,
    [ProfilePicture] VARBINARY(MAX),
    [LastLoginTime] DATETIME2,
    [IsDeleted] BIT NOT NULL
);
INSERT INTO Users (Username, Password, ProfilePicture, LastLoginTime, IsDeleted)
VALUES 
('john_doe', 'pass123', NULL, '2026-05-10 10:15:00', 0),
('maria99', 'qwerty1', NULL, '2026-05-12 08:30:00', 0),
('george_admin', 'adminpass', NULL, NULL, 0),
('eva_smith', 'eva2024', NULL, '2026-05-01 22:45:00', 1),
('nikolay_k', 'nik12345', NULL, '2026-05-15 14:00:00', 0);