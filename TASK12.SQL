DROP TABLE IF EXISTS JobCosts;

CREATE TABLE JobCosts (
    job_family_id VARCHAR(50),
    country VARCHAR(50),
    cost DECIMAL(18, 2)
);

INSERT INTO JobCosts (job_family_id, country, cost) VALUES
('Engineering', 'India', 100000.00),
('Engineering', 'USA', 200000.00),
('Engineering', 'UK', 150000.00),
('HR', 'India', 50000.00),
('HR', 'Germany', 75000.00),
('Sales', 'India', 120000.00),
('Sales', 'Japan', 90000.00),
('Sales', 'France', 110000.00);

WITH JobFamilyCosts AS (
    SELECT
        job_family_id,
        SUM(CASE WHEN country = 'India' THEN cost ELSE 0 END) AS India_Cost,
        SUM(CASE WHEN country <> 'India' THEN cost ELSE 0 END) AS International_Cost,
        SUM(cost) AS Total_Global_Cost
    FROM
        JobCosts
    GROUP BY
        job_family_id
)
SELECT
    jfc.job_family_id,
    ISNULL(ROUND((jfc.India_Cost / NULLIF(jfc.Total_Global_Cost, 0)) * 100, 2), 0.00) AS India_Percentage,
    ISNULL(ROUND((jfc.International_Cost / NULLIF(jfc.Total_Global_Cost, 0)) * 100, 2), 0.00) AS International_Percentage
FROM
    JobFamilyCosts AS jfc
ORDER BY
    jfc.job_family_id;