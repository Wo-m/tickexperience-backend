CREATE TABLE Sport (
    Id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE Venue (
    Id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Location VARCHAR(255) NOT NULL
);

CREATE Table Event (
    Id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    SportId INT NOT NULL,
    VenueId INT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    StartTime TIMESTAMP NOT NULL,
    EndTime TIMESTAMP NOT NULL,
    FOREIGN KEY (SportId) REFERENCES Sport(Id),
    FOREIGN KEY (VenueId) REFERENCES Venue(Id)
);

CREATE TABLE User (
    Id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Username VARCHAR(255) NOT NULL,
    Name VARCHAR(255) NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    UserSalt VARCHAR(255) NOT NULL,
    UNIQUE (Username)
);

CREATE TABLE Ticket (
    Id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    UserId INT,
    EventId INT NOT NULL,
    SeatNumber INT NOT NULL,
    FOREIGN KEY (UserId) REFERENCES User(Id),
    FOREIGN KEY (EventId) REFERENCES Event(Id),
    UNIQUE (EventId, SeatNumber)
);
