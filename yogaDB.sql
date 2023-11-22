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

-- Inserting 12 more events into the artists table

INSERT INTO events (title, start, end) VALUES
    ('Conference A', '2023-02-15 09:00:00', '2023-02-15 17:00:00'),
    ('Workshop X', '2023-03-10 13:30:00', '2023-03-10 16:00:00'),
    ('Music Festival', '2023-04-22 18:00:00', '2023-04-23 02:00:00'),
    ('Art Exhibition', '2023-05-05 10:00:00', '2023-05-05 18:00:00'),
    ('Team Building', '2023-06-08 14:00:00', '2023-06-08 17:00:00'),
    ('Product Launch', '2023-07-20 11:00:00', '2023-07-20 14:30:00'),
    ('Movie Night', '2023-08-12 19:30:00', '2023-08-12 23:00:00'),
    ('Science Fair', '2023-09-05 08:30:00', '2023-09-05 16:00:00'),
    ('Charity Gala', '2023-10-18 18:30:00', '2023-10-18 22:00:00'),
    ('Hackathon', '2023-11-11 10:00:00', '2023-11-12 18:00:00'),
    ('Winter Wonderland', '2023-12-25 16:00:00', '2023-12-25 22:00:00'),
    ('New Year''s Eve Party', '2023-12-31 21:00:00', '2024-01-01 02:00:00');

CREATE PROCEDURE getEvents()
    BEGIN
        SELECT * FROM events;
    end;
CALL getEvents();

CREATE PROCEDURE getEventsByTitle(variable varchar(256))
    BEGIN
        SELECT * FROM events
        WHERE title LIKE CONCAT("%",variable,"%");
    END;
CALL getEventByTitle("nt 1");

DROP PROCEDURE getPage;
CREATE PROCEDURE getPage(var_page int, eventPerPage int, var_title varchar(256))
    BEGIN
        DECLARE setOffset INT;

        SET setOffset = (var_page - 1) * eventPerPage;
        START TRANSACTION;
            SELECT * FROM events
            WHERE title LIKE CONCAT("%",var_title,"%")
            LIMIT eventPerPage OFFSET setOffset;
        COMMIT;
    end;
CALL getPage(1, 5,  "t");

CREATE PROCEDURE postEvent(title varchar(256), description varchar(256), start DATETIME, end DATETIME)
    BEGIN
        INSERT INTO events (title,description, start, end) VALUES
           (title,description, start, end);
    end;
CALL postEvent("Cool event", "no", "2023-04-23 02:00:00","2023-04-23 06:00:00" );


