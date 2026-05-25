CREATE TABLE Teachers 
(
TeacherID INT PRIMARY KEY IDENTITY (101,1),
[Name] VARCHAR(50) NOT NULL,
ManagerID INT

CONSTRAINT FK_TeacherID_ManagerID FOREIGN KEY (ManagerID) REFERENCES Teachers(TeacherID)
)

INSERT INTO Teachers ([Name])
VALUES
('John'),  
('Maya'),   
('Silvia'), 
('Ted'),    
('Mark'),  
('Greta')