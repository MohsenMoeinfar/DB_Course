
USE WorkShopManager;
INSERT INTO Users (ID, Firstname, Lastname, Username, Email, Role) VALUES
(1, 'John', 'Doe', 'jdoe', 'jdoe@example.com', 'Lecturer'),
(2, 'Jane', 'Smith', 'jsmith', 'jsmith@example.com', 'Participant'),
(3, 'Alice', 'Johnson', 'ajohnson', 'ajohnson@example.com', 'Participant'),
(4, 'Bob', 'Brown', 'bbrown', 'bbrown@example.com', 'Lecturer');
INSERT INTO Venues (ID, Name, Province, City, Capacity) VALUES
(1, 'Main Hall', 'Tehran', 'Tehran', 200),
(2, 'Conference Room', 'Isfahan', 'Isfahan', 100),
(3, 'Auditorium', 'Tehran', 'Tehran', 300);
INSERT INTO Events (ID, Name, Type, Venue_ID, Start_Date, End_Date, Max_Participants) VALUES
(1, 'AI Workshop', 'Workshop', 1, '2024-06-01 09:00:00', '2024-06-01 17:00:00', 150),
(2, 'Hackathon', 'Hackathon', 2, '2024-06-15 10:00:00', '2024-06-15 18:00:00', 80),
(3, 'Machine Learning Seminar', 'Seminar', 3, '2024-06-20 09:00:00', '2024-06-20 16:00:00', 250);
INSERT INTO Lecturers (Lecturer_ID, Specialization, Biography) VALUES
(1, 'Artificial Intelligence', 'Expert in AI with 10 years of experience.'),
(4, 'Software Development', 'Experienced software developer and educator.');
INSERT INTO Participants (Participant_ID, Skill_Level) VALUES
(2, 'Beginner'),
(3, 'Intermediate');
INSERT INTO Sessions (ID, Event_ID, Title, Lecturer_ID, Scheduled_Start, Scheduled_End, Description) VALUES
(1, 1, 'Introduction to AI', 1, '2024-06-01 09:00:00', '2024-06-01 11:00:00', 'Basic concepts and applications of AI.'),
(2, 1, 'Advanced AI Techniques', 1, '2024-06-01 13:00:00', '2024-06-01 15:00:00', 'In-depth look at advanced AI techniques.'),
(3, 2, 'Hackathon Kickoff', 4, '2024-06-15 10:00:00', '2024-06-15 12:00:00', 'Introduction and kickoff for the hackathon.');
INSERT INTO Tickets (Ticket_ID, Event_ID, Participant_ID, Purchase_Date, Status) VALUES
(1, 1, 2, '2024-05-15 10:00:00', 'Valid'),
(2, 1, 3, '2024-05-20 11:00:00', 'Valid'),
(3, 2, 2, '2024-05-25 12:00:00', 'Valid');
