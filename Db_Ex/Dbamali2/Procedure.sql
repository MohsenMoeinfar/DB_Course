CREATE PROCEDURE PurchaseTicket
    @participant_id INT,
    @event_id INT
AS
BEGIN
    DECLARE @max_participants INT;
    DECLARE @current_participants INT;
    DECLARE @new_ticket_id INT;
    SELECT @max_participants = Max_Participants FROM Events WHERE ID = @event_id;
    SELECT @current_participants = COUNT(*) FROM Tickets WHERE Event_ID = @event_id;
    SELECT @new_ticket_id = ISNULL(MAX(Ticket_ID), 0) + 1 FROM Tickets;
    IF @current_participants < @max_participants
    BEGIN
        INSERT INTO Tickets (Ticket_ID, Event_ID, Participant_ID, Purchase_Date, Status)
        VALUES (@new_ticket_id, @event_id, @participant_id, GETDATE(), 'Valid');
        PRINT 'با موفقیت خریداری شد';
    END
    ELSE
    BEGIN
        THROW 50000, 'ظرفیت پر شده', 1;
    END
END;
GO
EXEC PurchaseTicket @participant_id = 2, @event_id = 1;
