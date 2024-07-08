USE WorkShopManager;
--trigger1
GO
CREATE TRIGGER PreventDeletion
ON Users
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM deleted d
        JOIN Lecturers l ON d.ID = l.Lecturer_ID
        JOIN Sessions s ON l.Lecturer_ID = s.Lecturer_ID
        WHERE s.Scheduled_Start > GETDATE()
    )
    BEGIN
        RAISERROR ('Cannot delete user(lecturer) with scheduled future sessions.', 16, 1);
    END
    ELSE
    BEGIN
        DELETE FROM Users
        WHERE ID IN (SELECT ID FROM deleted);
    END
END;
GO
--check trigger
delete from Users
where ID = 1 ; 

--trigger2
--لول نداشت این جدول برای همین اضافه میکنیمش
ALTER TABLE Lecturers
ADD Experience_Level VARCHAR(20);

GO
CREATE TRIGGER UpdateExperienceLevel
ON Sessions
AFTER INSERT, DELETE
AS
BEGIN
    DECLARE @LecturerID INT;
    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        SELECT @LecturerID = Lecturer_ID FROM inserted;
        UPDATE Lecturers
        SET Experience_Level = CASE 
            WHEN (SELECT COUNT(*) FROM Sessions WHERE Lecturer_ID = @LecturerID) >= 20 THEN 'Expert'
            WHEN (SELECT COUNT(*) FROM Sessions WHERE Lecturer_ID = @LecturerID) >= 10 THEN 'Intermediate'
            ELSE 'Beginner'
        END
        WHERE Lecturer_ID = @LecturerID;
    END
    IF EXISTS (SELECT 1 FROM deleted)
    BEGIN
        SELECT @LecturerID = Lecturer_ID FROM deleted;
        UPDATE Lecturers
        SET Experience_Level = CASE 
            WHEN (SELECT COUNT(*) FROM Sessions WHERE Lecturer_ID = @LecturerID) >= 20 THEN 'Expert'
            WHEN (SELECT COUNT(*) FROM Sessions WHERE Lecturer_ID = @LecturerID) >= 10 THEN 'Intermediate'
            ELSE 'Beginner'
        END
        WHERE Lecturer_ID = @LecturerID;
    END
END;
GO
--check trigger
INSERT INTO Sessions (ID, Event_ID, Title, Lecturer_ID, Scheduled_Start, Scheduled_End, Description) VALUES
(8, 1, 'Introduction to AI', 1, '2024-06-02 09:00:00', '2024-06-03 11:00:00', 'Basic concepts and applications of AI.');

