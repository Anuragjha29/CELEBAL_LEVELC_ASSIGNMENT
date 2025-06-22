DROP TABLE IF EXISTS EmployeeCosts;

CREATE TABLE EmployeeCosts (
    employee_id INT,
    bu_id VARCHAR(10),
    cost_month DATE,
    monthly_cost DECIMAL(18, 2)
);

INSERT INTO EmployeeCosts (employee_id, bu_id, cost_month, monthly_cost) VALUES
(1, 'BU_X', '2024-01-01', 5000.00),
(2, 'BU_X', '2024-01-01', 6000.00),
(3, 'BU_Y', '2024-01-01', 7000.00),
(4, 'BU_X', '2024-02-01', 5500.00),
(5, 'BU_X', '2024-02-01', 6200.00),
(6, 'BU_Y', '2024-02-01', 7100.00),
(7, 'BU_X', '2024-01-01', 5800.00);

SELECT
    bu_id,
    FORMAT(cost_month, 'yyyy-MM') AS month_year,
    SUM(monthly_cost) AS total_monthly_cost,
    COUNT(employee_id) AS total_employees,
    CAST(SUM(monthly_cost) / COUNT(employee_id) AS DECIMAL(18, 2)) AS weighted_average_cost_per_employee
FROM
    EmployeeCosts
GROUP BY
    bu_id,
    FORMAT(cost_month, 'yyyy-MM')
ORDER BY
    bu_id,
    month_year;