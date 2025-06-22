DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Friends;
DROP TABLE IF EXISTS Packages;

CREATE TABLE Students (
    ID INT PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO Students (ID, Name) VALUES
(1, 'Ashley'),
(2, 'Samantha'),
(3, 'Julia'),
(4, 'Scarlet');

CREATE TABLE Friends (
    ID INT PRIMARY KEY,
    Friend_ID INT
);

INSERT INTO Friends (ID, Friend_ID) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 1);

CREATE TABLE Packages (
    ID INT PRIMARY KEY,
    Salary DECIMAL(10, 2)
);

INSERT INTO Packages (ID, Salary) VALUES
(1, 15.20),
(2, 10.06),
(3, 11.55),
(4, 12.12);

SELECT
    S.Name
FROM
    Students AS S
JOIN
    Friends AS F ON S.ID = F.ID
JOIN
    Packages AS P_Self ON S.ID = P_Self.ID
JOIN
    Packages AS P_Friend ON F.Friend_ID = P_Friend.ID
WHERE
    P_Friend.Salary > P_Self.Salary
ORDER BY
    P_Friend.Salary ASC;