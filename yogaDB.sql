CREATE DATABASE yogaDB;

use yogaDB;

DROP TABLE events;

CREATE TABLE events (
     id INT AUTO_INCREMENT PRIMARY KEY,
     title VARCHAR(256) NOT NULL,
     description varchar(256),
     start DATETIME NOT NULL,
     end DATETIME NOT NULL
);

-- Inserting data into the artists table
INSERT INTO events (title, start, end) VALUES
    ('Event 1', '2023-01-01 08:00:00', '2023-01-01 17:00:00'),
    ('Event 2', '2023-01-02 09:30:00', '2023-01-02 16:30:00'),
    ('Event 3', '2023-01-03 10:00:00', '2023-01-03 18:00:00');

CREATE PROCEDURE getEvents()
    BEGIN
        SELECT * FROM events;
    end;

CREATE
CALL getEvents();

