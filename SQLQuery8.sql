CREATE DATABASE MOVIE

CREATE TABLE Movies (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL,
    ReleaseDate DATE NOT NULL,
    IMDB FLOAT NOT NULL
);

CREATE TABLE Actors (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL,
    Surname NVARCHAR(255) NOT NULL
);


CREATE TABLE Genres (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL
);


CREATE TABLE MovieActors (
    MovieId INT NOT NULL,
    ActorId INT NOT NULL,
    PRIMARY KEY (MovieId, ActorId),
    FOREIGN KEY (MovieId) REFERENCES Movies(Id),
    FOREIGN KEY (ActorId) REFERENCES Actors(Id)
);


CREATE TABLE MovieGenres (
    MovieId INT NOT NULL,
    GenreId INT NOT NULL,
    PRIMARY KEY (MovieId, GenreId),
    FOREIGN KEY (MovieId) REFERENCES Movies(Id),
    FOREIGN KEY (GenreId) REFERENCES Genres(Id)
);


INSERT INTO Movies (Name, ReleaseDate, IMDB)
VALUES
('Gladiator', '2000-01-01', 8.5),
('The Prestige', '2006-01-01', 8.5),
('The Usual Suspects', '1995-01-01', 8.5),
('Eternal Sunshine of the Spotless Mind', '2004-01-01', 8.3),
('La La Land', '2016-01-01', 8.0),
('The Social Network', '2010-01-01', 8.4),
('The Grand Budapest Hotel', '2014-01-01', 9.4),
('Mad Max: Fury Road', '2015-01-01', 9.7),
('Whiplash', '2014-01-01', 8.4),
('Avatar', '2009-01-01', 9.5);


INSERT INTO Actors (Name, Surname)
VALUES
('Russell', 'Crowe'),
('Christian', 'Bale'),
('Kevin ', 'Spacey'),
('Jim ', 'Carrey'),
('Ryan ', 'Gosling'),--hes literally me
('Jesse ', 'Eisenberg'),
('Ralph', 'Moss'),
('Tom', 'Hardy'),
('Hardy', 'Teller'),
('Sam ', 'Worthington');


INSERT INTO Genres (Name)
VALUES
('Action'),
('fantasy'),
('horror'),
('comedy');


INSERT INTO MovieActors (MovieId, ActorId)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 5),
(7, 1),
(8, 6),
(8, 7),
(8, 8),
(9, 6),
(10, 6);


INSERT INTO MovieGenres (MovieId, GenreId)
VALUES
(1, 2),
(1, 3),
(2, 1),
(2, 4),
(3, 2),
(3, 3),
(4, 2),
(4, 4),
(5, 1),
(5, 2),
(6, 1),
(6, 4),
(7, 2),
(7, 4),
(8, 1),
(8, 3),
(9, 1),
(10, 1);



SELECT TOP 10 A.Name, A.Surname, COUNT(MA.MovieId) AS RoleCount
FROM Actors A
JOIN MovieActors MA ON A.Id = MA.ActorId
GROUP BY A.Name, A.Surname
ORDER BY RoleCount DESC;

SELECT G.Name AS GenreName, COUNT(MG.MovieId) AS MovieCount
FROM Genres G
JOIN MovieGenres MG ON G.Id = MG.GenreId
GROUP BY G.Name;

SELECT Name, ReleaseDate
FROM Movies
WHERE ReleaseDate > GETDATE()
ORDER BY ReleaseDate;


SELECT AVG(IMDB) AS AverageIMDB
FROM Movies
WHERE ReleaseDate >= DATEADD(YEAR, -5, GETDATE());


SELECT A.Name, A.Surname, COUNT(MA.MovieId) AS MovieCount
FROM Actors A
JOIN MovieActors MA ON A.Id = MA.ActorId
GROUP BY A.Name, A.Surname
HAVING COUNT(MA.MovieId) > 1
ORDER BY MovieCount DESC;

