
DROP TABLE IF EXISTS STATION;


CREATE TABLE STATION (
    ID INT PRIMARY KEY,
    CITY VARCHAR(21),
    STATE VARCHAR(2),
    LAT_N NUMERIC(10, 4), 
    LONG_W NUMERIC(10, 4)
);


INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES
(1, 'Agra', 'UP', 27.1751, 78.0421),
(2, 'Delhi', 'DL', 28.7041, 77.1025),
(3, 'Mumbai', 'MH', 19.0760, 72.8777),
(4, 'Chennai', 'TN', 13.0827, 80.2707),
(5, 'Kolkata', 'WB', 22.5726, 88.3639),
(6, 'Bengaluru', 'KA', 12.9716, 77.5946),
(7, 'Hyderabad', 'TS', 17.3850, 78.4867),
(8, 'Jaipur', 'RJ', 26.9124, 75.7873),
(9, 'Lucknow', 'UP', 26.8467, 80.9462),
(10, 'Pune', 'MH', 18.5204, 73.8567),
(11, 'Kanpur', 'UP', 26.4499, 80.3319),
(12, 'Nagpur', 'MH', 21.1458, 79.0882),
(13, 'Amritsar', 'PB', 31.6340, 74.8738),
(14, 'Surat', 'GJ', 21.1702, 72.8311),
(15, 'Bhopal', 'MP', 23.2599, 77.4126),
(16, 'Indore', 'MP', 22.7196, 75.8577);


SELECT
    ROUND(
        ABS(MIN(LAT_N) - MAX(LAT_N)) +
        ABS(MIN(LONG_W) - MAX(LONG_W)),
    4)
FROM
    STATION;