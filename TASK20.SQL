DROP TABLE IF EXISTS SourceTable;
DROP TABLE IF EXISTS DestinationTable;

CREATE TABLE SourceTable (
    ID INT PRIMARY KEY,
    Value VARCHAR(50),
    DateCreated DATE
);

INSERT INTO SourceTable (ID, Value, DateCreated) VALUES
(1, 'Data A', '2024-01-01'),
(2, 'Data B', '2024-01-02'),
(3, 'Data C', '2024-01-03');

CREATE TABLE DestinationTable (
    ID INT PRIMARY KEY,
    Value VARCHAR(50),
    DateCreated DATE
);

INSERT INTO DestinationTable (ID, Value, DateCreated)
SELECT ID, Value, DateCreated FROM SourceTable;

SELECT * FROM DestinationTable;