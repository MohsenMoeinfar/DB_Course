use WorkShopManager ; 
CREATE TABLE Users (
    ID INT PRIMARY KEY,
    Firstname VARCHAR(100),
    Lastname VARCHAR(100),
    Username VARCHAR(50),
    Email VARCHAR(100),
    Role VARCHAR(50)
);
CREATE TABLE Venues (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Province VARCHAR(100),
    City VARCHAR(100),
    Capacity INT
);

CREATE TABLE Events (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Type VARCHAR(50),
    Venue_ID INT,
    Start_Date DATETIME,
    End_Date DATETIME,
    Max_Participants INT,
    FOREIGN KEY (Venue_ID) REFERENCES Venues(ID)
);

CREATE TABLE Lecturers (
    Lecturer_ID INT PRIMARY KEY,
    Specialization VARCHAR(100),
    Biography TEXT,
    FOREIGN KEY (Lecturer_ID) REFERENCES Users(ID)
);

CREATE TABLE Participants (
    Participant_ID INT PRIMARY KEY,
    Skill_Level VARCHAR(50),
    FOREIGN KEY ( Participant_ID) REFERENCES Users(ID)
);
CREATE TABLE Sessions (
    ID INT PRIMARY KEY,
    Event_ID INT,
    Title VARCHAR(100),
    Lecturer_ID INT,
    Scheduled_Start DATETIME,
    Scheduled_End DATETIME,
    Description TEXT,
    FOREIGN KEY (Event_ID) REFERENCES Events(ID),
    FOREIGN KEY (Lecturer_ID) REFERENCES Lecturers(Lecturer_ID)
);
CREATE TABLE Tickets (
    Ticket_ID INT PRIMARY KEY,
    Event_ID INT,
    Participant_ID INT,
    Purchase_Date DATETIME,
    Status VARCHAR(50),
    FOREIGN KEY (Event_ID) REFERENCES Events(ID),
    FOREIGN KEY (Participant_ID) REFERENCES Participants(Participant_ID)
);
