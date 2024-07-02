CREATE DATABASE DemoApp
CREATE TABLE People(
Id INT PRIMARY KEY IDENTITY(1,1),
Name NVARCHAR(50) NOT NULL,
SurName NVARCHAR(50) NOT NULL,
PhoneNumber NVARCHAR(50) NOT NULL UNIQUE,
Email NVARCHAR(50) NOT NULL UNIQUE,
BirthDate DATE NOT NULL,
HasCitizenShip BIT,
Gender BIT,
CityId INT FOREIGN KEY REFERENCES Cities(Id)
)



CREATE TABLE Countries(
Id INT PRIMARY KEY IDENTITY(1,1),
Name NVARCHAR(50) NOT NULL,
Area DECIMAL
)

CREATE TABLE Cities(
Id INT PRIMARY KEY IDENTITY(1,1),
Name NVARCHAR(50) NOT NULL,
Area DECIMAL,
CountryId INT FOREIGN KEY REFERENCES Countries(Id)
)


SELECT People.Name, People.Surname, Cities.Name AS 'City Name', Countries.Name AS 'Country Name' FROM People
INNER JOIN Cities ON CityId = Cities.Id
INNER JOIN Countries ON CountryId = Countries.Id

INSERT INTO Countries
VALUES 
('Azerbaijan',2619539),
('Turkey', 56583025),
('Italy', 69335294)

INSERT INTO Cities
VALUES
('Baku', 7294, 1),
('Istanbul', 91835,2),
('ankara', 56748,2),
('Rome', 5427368,3)


INSERT INTO People
VALUES
('Oktay','Babayev', '994517274898', 'oktaybabayev223@gmail.com', '2006-08-04',1, 0, 1),
('frtgy','rygvceyi', '994564738','unxwi', '2000-01-01', 0, 1, 2),
('vbcnzs', 'ksijedu', '9941111111', 'woskwddw', '2000-01-01', 1 , 1 , 3)



SELECT * FROM Countries
ORDER BY Area 

SELECT * FROM Cities
ORDER BY Name DESC


SELECT COUNT(Area) FROM Countries WHERE Area>200000

SELECT MAX(Area) FROM Countries WHERE Name = 'i%'

SELECT Name FROM Countries
UNION
SELECT Name FROM Cities

SELECT Cities.Name, COUNT(People.Id) AS 'Count of People' FROM People
JOIN Cities ON People.CityId = Cities.Id
GROUP BY Cities.Name
HAVING COUNT(People.Id)>5000
