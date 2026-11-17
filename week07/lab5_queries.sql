-- ============================================
-- VUA-SEN307 Lab 5: SELECT, Filtering and Joins
-- Name: Danzoss Blessing Teyei  Matric: 11728
-- ============================================
USE sen307_11728;

-- Recap: check that the Week 6 data is there
SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL SELECT 'Lecturers', COUNT(*) FROM Lecturer
UNION ALL SELECT 'Students', COUNT(*) FROM Student
UNION ALL SELECT 'Courses', COUNT(*) FROM Course
UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;

-- Task 1: Students in one department, sorted A-Z
SELECT s.student_id, s.full_name, d.dept_name
FROM Student s
INNER JOIN Department d ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Software Engineering'
ORDER BY s.full_name ASC;
-- Explanation: Joins Student to Department on dept_id, keeps only Software
-- Engineering students, and sorts them alphabetically by full name.

-- Task 2: Courses with their lecturers (INNER JOIN)
SELECT c.course_title, l.full_name AS lecturer
FROM Course c
INNER JOIN CourseAllocation ca ON c.course_id = ca.course_id
INNER JOIN Lecturer l ON ca.lecturer_id = l.lecturer_id
ORDER BY c.course_title;
-- Explanation: Course and Lecturer are linked only through CourseAllocation,
-- so two INNER JOINs are needed. Only courses with an allocated lecturer
-- appear, and a course with two lecturers appears twice.

-- Task 3: Students and their courses (LEFT JOIN)
SELECT s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
ORDER BY s.full_name;
-- Explanation: LEFT JOIN keeps every student. Students with no enrolments
-- get NULL in course_title.

-- Task 3b: only students with no courses
SELECT s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
WHERE c.course_title IS NULL
ORDER BY s.full_name;
-- Explanation: Filtering on IS NULL leaves only students with no match in
-- Enrolment, i.e. the two students created in Week 6.

-- Task 4: Filtering with AND / OR / IN / BETWEEN
SELECT s.student_id, s.full_name, s.gender, d.dept_name, s.date_of_birth
FROM Student s
INNER JOIN Department d ON s.dept_id = d.dept_id
WHERE s.gender = 'F'
  AND d.dept_name IN ('Software Engineering', 'Artificial Intelligence')
  AND s.date_of_birth BETWEEN '2004-01-01' AND '2005-12-31'
ORDER BY s.full_name;
-- Explanation: Uses AND, IN and BETWEEN together: female students in
-- Software Engineering or Artificial Intelligence, born 2004-01-01 to
-- 2005-12-31 (BETWEEN is inclusive of both dates).

-- Task 5: Paginating enrolments, 10 at a time
-- Page 1 (rows 1-10)
SELECT * FROM Enrolment ORDER BY enrolment_id LIMIT 10 OFFSET 0;
-- Page 2 (rows 11-20)
SELECT * FROM Enrolment ORDER BY enrolment_id LIMIT 10 OFFSET 10;
-- Explanation: LIMIT sets the page size, OFFSET skips earlier rows.
-- ORDER BY is essential because without it SQL does not guarantee row order,
-- so pages could overlap or miss rows.

-- Challenge: Task 3 rewritten with RIGHT JOIN
SELECT s.full_name, c.course_title
FROM Course c
RIGHT JOIN Enrolment e ON c.course_id = e.course_id
RIGHT JOIN Student s ON e.student_id = s.student_id
ORDER BY s.full_name;
-- Explanation: Same result as Task 3, with the table order reversed so
-- Student is on the right. The LEFT JOIN version is easier to read because
-- it starts from the main table (Student) and reads left to right.
