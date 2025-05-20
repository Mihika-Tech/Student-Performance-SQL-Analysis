CREATE TABLE student_performance (
    school TEXT,
    sex TEXT,
    age INT,
    address TEXT,
    famsize TEXT,
    pstatus TEXT,
    medu INT,
    fedu INT,
    mjob TEXT,
    fjob TEXT,
    reason TEXT,
    guardian TEXT,
    traveltime INT,
    studytime INT,
    failures INT,
    schoolsup BOOLEAN,
    famsup BOOLEAN,
    paid BOOLEAN,
    activities BOOLEAN,
    nursery BOOLEAN,
    higher BOOLEAN,
    internet BOOLEAN,
    romantic BOOLEAN,
    famrel INT,
    freetime INT,
    goout INT,
    dalc INT,
    walc INT,
    health INT,
    absences INT,
    g1 INT,
    g2 INT,
    g3 INT
);

SELECT * FROM student_performance
LIMIT 5;

SELECT studytime, ROUND(AVG(G3), 2)AS avg_grade
FROM student_performance
GROUP BY studytime
ORDER BY studytime;

SELECT
  CASE
    WHEN absences = 0 THEN '0'
    WHEN absences BETWEEN 1 AND 5 THEN '1-5'
    WHEN absences BETWEEN 6 AND 10 THEN '6-10'
    ELSE '10+'
  END AS absence_group,
  ROUND(AVG(g3), 2) AS avg_grade
FROM student_performance
GROUP BY absence_group
ORDER BY absence_group;

WITH study_fail AS (
    SELECT studytime, failures, AVG(g3) AS avg_grade
    FROM student_performance
    GROUP BY studytime, failures
)
SELECT * FROM study_fail
ORDER BY studytime, failures;

SELECT medu, fedu, ROUND(AVG(g3), 2) AS avg_grade
FROM student_performance
GROUP BY medu, fedu
ORDER BY medu, fedu;

SELECT sex, age, ROUND(AVG(g3), 2) AS avg_grade
FROM student_performance
GROUP BY sex, age
ORDER BY age;

SELECT romantic, ROUND(AVG(g3), 2) AS avg_grade
FROM student_performance
GROUP BY romantic;