-- Simple Passenger Table Creation Script
-- Execute this in SQL Server Management Studio

-- Create Passengers table with all fields from Book Now page
CREATE TABLE Passengers (
    PassengerId INT IDENTITY(1,1) PRIMARY KEY,
    PassengerName NVARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    Gender NVARCHAR(10) NOT NULL,
    Contact NVARCHAR(15) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    TravelDate DATE NOT NULL,
    NumberOfSeats INT NOT NULL,
    BusName NVARCHAR(100) NOT NULL,
    Route NVARCHAR(200) NOT NULL,
    Fare DECIMAL(10,2) NOT NULL,
    DepartureTime NVARCHAR(20) NOT NULL,
    ArrivalTime NVARCHAR(20) NOT NULL,
    TotalPrice DECIMAL(10,2) NOT NULL,
    SelectedSeats NVARCHAR(500) NULL,
    BookingDate DATETIME NOT NULL DEFAULT GETDATE(),
    Status NVARCHAR(20) NOT NULL DEFAULT 'Confirmed',
    PaymentStatus NVARCHAR(20) NULL DEFAULT 'Pending',
    BookingReference NVARCHAR(50) NULL,
    SpecialRequests NVARCHAR(500) NULL,
    EmergencyContact NVARCHAR(15) NULL,
    EmergencyContactName NVARCHAR(100) NULL
);

-- Add constraints
ALTER TABLE Passengers ADD CONSTRAINT CK_Age CHECK (Age >= 1 AND Age <= 120);
ALTER TABLE Passengers ADD CONSTRAINT CK_Gender CHECK (Gender IN ('Male', 'Female', 'Other'));
ALTER TABLE Passengers ADD CONSTRAINT CK_NumberOfSeats CHECK (NumberOfSeats >= 1 AND NumberOfSeats <= 6);
ALTER TABLE Passengers ADD CONSTRAINT CK_Status CHECK (Status IN ('Confirmed', 'Cancelled', 'Completed', 'Pending'));

-- Create indexes
CREATE INDEX IX_Passengers_Email ON Passengers(Email);
CREATE INDEX IX_Passengers_Contact ON Passengers(Contact);
CREATE INDEX IX_Passengers_TravelDate ON Passengers(TravelDate);
CREATE INDEX IX_Passengers_BookingDate ON Passengers(BookingDate);

