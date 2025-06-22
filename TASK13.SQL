DROP TABLE IF EXISTS BU_Financials;

CREATE TABLE BU_Financials (
    bu_id VARCHAR(10),
    transaction_date DATE,
    cost_amount DECIMAL(18, 2),
    revenue_amount DECIMAL(18, 2)
);

INSERT INTO BU_Financials (bu_id, transaction_date, cost_amount, revenue_amount) VALUES
('BU_A', '2024-01-15', 10000.00, 15000.00),
('BU_A', '2024-01-20', 2000.00, 3000.00),
('BU_A', '2024-02-10', 8000.00, 12000.00),
('BU_B', '2024-01-05', 5000.00, 7000.00),
('BU_B', '2024-02-25', 6000.00, 9000.00),
('BU_A', '2024-02-18', 1000.00, 2000.00);

SELECT
    bu_id,
    FORMAT(transaction_date, 'yyyy-MM') AS financial_month,
    SUM(cost_amount) AS total_cost,
    SUM(revenue_amount) AS total_revenue
FROM
    BU_Financials
GROUP BY
    bu_id,
    FORMAT(transaction_date, 'yyyy-MM')
ORDER BY
    bu_id,
    financial_month;