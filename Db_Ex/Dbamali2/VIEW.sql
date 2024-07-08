use WorkShopManager ;
CREATE VIEW LecturerSessions AS
SELECT 
    l.Lecturer_ID,
    CONCAT(u.Firstname, ' ', u.Lastname) AS Fullname,
    l.Specialization,
    s.Title AS Session_Title,
    s.Description AS Session_Description,
    e.Name AS Event_Name,
    s.Scheduled_Start,
    s.Scheduled_End
FROM 
    Lecturers l
    JOIN Users u ON l.Lecturer_ID = u.ID
    JOIN Sessions s ON l.Lecturer_ID = s.Lecturer_ID
    JOIN Events e ON s.Event_ID = e.ID;
SELECT * FROM LecturerSessions;
