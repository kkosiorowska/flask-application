DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id integer primary key autoincrement,
    name text not null,
    surname text not null
);

INSERT INTO users (id, name, surname)
VALUES (null, 'Maria', 'Kowalska');
INSERT into users (id, name, surname)
VALUES (null, 'Kacper', 'Nowak');
INSERT into users (id, name, surname)
VALUES (null, 'Eliza', 'Ptak');

DROP TABLE IF EXISTS movies;
CREATE TABLE movies (
    id integer primary key autoincrement,
    title text not null
);

INSERT INTO movies (id, title)
VALUES (null, 'Kiler');
INSERT INTO movies (id, title)
VALUES (null, 'Chlopaki nie placza');
INSERT INTO movies (id, title)
VALUES (null, 'Mis');

DROP TABLE IF EXISTS seans;
CREATE TABLE seans (
    id integer primary key autoincrement,
    date text not null,
    allocation integer not null,
    moviesId integer not null,
    FOREIGN KEY(moviesId) REFERENCES movies(id)
);


INSERT INTO seans (id, date, allocation, moviesId)
VALUES (null, '2019-05-24 20:30', 20, 1);
INSERT INTO seans (id, date, allocation, moviesId)
VALUES (null, '2019-05-22 16:40', 30, 2);

DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
    id integer primary key autoincrement,
    seansId integer not null,
    FOREIGN KEY(seansId) REFERENCES seans(id)
);

INSERT INTO groups (id, seansId)
VALUES (null, 1);
INSERT INTO groups (id, seansId)
VALUES (null, 2);

DROP TABLE IF EXISTS participants;
CREATE TABLE participants (
    id integer primary key autoincrement,
    groupsId integer not null,
    usersId integer not null,
    active boolean not null,
    FOREIGN KEY(groupsId) REFERENCES groups(id),
    FOREIGN KEY(usersId) REFERENCES users(id)
);

INSERT INTO participants (id, groupsId, usersId, active)
VALUES (null, 1, 1, 1);
INSERT INTO participants (id, groupsId, usersId, active)
VALUES (null, 1, 2, 0);

