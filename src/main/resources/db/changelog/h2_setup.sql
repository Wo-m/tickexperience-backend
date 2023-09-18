CREATE TABLE Sport (
    Id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Icon VARCHAR(255) NOT NULL
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
    ImageURL VARCHAR(255) NOT NULL,
    Gender VARCHAR(255),
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

Create table Section (
     Id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
     imageURL VARCHAR(255) NOT NULL,
     VenueId INT NOT NULL,
     FOREIGN KEY (VenueId) REFERENCES Venue(Id)
);

CREATE TABLE Ticket (
    Id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    SeatNumber INT NOT NULL,
    Price Decimal(5,2) NOT NULL,
    QRCode VARCHAR(255) NOT NULL,
    UserId INT,
    EventId INT NOT NULL,
    SectionId INT NOT NULL, -- must be section on events venue
    FOREIGN KEY (UserId) REFERENCES User(Id),
    FOREIGN KEY (EventId) REFERENCES Event(Id),
    FOREIGN KEY (SectionId) REFERENCES Section(Id),
    UNIQUE (EventId, SeatNumber, SectionId)
);