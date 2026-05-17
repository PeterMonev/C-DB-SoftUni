CREATE DATABASE Movies;

GO

USE Movies;

GO

CREATE TABLE Directors(
Id INT PRIMARY KEY,
DirectorName VARCHAR(50) NOT NULL,
Notes NVARCHAR(MAX),
)

CREATE TABLE Genres
(
Id INT PRIMARY KEY,
GenreName VARCHAR(50) NOT NULL,
Notes NVARCHAR(MAX)
)

CREATE TABLE Categories
(
    Id INT PRIMARY KEY IDENTITY,
    CategoryName NVARCHAR(50) NOT NULL,
    Notes NVARCHAR(MAX)
);

CREATE TABLE Movies
(
Id INT PRIMARY KEY,
Title NVARCHAR(200) NOT NULL,
DirectorId INT NOT NULL,
CopyrightYear DATE,
Length INT,
GenreId INT NOT NULL,
CategoryId INT NOT NULL,
Rating Decimal(3,2),
Notes NVARCHAR(MAX),

    CONSTRAINT FK_Movies_Directors
        FOREIGN KEY (DirectorId) REFERENCES Directors(Id),

    CONSTRAINT FK_Movies_Genres
        FOREIGN KEY (GenreId) REFERENCES Genres(Id),


    CONSTRAINT FK_CATEGORY_ID FOREIGN KEY (CategoryId) REFERENCES Categories(Id),

)

INSERT INTO Directors (DirectorName, Notes)
VALUES
('Steven Spielberg', 'Famous Hollywood director'),
('Christopher Nolan', 'Known for sci-fi movies'),
('Martin Scorsese', 'Crime movie specialist'),
('Quentin Tarantino', 'Stylized action movies'),
('James Cameron', 'Director of Titanic and Avatar');

INSERT INTO Genres (GenreName, Notes)
VALUES
('Action', 'Action movies'),
('Drama', 'Dramatic stories'),
('Comedy', 'Funny movies'),
('Sci-Fi', 'Science fiction'),
('Thriller', 'Suspense movies');

INSERT INTO Categories (CategoryName, Notes)
VALUES
('PG-13', 'Parental guidance suggested'),
('R', 'Restricted'),
('Family', 'Suitable for families'),
('Adventure', 'Adventure movies'),
('Classic', 'Classic films');

INSERT INTO Movies
(Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
VALUES
('Inception', 2, '2010-01-01', 148, 4, 1, 8.80, 'Dream-related thriller'),
('Titanic', 5, '1997-01-01', 195, 2, 4, 7.90, 'Romantic drama'),
('Pulp Fiction', 4, '1994-01-01', 154, 1, 2, 8.90, 'Cult classic'),
('Jurassic Park', 1, '1993-01-01', 127, 4, 3, 8.10, 'Dinosaurs adventure'),
('The Wolf of Wall Street', 3, '2013-01-01', 180, 2, 2, 8.20, 'Biography comedy-drama');