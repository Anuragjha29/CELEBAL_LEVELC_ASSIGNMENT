DROP TABLE IF EXISTS Employees_Details;

CREATE TABLE Employees_Details (
    employee_id INT PRIMARY KEY,
    sub_band VARCHAR(50)
);

INSERT INTO Employees_Details (employee_id, sub_band) VALUES
(1, 'Junior Analyst'),
(2, 'Senior Analyst'),
(3, 'Junior Analyst'),
(4, 'Manager'),
(5, 'Senior Analyst'),
(6, 'Junior Analyst'),
(7, 'Manager');

SELECT
    sub_band,
    COUNT(employee_id) AS headcount,
    CAST(COUNT(employee_id) * 100.0 / SUM(COUNT(employee_id)) OVER () AS DECIMAL(10, 2)) AS percentage_headcount
FROM
    Employees_Details
GROUP BY
    sub_band
ORDER BY
    sub_band;