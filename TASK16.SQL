DROP TABLE IF EXISTS MyTable;

CREATE TABLE MyTable (
    ID INT PRIMARY KEY,
    ColA INT,
    ColB INT
);

INSERT INTO MyTable (ID, ColA, ColB) VALUES
(1, 10, 20);

UPDATE MyTable
SET
    ColA = ColA + ColB,
    ColB = ColA - ColB,
    ColA = ColA - ColB
WHERE
    ID = 1;

SELECT * FROM MyTable;