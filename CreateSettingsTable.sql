-- Create Settings Table for Bus Booking System
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Settings_tbl]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Settings_tbl] (
        [Id] INT IDENTITY(1,1) PRIMARY KEY,
        [SettingKey] NVARCHAR(100) NOT NULL UNIQUE,
        [SettingValue] NVARCHAR(MAX) NULL,
        [SettingCategory] NVARCHAR(50) NULL,
        [Description] NVARCHAR(500) NULL,
        [UpdatedDate] DATETIME DEFAULT GETDATE(),
        [UpdatedBy] NVARCHAR(100) NULL
    )
    
    -- Insert default settings
    INSERT INTO Settings_tbl (SettingKey, SettingValue, SettingCategory, Description) VALUES
    -- General Settings
    ('CompanyName', 'BusBooking', 'General', 'Company Name'),
    ('CompanyEmail', 'info@busbooking.com', 'General', 'Company Email'),
    ('CompanyPhone', '+91 1234567890', 'General', 'Company Phone'),
    ('CompanyAddress', '123 Bus Station Road, Mumbai, Maharashtra 400001', 'General', 'Company Address'),
    ('Timezone', 'IST', 'General', 'System Timezone'),
    ('Currency', 'INR', 'General', 'Default Currency'),
    
    -- Booking Settings
    ('AdvanceBookingDays', '30', 'Booking', 'Maximum days in advance customers can book tickets'),
    ('CancellationHours', '24', 'Booking', 'Hours before departure when cancellation is allowed'),
    ('MaxSeatsPerBooking', '6', 'Booking', 'Maximum number of seats a customer can book at once'),
    ('AllowLadiesSeats', 'true', 'Booking', 'Allow ladies seat reservation'),
    ('RequireIdProof', 'true', 'Booking', 'Require ID proof for booking'),
    ('AutoCancelUnpaid', 'false', 'Booking', 'Auto-cancel unpaid bookings after 30 minutes'),
    
    -- Payment Settings
    ('PaymentMethodsCards', 'true', 'Payment', 'Enable Credit/Debit Cards'),
    ('PaymentMethodsUPI', 'true', 'Payment', 'Enable UPI'),
    ('PaymentMethodsNetBanking', 'true', 'Payment', 'Enable Net Banking'),
    ('PaymentMethodsWallets', 'false', 'Payment', 'Enable Digital Wallets'),
    ('PaymentMethodsCOD', 'false', 'Payment', 'Enable Cash on Delivery'),
    ('TransactionFee', '2.5', 'Payment', 'Transaction Fee Percentage'),
    ('RefundDays', '3', 'Payment', 'Number of days to process refunds'),
    ('PaymentGatewayKey', 'pk_test_1234567890abcdef', 'Payment', 'Payment Gateway API Key'),
    
    -- Email Settings
    ('SmtpHost', 'smtp.gmail.com', 'Email', 'SMTP Host'),
    ('SmtpPort', '587', 'Email', 'SMTP Port'),
    ('SmtpUsername', 'noreply@busbooking.com', 'Email', 'SMTP Username'),
    ('SmtpPassword', '', 'Email', 'SMTP Password'),
    ('EmailNotificationsBooking', 'true', 'Email', 'Send booking confirmation emails'),
    ('EmailNotificationsCancellation', 'true', 'Email', 'Send cancellation notifications'),
    ('EmailNotificationsReminder', 'true', 'Email', 'Send reminder emails 24h before journey'),
    ('EmailNotificationsMarketing', 'false', 'Email', 'Send marketing emails'),
    
    -- Security Settings
    ('SessionTimeout', '30', 'Security', 'Session Timeout in minutes'),
    ('MaxLoginAttempts', '5', 'Security', 'Maximum Login Attempts'),
    ('LockoutDuration', '15', 'Security', 'Lockout Duration in minutes'),
    ('TwoFactorAuth', 'false', 'Security', 'Enable Two-Factor Authentication'),
    ('PasswordComplexity', 'true', 'Security', 'Enforce strong password requirements'),
    ('SslRequired', 'true', 'Security', 'Require SSL/HTTPS for all connections'),
    
    -- Backup Settings
    ('AutoBackupEnabled', 'true', 'Backup', 'Enable automatic daily backups'),
    ('BackupTime', '02:00', 'Backup', 'Backup Time'),
    ('RetentionDays', '30', 'Backup', 'Backup Retention Period in days'),
    ('LastBackupDate', '', 'Backup', 'Last Backup Date')
END
GO

