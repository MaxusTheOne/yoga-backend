CREATE DATABASE yogaDB;

use yogaDB;

DROP TABLE events;

-- Creating tables
CREATE TABLE events (
     id INT AUTO_INCREMENT PRIMARY KEY,
     title VARCHAR(256) NOT NULL,
     description varchar(256),
     start DATETIME NOT NULL,
     end DATETIME NOT NULL
);
CREATE TABLE users (
     id INT AUTO_INCREMENT PRIMARY KEY,
     age INT NOT NULL,
     firstName varchar(256) NOT NULL,
     lastName varchar(256) NOT NULL,
     memberStatus bool,
     activityLevel varchar(256),
     phone numeric,
     email varchar(256)
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

-- Inserting users into the users table
INSERT INTO users (age, firstName, lastName, memberStatus, activityLevel, phone, email) VALUES
    (25, 'John', 'Doe', true, 'High', 1234567890, 'john.doe@example.com'),
    (30, 'Jane', 'Smith', false, 'Medium', 9876543210, 'jane.smith@example.com'),
    (22, 'Alice', 'Johnson', true, 'Low', 5551234567, 'alice.johnson@example.com'),
    (28, 'Bob', 'Williams', true, 'High', 1112223333, 'bob.williams@example.com'),
    (35, 'Eva', 'Anderson', false, 'Medium', 9998887777, 'eva.anderson@example.com'),
    (40, 'Charlie', 'Brown', true, 'Low', 4445556666, 'charlie.brown@example.com'),
    (26, 'Grace', 'Miller', false, 'High', 7778889999, 'grace.miller@example.com'),
    (32, 'David', 'Taylor', true, 'Medium', 3334445555, 'david.taylor@example.com'),
    (27, 'Sophie', 'Clark', false, 'Low', 6667778888, 'sophie.clark@example.com'),
    (33, 'Michael', 'Jones', true, 'High', 2223334444, 'michael.jones@example.com'),
    (29, 'Olivia', 'Davis', true, 'Medium', 8889990000, 'olivia.davis@example.com'),
    (31, 'Henry', 'Moore', false, 'Low', 1239876543, 'henry.moore@example.com');

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
CALL getEventsByTitle("nt 1");

DROP PROCEDURE getEventPage;
CREATE PROCEDURE getEventPage(var_page int, eventPerPage int, var_title varchar(256))
    BEGIN
        DECLARE setOffset INT;

        SET setOffset = (var_page - 1) * eventPerPage;
        START TRANSACTION;
            SELECT * FROM events
            WHERE title LIKE CONCAT("%",var_title,"%")
            LIMIT eventPerPage OFFSET setOffset;
        COMMIT;
    end;
CALL getEventPage(1, 5,  "t");

CREATE PROCEDURE postEvent(title varchar(256), description varchar(256), start DATETIME, end DATETIME)
    BEGIN
        INSERT INTO events (title,description, start, end) VALUES
           (title,description, start, end);
    end;
CALL postEvent("Cool event", "no", "2023-04-23 02:00:00","2023-04-23 06:00:00" );

CREATE PROCEDURE getUsers()
BEGIN
    SELECT * FROM users;
end;
CALL getUsers();

CREATE PROCEDURE getUserPageFirstNameSearch(var_page int, eventPerPage int, var_name varchar(256))
BEGIN
    DECLARE setOffset INT;
    SET setOffset = (var_page - 1) * eventPerPage;
    START TRANSACTION;
    SELECT * FROM users
    WHERE firstName LIKE CONCAT("%",var_name,"%")
    LIMIT eventPerPage OFFSET setOffset;
    COMMIT;
end;
CALL getUserPageFirstNameSearch(1, 5, "a");

CREATE PROCEDURE getAllMembers(var_page int, eventPerPage int)
BEGIN
    DECLARE setOffset INT;

    SET setOffset = (var_page - 1) * eventPerPage;
    START TRANSACTION;
    SELECT * FROM users
    WHERE memberStatus = 1
    LIMIT eventPerPage OFFSET setOffset;
    COMMIT;
end;
CALL getAllMembers(1, 9)

CREATE PROCEDURE promoteToMember(var_id int)
BEGIN
    UPDATE users
        SET memberStatus= 1
    WHERE id = var_id;
end;
CALL promoteToMember(2);

CREATE PROCEDURE demoteToGuest(var_id int)
BEGIN
    UPDATE users
    SET memberStatus= 0
    WHERE id = var_id;
end;

CREATE TABLE users_events(
    user_id INT NOT NULL,
    event_id INT NOT NULL,
    PRIMARY KEY (user_id, event_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (event_id) REFERENCES events(id)
);

CREATE PROCEDURE associateUserEvent(user_id int, event_id int)
BEGIN
    INSERT INTO users_events (user_id, event_id)
        VALUES (user_id, event_id);
end;
CALL associateUserEvent(3,5)


CREATE TABLE media(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(256) NOT NULL,
    link VARCHAR(256),
    linkDescription VARCHAR(200),
    description VARCHAR(500) NOT NULL,
    img VARCHAR(256) NOT NULL,
    link VARCHAR(256) NOT NULL,
    linkDescription VARCHAR(256) NOT NULL
);

INSERT INTO media (title, description, img, link,linkDescription) VALUES
    ('tis', 'tissemyre', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Meat_eater_ant_feeding_on_honey02.jpg/300px-Meat_eater_ant_feeding_on_honey02.jpg','https://www.youtube.com/watch?v=G-rsmbK7gdY', 'see video wow'),
    ('tree', 'wow tree', 'https://upload.wikimedia.org/wikipedia/commons/e/eb/Ash_Tree_-_geograph.org.uk_-_590710.jpg','https://www.youtube.com/watch?v=G-rsmbK7gdY','dsanvlkd'),
    ('strong', 'wow so strong slay', 'https://web-back.perfectgym.com/sites/default/files/styles/460x/public/equipment%20%286%29.jpg?itok=bC0T32-K','https://www.youtube.com/watch?v=G-rsmbK7gdY','aeglfæ');


CREATE PROCEDURE getMedia()
    BEGIN
        SELECT * FROM media;
    end;
CALL getMedia();

DROP PROCEDURE postMedia

CREATE PROCEDURE postMedia(title varchar(256), description varchar(500), img varchar(256),link varchar(256), linkDescription VARCHAR(200))
    BEGIN
        IF link = '' THEN SET link = NULL; END IF;
        IF linkDescription = '' THEN SET linkDescription = NULL; END IF;
        INSERT INTO media (title,description, img, link,linkDescription) VALUES
           (title,description, img,link,linkDescription);
    end;
CALL postMedia('birdie', 'wow cutie', 'https://media.cnn.com/api/v1/images/stellar/prod/190414090035-01-cassowary.jpg?q=w_2930,h_1953,x_0,y_0,c_fill','https://www.youtube.com/watch?v=G-rsmbK7gdY','see this slay video');

CALL postMedia('birdie', 'wow cutie', 'https://media.cnn.com/api/v1/images/stellar/prod/190414090035-01-cassowary.jpg?q=w_2930,h_1953,x_0,y_0,c_fill','','')


CREATE PROCEDURE deleteMedia(IN p_id INT)
    BEGIN
        DELETE FROM media WHERE id=p_id;
    END;

CALL deleteMedia(6)

CREATE PROCEDURE updateMedia(
    IN p_id INT,
    IN p_title VARCHAR(256),
    IN p_link VARCHAR(256),
    IN p_linkDescription VARCHAR(200),
    IN p_description VARCHAR(500),
    IN p_img VARCHAR(256)
)
BEGIN
    UPDATE media
    SET title = p_title,
        link = p_link,
        linkDescription = p_linkDescription,
        description = p_description,
        img = p_img
    WHERE id = p_id;
END


CALL updateMedia(1,'bla','bla','bla','34','5');

INSERT INTO events (title, start, end) VALUES
    ('Early christmas lunch', '2023-11-01 08:00:00', '2023-11-01 17:00:00'),
    ('Yoga workshop', '2023-11-05 09:30:00', '2023-11-05 16:30:00'),
    ('Pooping day', '2023-11-15 10:00:00', '2023-11-15 18:00:00');

ALTER TABLE events
MODIFY COLUMN description VARCHAR(1000);

