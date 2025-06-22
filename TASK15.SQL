DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO Employees (employee_id, name, salary) VALUES
(101, 'Alice', 75000.00),
(102, 'Bob', 90000.00),
(103, 'Charlie', 80000.00),
(104, 'David', 95000.00),
(105, 'Eve', 70000.00),
(106, 'Frank', 100000.00),
(107, 'Grace', 85000.00);

SELECT TOP 5
    employee_id,
    name,
    salary
FROM
    Employees
ORDER BY
    salary DESC;