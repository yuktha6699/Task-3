-- Switch to your existing database
USE MyStudentDB_1;
GO

-- Drop the Students table if it already exists
IF OBJECT_ID('Students', 'U') IS NOT NULL
    DROP TABLE Students;
GO

-- Create a fresh Students table
CREATE TABLE Students (
    student_id     INT PRIMARY KEY,
    name           VARCHAR(50),
    math_score     INT,
    science_score  INT,
    english_score  INT
);
GO

-- Insert fresh data
INSERT INTO Students (student_id, name, math_score, science_score, english_score)
VALUES
(1, 'Asha',    88,  90,  86),
(2, 'Ben',     72,  65,  70),
(3, 'Chen',    95,  94,  92),
(4, 'Dia',     68,  80,  79),
(5, 'Evan',    91,  72,  85),
(6, 'Fara',    60,  67,  58),
(7, 'Gopi',    95,  88,  90),
(8, 'Hani',    83,  82,  89),
(9, 'Ivan',    77,  70,  72),
(10,'Jia',     69,  74,  71);
GO

-- Confirm the data
SELECT * FROM Students;
-- Task 1: Using subquery to calculate and sort total scores
SELECT TOP 5 *
FROM (
    SELECT 
        student_id,
        name,
        math_score,
        science_score,
        english_score,
        (math_score + science_score + english_score) AS total_score
    FROM Students
) AS total_scores
ORDER BY total_score DESC;
-- Task 2.1: Average scores where math_score > 70
SELECT 
    AVG(math_score) AS avg_math,
    AVG(science_score) AS avg_science,
    AVG(english_score) AS avg_english
FROM Students
WHERE math_score > 70;
-- Task 2.2: Use subquery to calculate and filter by total_score
SELECT 
    AVG(total_score) AS avg_total_score
FROM (
    SELECT 
        student_id,
        name,
        (math_score + science_score + english_score) AS total_score
    FROM Students
) AS score_data
WHERE total_score BETWEEN 200 AND 250;
-- Task 3: Find the second-highest math score using subquery
SELECT MAX(math_score) AS second_highest_math
FROM Students
WHERE math_score < (
    SELECT MAX(math_score)
    FROM Students
);

