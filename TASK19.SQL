DROP TABLE IF EXISTS EMPLOYEES;

CREATE TABLE EMPLOYEES (
    employee_id INT PRIMARY KEY,
    salary DECIMAL(18, 2)
);

INSERT INTO EMPLOYEES (employee_id, salary) VALUES
(1, 1000.50),
(2, 2050.00),
(3, 3000.75),
(4, 4500.00),
(5, 500.00),
(6, 6000.00),
(7, 7890.10);

WITH SalaryCalculations AS (
    SELECT
        AVG(salary) AS Actual_Avg_Salary,
        AVG(CAST(REPLACE(CAST(salary AS VARCHAR(MAX)), '0', '') AS DECIMAL(18, 2))) AS Miscalculated_Avg_Salary
    FROM
        EMPLOYEES
)
SELECT
    CEILING(ABS(sc.Miscalculated_Avg_Salary - sc.Actual_Avg_Salary))
FROM
    SalaryCalculations AS sc;