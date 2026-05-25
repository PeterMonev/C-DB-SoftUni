CREATE TABLE Subjects 
(
 SubjectID INT PRIMARY KEY IDENTITY,
 SubjectName VARCHAR(200)
)

CREATE TABLE Majors 
(
 MajorID INT PRIMARY KEY IDENTITY,
 [Name] VARCHAR(50) NOT NULL
)

CREATE TABLE Students
(
 StudentID INT PRIMARY KEY IDENTITY,
 StudentNumber VARCHAR(50) UNIQUE NOT NULL,
 StudentName VARCHAR(50),
 MajorID INT NOT NULL,

 CONSTRAINT FK_Majors_Students FOREIGN KEY (MajorID) REFERENCES Majors(MajorID)
)

CREATE TABLE Agenda 
(
StudentID INT,
SubjectID INT,

CONSTRAINT PK_StudentID_SubjectID PRIMARY KEY (StudentID, SubjectID),
CONSTRAINT FK_Student_Agenda FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
CONSTRAINT FK_Subjects_Agenda FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID),
)

CREATE TABLE Payments 
(
 PaymentID INT PRIMARY KEY IDENTITY,
 PaymentDate DATE NOT NULL,
 PaymentAmount DECIMAL (18,2),
 StudentID INT NOT NULL,

 CONSTRAINT FK_Payments_Students FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
)
