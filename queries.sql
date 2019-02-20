-- Databases Assignment 3
-- Mitchell Northern
-- GitHub Link: https://github.com/sbunivedu/db-sql-social-MitchellNorthern

-- Query 1 --
-- Find the names of all students who are friends with someone named Gabriel.
SELECT hs.name
  FROM Highschooler hs
  JOIN Friend f
    ON hs.ID = f.ID1
  JOIN Highschooler hs2
    ON f.ID2 = hs2.ID
 WHERE hs2.name = 'Gabriel';
 
-- Query 2 --
-- Find all students who do not appear in the Likes table (as a student who likes or is liked) and return their names and grades.

   SELECT hs.name, hs.grade
     FROM Highschooler hs
LEFT JOIN Likes l
       ON hs.ID = l.ID1
LEFT JOIN Likes l2
       ON hs.ID = l2.ID2
    WHERE l.ID1 IS NULL
      AND l2.ID2 IS NULL;
      
-- Query 3 --
-- (*) Find the name and grade of all students who are liked by more than one other student.
  SELECT hs.name, hs.grade
    FROM Highschooler hs
    JOIN Likes l1
      ON hs.ID = l1.ID2
GROUP BY hs.name
  HAVING COUNT(*) >= 2;

-- Query 4 --
-- () For every student who likes someone 2 or more grades younger than themselves, 
-- return that student’s name and grade, and the name and grade of the student they like. 
-- Note that your conditions in the where clause can include any arithmetic expressions, e.g. (a-b > 10) AND (c < d2).

SELECT hs.name AS Student, hs.grade AS Grade, hs2.name AS "Liked Student's Name", hs2.grade AS "Liked Student's Grade"
  FROM Highschooler hs
  JOIN Likes l
    ON hs.ID = l.ID1
  JOIN Highschooler hs2
    ON l.ID2 = hs2.ID
 WHERE ABS(hs2.grade - hs.grade) >= 2;