CREATE DATABASE yogaDB;

use yogaDB;

-- Creating tables
CREATE TABLE events (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(256) NOT NULL,
    description VARCHAR(480),
    start DATETIME NOT NULL,
    end DATETIME NOT NULL,
    image VARCHAR(1000)
);

CREATE TABLE users (
     id INT AUTO_INCREMENT PRIMARY KEY,
     firstName varchar(256) NOT NULL,
     lastName varchar(256) NOT NULL,
     memberStatus bool,
     email varchar(256)
);

INSERT INTO events (title, description, start, end, image)
VALUES
('Yoga Workshop 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam gravida turpis quis ipsum convallis, vel fermentum augue consectetur. In hac habitasse platea dictumst. Ut facilisis quam sit amet risus aliquet, a ultricies sapien convallis. Sed eu vestibulum justo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce vel est vitae est venenatis gravida vel id justo.', '2023-11-15 09:30:00', '2023-11-15 12:00:00', 'https://upload.wikimedia.org/wikipedia/commons/7/78/Mr-yoga-yogananda_2.jpg'),
('Yoga Retreat 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam gravida turpis quis ipsum convallis, vel fermentum augue consectetur. In hac habitasse platea dictumst. Ut facilisis quam sit amet risus aliquet, a ultricies sapien convallis. Sed eu vestibulum justo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce vel est vitae est venenatis gravida vel id justo.', '2023-12-03 10:30:00', '2023-12-03 13:00:00', 'https://upload.wikimedia.org/wikipedia/commons/7/78/Mr-yoga-yogananda_2.jpg'),
('Yoga Class 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam gravida turpis quis ipsum convallis, vel fermentum augue consectetur. In hac habitasse platea dictumst. Ut facilisis quam sit amet risus aliquet, a ultricies sapien convallis. Sed eu vestibulum justo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce vel est vitae est venenatis gravida vel id justo.', '2023-12-20 11:30:00', '2023-12-20 14:00:00', 'https://upload.wikimedia.org/wikipedia/commons/7/78/Mr-yoga-yogananda_2.jpg'),
('Yoga Workshop 2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam gravida turpis quis ipsum convallis, vel fermentum augue consectetur. In hac habitasse platea dictumst. Ut facilisis quam sit amet risus aliquet, a ultricies sapien convallis. Sed eu vestibulum justo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce vel est vitae est venenatis gravida vel id justo.', '2024-01-05 14:30:00', '2024-01-05 17:00:00', 'https://upload.wikimedia.org/wikipedia/commons/7/78/Mr-yoga-yogananda_2.jpg'),
('Yoga Retreat 2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam gravida turpis quis ipsum convallis, vel fermentum augue consectetur. In hac habitasse platea dictumst. Ut facilisis quam sit amet risus aliquet, a ultricies sapien convallis. Sed eu vestibulum justo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce vel est vitae est venenatis gravida vel id justo.', '2024-01-21 15:30:00', '2024-01-21 18:00:00', 'https://upload.wikimedia.org/wikipedia/commons/7/78/Mr-yoga-yogananda_2.jpg'),
('Yoga Class 2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam gravida turpis quis ipsum convallis, vel fermentum augue consectetur. In hac habitasse platea dictumst. Ut facilisis quam sit amet risus aliquet, a ultricies sapien convallis. Sed eu vestibulum justo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce vel est vitae est venenatis gravida vel id justo.', '2024-02-10 16:30:00', '2024-02-10 19:00:00', 'https://upload.wikimedia.org/wikipedia/commons/7/78/Mr-yoga-yogananda_2.jpg'),
('Yoga Workshop 3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam gravida turpis quis ipsum convallis, vel fermentum augue consectetur. In hac habitasse platea dictumst. Ut facilisis quam sit amet risus aliquet, a ultricies sapien convallis. Sed eu vestibulum justo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce vel est vitae est venenatis gravida vel id justo.', '2024-02-26 17:30:00', '2024-02-26 20:00:00', 'https://upload.wikimedia.org/wikipedia/commons/7/78/Mr-yoga-yogananda_2.jpg'),
('Yoga Retreat 3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam gravida turpis quis ipsum convallis, vel fermentum augue consectetur. In hac habitasse platea dictumst. Ut facilisis quam sit amet risus aliquet, a ultricies sapien convallis. Sed eu vestibulum justo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce vel est vitae est venenatis gravida vel id justo.', '2024-03-15 18:30:00', '2024-03-15 21:00:00', 'https://upload.wikimedia.org/wikipedia/commons/7/78/Mr-yoga-yogananda_2.jpg'),
('Yoga Class 3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam gravida turpis quis ipsum convallis, vel fermentum augue consectetur. In hac habitasse platea dictumst. Ut facilisis quam sit amet risus aliquet, a ultricies sapien convallis. Sed eu vestibulum justo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce vel est vitae est venenatis gravida vel id justo.', '2024-04-01 19:30:00', '2024-04-01 22:00:00', 'https://upload.wikimedia.org/wikipedia/commons/7/78/Mr-yoga-yogananda_2.jpg'),
('Yoga Workshop 4', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam gravida turpis quis ipsum convallis, vel fermentum augue consectetur. In hac habitasse platea dictumst. Ut facilisis quam sit amet risus aliquet, a ultricies sapien convallis. Sed eu vestibulum justo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce vel est vitae est venenatis gravida vel id justo.', '2024-04-16 20:30:00', '2024-04-16 23:00:00', 'https://upload.wikimedia.org/wikipedia/commons/7/78/Mr-yoga-yogananda_2.jpg');


-- Inserting users into the users table
INSERT INTO users (firstName, lastName, memberStatus, email) VALUES
    ( 'John', 'Doe', true, 'john.doe@example.com'),
    ( 'Jane', 'Smith', false,  'jane.smith@example.com'),
    ( 'Alice', 'Johnson', true, 'alice.johnson@example.com'),
    ( 'Bob', 'Williams', true, 'bob.williams@example.com'),
    ( 'Eva', 'Anderson', false,  'eva.anderson@example.com'),
    ( 'Charlie', 'Brown', true,  'charlie.brown@example.com'),
    ( 'Grace', 'Miller', false,  'grace.miller@example.com'),
    ( 'David', 'Taylor', true,  'david.taylor@example.com'),
    ( 'Sophie', 'Clark', false, 'sophie.clark@example.com'),
    ( 'Michael', 'Jones', true,  'michael.jones@example.com'),
    ( 'Olivia', 'Davis', true,  'olivia.davis@example.com'),
    ( 'Henry', 'Moore', false,  'henry.moore@example.com');

CREATE PROCEDURE getEvents()
    BEGIN
        SELECT * FROM events;
    end;

CREATE PROCEDURE getEventsByTitle(variable varchar(256))
    BEGIN
        SELECT * FROM events
        WHERE title LIKE CONCAT("%",variable,"%");
    END;

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

CREATE PROCEDURE postEvent(
    title varchar(256),
    description varchar(256),
    start DATETIME,
    end DATETIME,
    image varchar(1000),
    linkUrl varchar(1000)
)
BEGIN
    INSERT INTO events (title, description, start, end, image, linkUrl)
    VALUES (title, description, start, end, image, linkUrl);
END;

CREATE PROCEDURE getUsers()
BEGIN
    SELECT * FROM users;
end;

CREATE PROCEDURE getUsers()
BEGIN
    SELECT * FROM users;
end;

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

CREATE PROCEDURE promoteToMember(var_id int)
BEGIN
    UPDATE users
        SET memberStatus= 1
    WHERE id = var_id;
end;

CREATE PROCEDURE demoteToGuest(var_id int)
BEGIN
    UPDATE users
    SET memberStatus= 0
    WHERE id = var_id;
end;

CREATE PROCEDURE getUsersByActivityLevel()
    BEGIN
        SELECT *
        FROM users
        ORDER BY
            CASE
                WHEN activityLevel = 'High' THEN 1
                WHEN activityLevel = 'Medium' THEN 2
                WHEN activityLevel = 'Low' THEN 3
                ELSE 4
                END;

    END;

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

CREATE TABLE media(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(256) NOT NULL,
    description VARCHAR(500) NOT NULL,
    img VARCHAR(256) NOT NULL,
    link VARCHAR(256) NOT NULL,
    linkDescription VARCHAR(256) NOT NULL
);

INSERT INTO media (title, description, img, link,linkDescription) VALUES
    ('Cold yoga', 'A video about yoga', 'https://astanga.dk/wp-content/uploads/2018/08/22789147_1471696416246073_7185749654797409954_n.jpg','https://youtu.be/ke9XLlSvbjk?feature=shared', 'Click to see'),
    ('Astanga', 'An article about yoga', 'https://live.staticflickr.com/8071/29438001551_8c902c8f14_b.jpg','https://youtu.be/ke9XLlSvbjk?feature=shared','Click to see'),
    ('Hot yoga', 'Some content about hot yoga', 'https://upload.wikimedia.org/wikipedia/commons/b/b2/Mr-yoga-headstand-5-6.jpg','https://youtu.be/ke9XLlSvbjk?feature=shared','Click to see');

CREATE PROCEDURE getMedia()
    BEGIN
        SELECT * FROM media;
    end;

CREATE PROCEDURE postMedia(title varchar(256), description varchar(500), img varchar(256),link varchar(256), linkDescription VARCHAR(200))
    BEGIN
        IF link = '' THEN SET link = NULL; END IF;
        IF linkDescription = '' THEN SET linkDescription = NULL; END IF;
        INSERT INTO media (title,description, img, link,linkDescription) VALUES
           (title,description, img,link,linkDescription);
    end;

CREATE PROCEDURE deleteMedia(IN p_id INT)
    BEGIN
        DELETE FROM media WHERE id=p_id;
    END;

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
END;

CREATE PROCEDURE postUser(firstName VARCHAR(256),lastName VARCHAR(256), email VARCHAR(256))
    BEGIN
        INSERT INTO users (firstName, lastName,email,memberStatus) VALUES
           (firstName, lastName,email,0);
    END;

CREATE TABLE admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

INSERT INTO admin (username, password) VALUES ('Marcela', 'admin123');

CREATE PROCEDURE deleteUser(IN p_id INT)
    BEGIN
        DELETE FROM users WHERE users.id=p_id;
    END;

ALTER TABLE events
ADD COLUMN linkUrl VARCHAR(500)