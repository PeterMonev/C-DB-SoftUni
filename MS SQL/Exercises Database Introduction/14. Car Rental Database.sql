
CREATE TABLE Categories
(
    Id INT PRIMARY KEY IDENTITY,
    CategoryName NVARCHAR(50) NOT NULL,
    DailyRate DECIMAL(10,2) NOT NULL,
    WeeklyRate DECIMAL(10,2) NOT NULL,
    MonthlyRate DECIMAL(10,2) NOT NULL,
    WeekendRate DECIMAL(10,2) NOT NULL
);

CREATE TABLE Cars
(
    Id INT PRIMARY KEY IDENTITY,
    PlateNumber NVARCHAR(20) NOT NULL,
    Manufacturer NVARCHAR(50) NOT NULL,
    Model NVARCHAR(50) NOT NULL,
    CarYear INT NOT NULL,
    CategoryId INT NOT NULL,
    Doors INT NOT NULL,
    Picture VARBINARY(MAX),
    Condition NVARCHAR(30),
    Available BIT NOT NULL,

    CONSTRAINT FK_Cars_Categories
        FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
);

CREATE TABLE Employees
(
    Id INT PRIMARY KEY IDENTITY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Title NVARCHAR(50),
    Notes NVARCHAR(MAX)
);

CREATE TABLE Customers
(
    Id INT PRIMARY KEY IDENTITY,
    DriverLicenceNumber NVARCHAR(30) NOT NULL,
    FullName NVARCHAR(100) NOT NULL,
    Address NVARCHAR(200),
    City NVARCHAR(50),
    ZIPCode NVARCHAR(20),
    Notes NVARCHAR(MAX)
);

CREATE TABLE RentalOrders
(
    Id INT PRIMARY KEY IDENTITY,
    EmployeeId INT NOT NULL,
    CustomerId INT NOT NULL,
    CarId INT NOT NULL,
    TankLevel DECIMAL(5,2),
    KilometrageStart INT,
    KilometrageEnd INT,
    TotalKilometrage INT,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    TotalDays INT,
    RateApplied DECIMAL(10,2),
    TaxRate DECIMAL(5,2),
    OrderStatus NVARCHAR(30),
    Notes NVARCHAR(MAX),

    CONSTRAINT FK_RentalOrders_Employees
        FOREIGN KEY (EmployeeId) REFERENCES Employees(Id),

    CONSTRAINT FK_RentalOrders_Customers
        FOREIGN KEY (CustomerId) REFERENCES Customers(Id),

    CONSTRAINT FK_RentalOrders_Cars
        FOREIGN KEY (CarId) REFERENCES Cars(Id)
);

INSERT INTO Categories
(CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
VALUES
('Economy', 30.00, 180.00, 700.00, 50.00),
('SUV', 60.00, 350.00, 1200.00, 90.00),
('Luxury', 120.00, 700.00, 2500.00, 180.00);

INSERT INTO Cars
(PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Picture, Condition, Available)
VALUES
('A1234BC', 'Toyota', 'Corolla', 2020, 1, 4, NULL, 'Excellent', 1),
('B5678CD', 'BMW', 'X5', 2022, 2, 4, NULL, 'Very Good', 1),
('C9012EF', 'Mercedes', 'S-Class', 2023, 3, 4, NULL, 'Excellent', 0);

INSERT INTO Employees
(FirstName, LastName, Title, Notes)
VALUES
('Ivan', 'Petrov', 'Manager', 'Main office manager'),
('Maria', 'Ivanova', 'Consultant', 'Customer support'),
('Georgi', 'Dimitrov', 'Driver', 'Car delivery specialist');

INSERT INTO Customers
(DriverLicenceNumber, FullName, Address, City, ZIPCode, Notes)
VALUES
('DL12345', 'Petar Georgiev', '12 Vitosha Blvd', 'Sofia', '1000', 'VIP customer'),
('DL54321', 'Anna Petrova', '45 Bulgaria Blvd', 'Plovdiv', '4000', NULL),
('DL67890', 'Nikolay Ivanov', '78 Cherno More', 'Varna', '9000', 'Frequent renter');

INSERT INTO RentalOrders
(EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd,
TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus, Notes)
VALUES
(1, 1, 1, 100.00, 15000, 15200, 200, '2026-05-01', '2026-05-05', 4, 120.00, 20.00, 'Completed', 'Returned on time'),

(2, 2, 2, 80.00, 22000, 22350, 350, '2026-05-10', '2026-05-15', 5, 300.00, 20.00, 'Completed', 'No issues'),

(3, 3, 3, 60.00, 5000, NULL, NULL, '2026-05-16', '2026-05-20', 4, 480.00, 20.00, 'Active', 'Currently rented');