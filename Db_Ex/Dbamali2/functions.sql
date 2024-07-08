USE WorkShopManager;
--func1
GO
CREATE FUNCTION CheckVenueAvailability (
    @venue_id INT,
    @start_date DATETIME,
    @end_date DATETIME
)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @result VARCHAR(100);
    IF EXISTS (
        SELECT 1
        FROM Events
        WHERE Venue_ID = @venue_id
        AND (
            (Start_Date < @end_date AND End_Date > @start_date)
        )
    )
    BEGIN
        SET @result = 'The venue is NOT available';
    END
    ELSE
    BEGIN
        SET @result = 'The venue is available';
    END
    
    RETURN @result;
END;
GO
--صدا زدن تابع
DECLARE @venue_id INT = 1;
DECLARE @start_date DATETIME = '2024-06-01 00:00:00';
DECLARE @end_date DATETIME = '2024-06-02 00:00:00';
SELECT dbo.CheckVenueAvailability(@venue_id, @start_date, @end_date) AS AvailabilityMessage;

--func2
CREATE FUNCTION GetLecturerSessionsLastWeek (
    @lecturer_id INT
)
RETURNS INT
AS
BEGIN
    DECLARE @session_count INT;
    
    SELECT @session_count = COUNT(*)
    FROM Sessions
    WHERE Lecturer_ID = @lecturer_id
    AND Scheduled_Start >= DATEADD(DAY, -7, GETDATE())
    AND Scheduled_End <= GETDATE();
    
    RETURN @session_count;
END;
--صدا زدن تابع
SELECT dbo.GetLecturerSessionsLastWeek(2) AS Session_count ; 

--func3
--فانکشن حاوی 
--اپدیت نمیتواند باشد در اس کیو ال سرور
--رویه میزنیم بجاش
GO

CREATE PROCEDURE UpdateTicketStatusProcedure (
    @ticket_id INT,
    @new_status VARCHAR(20)
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Tickets WHERE Ticket_ID = @ticket_id)
    BEGIN
        UPDATE Tickets
        SET Status = @new_status
        WHERE Ticket_ID = @ticket_id;
        PRINT 'The ticket status has been successfully updated.';
    END
    ELSE
    BEGIN
        PRINT 'Ticket ID not found.';
    END
END;
GO
EXEC UpdateTicketStatusProcedure @ticket_id = 1, @new_status = 'Used';


