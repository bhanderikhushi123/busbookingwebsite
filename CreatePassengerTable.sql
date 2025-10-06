-- Create Passenger Table for Bus Booking System
-- This table stores all passenger information from the Book Now page

USE [Busbooking]
GO

-- Drop table if exists
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Passengers]') AND type in (N'U'))
DROP TABLE [dbo].[Passengers]
GO

-- Create Passengers table
CREATE TABLE [dbo].[Passengers](
    [PassengerId] [int] IDENTITY(1,1) NOT NULL,
    [PassengerName] [nvarchar](100) NOT NULL,
    [Age] [int] NOT NULL,
    [Gender] [nvarchar](10) NOT NULL,
    [Contact] [nvarchar](15) NOT NULL,
    [Email] [nvarchar](100) NOT NULL,
    [TravelDate] [date] NOT NULL,
    [NumberOfSeats] [int] NOT NULL,
    [BusName] [nvarchar](100) NOT NULL,
    [Route] [nvarchar](200) NOT NULL,
    [Fare] [decimal](10,2) NOT NULL,
    [DepartureTime] [nvarchar](20) NOT NULL,
    [ArrivalTime] [nvarchar](20) NOT NULL,
    [TotalPrice] [decimal](10,2) NOT NULL,
    [SelectedSeats] [nvarchar](500) NULL,
    [BookingDate] [datetime] NOT NULL DEFAULT GETDATE(),
    [Status] [nvarchar](20) NOT NULL DEFAULT 'Confirmed',
    [PaymentStatus] [nvarchar](20) NULL DEFAULT 'Pending',
    [BookingReference] [nvarchar](50) NULL,
    [SpecialRequests] [nvarchar](500) NULL,
    [EmergencyContact] [nvarchar](15) NULL,
    [EmergencyContactName] [nvarchar](100) NULL,
    [CreatedBy] [nvarchar](50) NULL,
    [ModifiedDate] [datetime] NULL,
    [ModifiedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_Passengers] PRIMARY KEY CLUSTERED ([PassengerId] ASC)
) ON [PRIMARY]
GO

-- Create indexes for better performance
CREATE NONCLUSTERED INDEX [IX_Passengers_Email] ON [dbo].[Passengers] ([Email])
GO

CREATE NONCLUSTERED INDEX [IX_Passengers_Contact] ON [dbo].[Passengers] ([Contact])
GO

CREATE NONCLUSTERED INDEX [IX_Passengers_TravelDate] ON [dbo].[Passengers] ([TravelDate])
GO

CREATE NONCLUSTERED INDEX [IX_Passengers_BookingDate] ON [dbo].[Passengers] ([BookingDate])
GO

CREATE NONCLUSTERED INDEX [IX_Passengers_Status] ON [dbo].[Passengers] ([Status])
GO

-- Add constraints
ALTER TABLE [dbo].[Passengers] ADD CONSTRAINT [CK_Passengers_Age] CHECK ([Age] >= 1 AND [Age] <= 120)
GO

ALTER TABLE [dbo].[Passengers] ADD CONSTRAINT [CK_Passengers_Gender] CHECK ([Gender] IN ('Male', 'Female', 'Other'))
GO

ALTER TABLE [dbo].[Passengers] ADD CONSTRAINT [CK_Passengers_NumberOfSeats] CHECK ([NumberOfSeats] >= 1 AND [NumberOfSeats] <= 6)
GO

ALTER TABLE [dbo].[Passengers] ADD CONSTRAINT [CK_Passengers_Status] CHECK ([Status] IN ('Confirmed', 'Cancelled', 'Completed', 'Pending'))
GO

ALTER TABLE [dbo].[Passengers] ADD CONSTRAINT [CK_Passengers_PaymentStatus] CHECK ([PaymentStatus] IN ('Pending', 'Paid', 'Failed', 'Refunded'))
GO

-- Add foreign key constraints if you have other related tables
-- Example: ALTER TABLE [dbo].[Passengers] ADD CONSTRAINT [FK_Passengers_BusId] FOREIGN KEY ([BusId]) REFERENCES [dbo].[Buses] ([BusId])

