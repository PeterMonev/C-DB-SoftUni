CREATE TABLE Passports 
(
  PassportID INT PRIMARY KEY IDENTITY(101, 1),
  PassportNumber VARCHAR(50) NOT NULL UNIQUE
)

CREATE TABLE Persons
(
  PersonID INT PRIMARY KEY IDENTITY,
  FirstName VARCHAR(50) NOT NULL,
  Salary DECIMAL (18,2) ,
  PassportID INT NOT NULL UNIQUE

  CONSTRAINT FK_Persons_Passport FOREIGN KEY (PassportID) REFERENCES Passports(PassportID)
)

INSERT INTO Passports (PassportNumber)
VALUES
('N34FG21B'),
('K65L04R7'),
('ZE657QP2')

INSERT INTO Persons (FirstName, Salary, PassportID)
VALUES
('Roberto', 43300.00, 102),
('Tom', 56100.00, 103),
('Yana', 60200.00, 101)