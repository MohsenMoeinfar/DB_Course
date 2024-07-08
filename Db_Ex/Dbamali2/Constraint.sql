--در 
--sql server
--کانسترینت نمیتواند شامل ساب کوئری باشد پس ما از تریگر استفاده میکنیم

CREATE TRIGGER checksessionwithevent
ON Sessions
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @Event_ID INT, @Scheduled_Start DATETIME, @Scheduled_End DATETIME;
    SELECT @Event_ID = Event_ID, @Scheduled_Start = Scheduled_Start, @Scheduled_End = Scheduled_End 
    FROM inserted;
    IF EXISTS (
        SELECT 1
        FROM Events
        WHERE 
            ID = @Event_ID
            AND 
			(
                @Scheduled_Start < Start_Date
				OR 
                @Scheduled_End > End_Date
            )
    )
    BEGIN
        RAISERROR('ناسازگاری زمانی وجود دارد', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
--چک کردن
INSERT INTO Sessions (ID, Event_ID, Title, Lecturer_ID, Scheduled_Start, Scheduled_End, Description) VALUES
(10, 2, 'Introduction to AI', 1, '2024-06-13 09:00:00', '2024-06-15 11:00:00', 'Basic concepts and applications of AI.');



--برای قسمت دوم
CREATE TRIGGER checksessionoverlap
ON Sessions
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @Event_ID INT, @Scheduled_Start DATETIME, @Scheduled_End DATETIME;
    SELECT @Event_ID = Event_ID, @Scheduled_Start = Scheduled_Start, @Scheduled_End = Scheduled_End 
    FROM inserted;
    IF EXISTS (
        SELECT 1
        FROM Sessions
        WHERE 
            Event_ID = @Event_ID
            AND ID != (SELECT ID FROM inserted)
            AND (
                (Scheduled_Start < @Scheduled_End AND Scheduled_End > @Scheduled_Start)
            )
    )
    BEGIN
        RAISERROR('Sessions cannot overlap.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
--چک کردن
INSERT INTO Sessions (ID, Event_ID, Title, Lecturer_ID, Scheduled_Start, Scheduled_End, Description) VALUES
(10, 2, 'Introduction to AI', 1, '2024-06-15 11:00:00', '2024-06-15 12:00:00', 'Basic concepts and applications of AI.');