-- Insert sample data for testing
INSERT INTO [dbo].[Passengers] 
([PassengerName], [Age], [Gender], [Contact], [Email], [TravelDate], [NumberOfSeats], [BusName], [Route], [Fare], [DepartureTime], [ArrivalTime], [TotalPrice], [SelectedSeats], [BookingReference])
VALUES 
('John Doe', 28, 'Male', '9876543210', 'john.doe@email.com', '2024-02-15', 1, 'SuperExpress 102', 'Rajkot → Ahmedabad', 450.00, '08:30 AM', '12:15 PM', 450.00, 'S5', 'BK001'),
('Jane Smith', 25, 'Female', '9876543211', 'jane.smith@email.com', '2024-02-15', 2, 'SuperExpress 102', 'Rajkot → Ahmedabad', 450.00, '08:30 AM', '12:15 PM', 900.00, 'S1,S2', 'BK002'),
('Mike Johnson', 35, 'Male', '9876543212', 'mike.johnson@email.com', '2024-02-16', 1, 'Express 201', 'Ahmedabad → Mumbai', 650.00, '06:00 AM', '02:30 PM', 650.00, 'S10', 'BK003')
GO

-- Create a view for easy querying
CREATE VIEW [dbo].[vw_PassengerBookings] AS
SELECT 
    p.PassengerId,
    p.PassengerName,
    p.Age,
    p.Gender,
    p.Contact,
    p.Email,
    p.TravelDate,
    p.NumberOfSeats,
    p.BusName,
    p.Route,
    p.Fare,
    p.DepartureTime,
    p.ArrivalTime,
    p.TotalPrice,
    p.SelectedSeats,
    p.BookingDate,
    p.Status,
    p.PaymentStatus,
    p.BookingReference,
    p.SpecialRequests,
    p.EmergencyContact,
    p.EmergencyContactName,
    DATEDIFF(day, GETDATE(), p.TravelDate) AS DaysUntilTravel
FROM [dbo].[Passengers] p
GO

-- Create stored procedure for inserting passenger data
CREATE PROCEDURE [dbo].[sp_InsertPassenger]
    @PassengerName NVARCHAR(100),
    @Age INT,
    @Gender NVARCHAR(10),
    @Contact NVARCHAR(15),
    @Email NVARCHAR(100),
    @TravelDate DATE,
    @NumberOfSeats INT,
    @BusName NVARCHAR(100),
    @Route NVARCHAR(200),
    @Fare DECIMAL(10,2),
    @DepartureTime NVARCHAR(20),
    @ArrivalTime NVARCHAR(20),
    @TotalPrice DECIMAL(10,2),
    @SelectedSeats NVARCHAR(500) = NULL,
    @SpecialRequests NVARCHAR(500) = NULL,
    @EmergencyContact NVARCHAR(15) = NULL,
    @EmergencyContactName NVARCHAR(100) = NULL,
    @BookingReference NVARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        INSERT INTO [dbo].[Passengers] 
        ([PassengerName], [Age], [Gender], [Contact], [Email], [TravelDate], [NumberOfSeats], 
         [BusName], [Route], [Fare], [DepartureTime], [ArrivalTime], [TotalPrice], [SelectedSeats],
         [SpecialRequests], [EmergencyContact], [EmergencyContactName], [BookingReference])
        VALUES 
        (@PassengerName, @Age, @Gender, @Contact, @Email, @TravelDate, @NumberOfSeats,
         @BusName, @Route, @Fare, @DepartureTime, @ArrivalTime, @TotalPrice, @SelectedSeats,
         @SpecialRequests, @EmergencyContact, @EmergencyContactName, @BookingReference)
        
        SELECT SCOPE_IDENTITY() AS NewPassengerId
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage
    END CATCH
END
GO

-- Create stored procedure for updating passenger status
CREATE PROCEDURE [dbo].[sp_UpdatePassengerStatus]
    @PassengerId INT,
    @Status NVARCHAR(20),
    @PaymentStatus NVARCHAR(20) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE [dbo].[Passengers] 
    SET [Status] = @Status,
        [PaymentStatus] = ISNULL(@PaymentStatus, [PaymentStatus]),
        [ModifiedDate] = GETDATE()
    WHERE [PassengerId] = @PassengerId
END
GO

-- Create stored procedure for getting passenger by booking reference
CREATE PROCEDURE [dbo].[sp_GetPassengerByBookingReference]
    @BookingReference NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT * FROM [dbo].[Passengers] 
    WHERE [BookingReference] = @BookingReference
END
GO

PRINT 'Passenger table and related objects created successfully!'
GO

