CREATE DATABASE Shop

USE Shop

CREATE TABLE Sellers(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(50),
Surname NVARCHAR(50),
City NVARCHAR(50)
)

CREATE TABLE Customers(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(50),
Surname NVARCHAR(50),
City NVARCHAR(50)
)

CREATE TABLE Orders(
Id INT PRIMARY KEY IDENTITY,
OrderDate DATETIME NOT NULL,
Amount DECIMAL NOT NULL,
State BIT NOT NULL,
CustomerID INT FOREIGN KEY REFERENCES Customers(Id),
SellerID INT FOREIGN KEY REFERENCES Sellers(Id)
)

INSERT INTO Sellers (Name, Surname, City)
VALUES 
('John', 'Doe', 'New York'),
('Jane', 'Smith', 'Los Angeles'),
('Michael', 'Brown', 'Chicago'),
('Emily', 'Davis', 'Houston');


INSERT INTO Customers (Name, Surname, City)
VALUES 
('Elchin', 'Jabbarov', 'London'),
('Aygun', 'Mammadova', 'Paris'),
('Nijat', 'Aliyev', 'Tokyo'),
('Aysel', 'Quliyeva', 'Sydney');


INSERT INTO Orders (OrderDate, Amount, State, CustomerID, SellerID)
VALUES 
('2023-010-01 21:00:00', 100.00, 1, 1, 1),
('2023-07-01 23:00:00', 600.00, 0, 2, 2),
('2023-09-01 17:00:00', 400.00, 1, 3, 1)

SELECT SUM(Amount), Name FROM ORDERS 
JOIN Customers ON Customers.Id = Orders.CustomerID 
GROUP BY CustomerID, Name
HAVING SUM(Amount)>1000

SELECT * FROM Sellers
JOIN Customers ON Sellers.City= Customers.City

SELECT * FROM Orders
WHERE OrderDate BETWEEN 2024-01-10 AND GETDATE()

SELECT COUNT(SellerID), Name FROM Orders
JOIN Sellers ON Orders.SellerID = Sellers.Id
GROUP BY SellerID,Name
HAVING COUNT(CustomerID) > 10

SELECT COUNT(CustomerID), Name FROM ORDERS 
JOIN Customers ON Customers.Id = Orders.CustomerID 
GROUP BY CustomerID, Name 
ORDER BY COUNT(CustomerID) DESC

SELECT ORDERS.OrderDate
FROM ORDERS 
JOIN Sellers  ON ORDERS.SellerID = Sellers.Id
WHERE ORDERS.State = 0
ORDER BY ORDERS.OrderDate;


SELECT *
FROM Orders
WHERE State = 1
  AND OrderDate BETWEEN DATEADD(MONTH, -1, GETDATE()) AND GETDATE();


