USE WorkShopManager;
--query1
SELECT 
    E.Name AS EventName, 
    E.Type AS EventType, 
    E.Start_Date, 
    E.End_Date, 
    E.Max_Participants, 
    V.Name AS VenueName, 
    V.Capacity
FROM 
    Events E
INNER JOIN 
    Venues V ON E.ID = V.ID
WHERE 
    E.Start_Date > GETDATE();

--query2
WITH UserPreferredEventType AS (
    SELECT 
        p.Participant_ID,
        e.Type,
        COUNT(e.ID) AS Event_Count,
        ROW_NUMBER() OVER (PARTITION BY p.Participant_ID ORDER BY COUNT(e.ID) DESC) AS rn
    FROM 
        Tickets t
    JOIN 
        Events e ON t.Event_ID = e.ID
    JOIN 
        Participants p ON t.Participant_ID = p.Participant_ID
    WHERE 
        e.End_Date < GETDATE()
    GROUP BY 
        p.Participant_ID, e.Type
),
UpcomingEvents AS (
    SELECT 
        e.ID AS Event_ID,
        e.Type,
        e.Name,
        e.Start_Date
    FROM 
        Events e
    WHERE 
        e.Start_Date > GETDATE()
)
SELECT 
    u.ID AS User_ID,
    ue.Name AS Suggested_Event_Name,
    ue.Type AS Suggested_Event_Type,
    ue.Start_Date
FROM 
    Users u
JOIN 
    Participants p ON u.ID = p.Participant_ID
JOIN 
    UserPreferredEventType upt ON p.Participant_ID = upt.Participant_ID AND upt.rn = 1
JOIN 
    UpcomingEvents ue ON upt.Type = ue.Type
ORDER BY 
    u.ID, ue.Start_Date;

INSERT INTO Sessions (ID, Event_ID, Title, Lecturer_ID, Scheduled_Start, Scheduled_End, Description) VALUES
(4, 1, 'AI Ethics', 1, '2024-06-01 10:00:00', '2024-06-01 12:00:00', 'Discussion on ethics in AI.'),
(5, 2, 'Hackathon Challenge', 4, '2024-06-15 11:00:00', '2024-06-15 13:00:00', 'Challenge session for hackathon participants.'),
(6, 3, 'ML Basics', 4, '2024-06-20 09:30:00', '2024-06-20 11:30:00', 'Introduction to machine learning.'),
(7, 3, 'ML Advanced', 4, '2024-06-20 12:00:00', '2024-06-20 14:00:00', 'Advanced topics in machine learning.');

--query3
SELECT 
    e1.Name AS Event_Name,
    e1.Type AS Event_Type
FROM 
    Events e1
JOIN 
    Sessions s1 ON e1.ID = s1.Event_ID
JOIN 
    Sessions s2 ON s1.Scheduled_Start < s2.Scheduled_End AND s1.Scheduled_End > s2.Scheduled_Start AND s1.ID != s2.ID
WHERE 
    e1.ID = s2.Event_ID
GROUP BY 
    e1.Name, e1.Type;
--query4
ALTER TABLE Lecturers
ALTER COLUMN Biography VARCHAR(MAX);

SELECT 
    CONCAT(u.Firstname, ' ', u.Lastname) AS Full_Name,
    l.Specialization,
    u.Email,
    l.Biography,
    COUNT(s.ID) AS DoneSession
FROM 
    Lecturers l
JOIN 
    Users u ON l.Lecturer_ID = u.ID
LEFT JOIN 
    Sessions s ON l.Lecturer_ID = s.Lecturer_ID AND s.Scheduled_End < GETDATE()
GROUP BY 
    u.ID, CONCAT(u.Firstname, ' ', u.Lastname), l.Specialization , l.Biography ,u.Email
ORDER BY 
    DoneSession;

--query5
SELECT 
    e.Name AS Event_Name,
    e.Max_Participants,
    COUNT(t.Ticket_ID) AS Current_Participants
FROM 
    Events e
LEFT JOIN 
    Tickets t ON e.ID = t.Event_ID
GROUP BY 
    e.Name, e.Max_Participants
HAVING 
    COUNT(t.Ticket_ID) < e.Max_Participants;

--query6
WITH SkillScores AS (
    SELECT 
        p.Participant_ID,
        CASE 
            WHEN p.Skill_Level = 'Beginner' THEN 1
            WHEN p.Skill_Level = 'Intermediate' THEN 2
            WHEN p.Skill_Level = 'Advanced' THEN 3
        END AS Skill_Score
    FROM 
        Participants p
),
EventSkillLevels AS (
    SELECT 
        e.Type AS Event_Type,
        ss.Skill_Score
    FROM 
        Events e
    JOIN 
        Tickets t ON e.ID = t.Event_ID
    JOIN 
        Participants p ON t.Participant_ID = p.Participant_ID
    JOIN 
        SkillScores ss ON p.Participant_ID = ss.Participant_ID
)
SELECT 
    Event_Type,
    AVG(Skill_Score) AS Avg_Skill_Level
FROM 
    EventSkillLevels
GROUP BY 
    Event_Type;


