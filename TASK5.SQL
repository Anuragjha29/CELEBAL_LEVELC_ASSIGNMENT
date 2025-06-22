DROP TABLE IF EXISTS Hackers;
DROP TABLE IF EXISTS Submissions;

CREATE TABLE Hackers (
    hacker_id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO Hackers (hacker_id, name) VALUES
(15758, 'Rose'),
(20703, 'Angela'),
(26396, 'Frank'),
(36289, 'Patrick'),
(44085, 'Lisa'),
(53473, 'Kimberly'),
(62509, 'Bonnie'),
(79722, 'Michael');

CREATE TABLE Submissions (
    submission_date DATE,
    submission_id INT PRIMARY KEY,
    hacker_id INT,
    score INT
);

INSERT INTO Submissions (submission_date, submission_id, hacker_id, score) VALUES
('2016-03-01', 8434, 20703, 0),
('2016-03-01', 22492, 53473, 19),
('2016-03-01', 29040, 79722, 88),
('2016-03-01', 80173, 36289, 70),
('2016-03-02', 34528, 20703, 0),
('2016-03-02', 36742, 15758, 60),
('2016-03-02', 42792, 79722, 89),
('2016-03-02', 44264, 79722, 90),
('2016-03-03', 48442, 20703, 0),
('2016-03-03', 46002, 36289, 70),
('2016-03-03', 50773, 79722, 0),
('2016-03-04', 20084, 20703, 0),
('2016-03-04', 31392, 44085, 90),
('2016-03-04', 54104, 53473, 95),
('2016-03-04', 81323, 79722, 45),
('2016-03-05', 72552, 20703, 0),
('2016-03-05', 74548, 36289, 0),
('2016-03-06', 79487, 67579, 0),
('2016-03-06', 82428, 36289, 10),
('2016-03-06', 90008, 54286, 40),
('2016-03-06', 90401, 20703, 0);


WITH DailySubmissions AS (
    SELECT
        s.submission_date,
        s.hacker_id,
        COUNT(s.submission_id) AS submission_count
    FROM
        Submissions AS s
    WHERE
        s.submission_date >= '2016-03-01' AND s.submission_date <= '2016-03-15'
    GROUP BY
        s.submission_date, s.hacker_id
),
RankedSubmissions AS (
    SELECT
        ds.submission_date,
        ds.hacker_id,
        ds.submission_count,
        RANK() OVER (PARTITION BY ds.submission_date ORDER BY ds.submission_count DESC, ds.hacker_id ASC) AS rnk
    FROM
        DailySubmissions AS ds
),
DailyUniqueHackers AS (
    SELECT
        submission_date,
        COUNT(DISTINCT hacker_id) AS unique_hacker_count
    FROM
        Submissions
    WHERE
        submission_date >= '2016-03-01' AND submission_date <= '2016-03-15'
    GROUP BY
        submission_date
)
SELECT
    duh.submission_date,
    duh.unique_hacker_count,
    h.hacker_id,
    h.name
FROM
    DailyUniqueHackers AS duh
JOIN
    RankedSubmissions AS rs ON duh.submission_date = rs.submission_date
JOIN
    Hackers AS h ON rs.hacker_id = h.hacker_id
WHERE
    rs.rnk = 1
ORDER BY
    duh.submission_date ASC;