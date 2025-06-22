DROP TABLE IF EXISTS Company;
DROP TABLE IF EXISTS Lead_Manager;
DROP TABLE IF EXISTS Senior_Manager;
DROP TABLE IF EXISTS Manager;
DROP TABLE IF EXISTS Employee;

CREATE TABLE Company (
    company_code VARCHAR(10) PRIMARY KEY,
    founder VARCHAR(50)
);

INSERT INTO Company (company_code, founder) VALUES
('C1', 'Monika'),
('C2', 'Samantha');

CREATE TABLE Lead_Manager (
    lead_manager_code VARCHAR(10) PRIMARY KEY,
    company_code VARCHAR(10)
);

INSERT INTO Lead_Manager (lead_manager_code, company_code) VALUES
('LM1', 'C1'),
('LM2', 'C2');

CREATE TABLE Senior_Manager (
    senior_manager_code VARCHAR(10) PRIMARY KEY,
    lead_manager_code VARCHAR(10),
    company_code VARCHAR(10)
);

INSERT INTO Senior_Manager (senior_manager_code, lead_manager_code, company_code) VALUES
('SM1', 'LM1', 'C1'),
('SM2', 'LM1', 'C1'),
('SM3', 'LM2', 'C2');

CREATE TABLE Manager (
    manager_code VARCHAR(10) PRIMARY KEY,
    senior_manager_code VARCHAR(10),
    lead_manager_code VARCHAR(10),
    company_code VARCHAR(10)
);

INSERT INTO Manager (manager_code, senior_manager_code, lead_manager_code, company_code) VALUES
('M1', 'SM1', 'LM1', 'C1'),
('M2', 'SM3', 'LM2', 'C2'),
('M3', 'SM3', 'LM2', 'C2');

CREATE TABLE Employee (
    employee_code VARCHAR(10) PRIMARY KEY,
    manager_code VARCHAR(10),
    senior_manager_code VARCHAR(10),
    lead_manager_code VARCHAR(10),
    company_code VARCHAR(10)
);

INSERT INTO Employee (employee_code, manager_code, senior_manager_code, lead_manager_code, company_code) VALUES
('E1', 'M1', 'SM1', 'LM1', 'C1'),
('E2', 'M1', 'SM1', 'LM1', 'C1'),
('E3', 'M2', 'SM3', 'LM2', 'C2'),
('E4', 'M3', 'SM3', 'LM2', 'C2');


SELECT
    C.company_code,
    C.founder,
    COUNT(DISTINCT LM.lead_manager_code),
    COUNT(DISTINCT SM.senior_manager_code),
    COUNT(DISTINCT M.manager_code),
    COUNT(DISTINCT E.employee_code)
FROM
    Company AS C
LEFT JOIN
    Lead_Manager AS LM ON C.company_code = LM.company_code
LEFT JOIN
    Senior_Manager AS SM ON C.company_code = SM.company_code
LEFT JOIN
    Manager AS M ON C.company_code = M.company_code
LEFT JOIN
    Employee AS E ON C.company_code = E.company_code
GROUP BY
    C.company_code, C.founder
ORDER BY
    C.company_code;