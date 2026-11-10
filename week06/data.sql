USE sen307_11728;

INSERT INTO Department (dept_name) VALUES
('Software Engineering'),
('Computer Science'),
('Artificial Intelligence'),
('Data Science'),
('Cybersecurity');

INSERT INTO Course (course_code, course_title, credit_units, description, dept_id) VALUES
('SEN307', 'Database Systems', 3, 'Relational database design, SQL queries, normalization, transactions and indexing using MySQL.', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('SEN301', 'Software Architecture', 3, 'Architectural styles, design patterns, microservices and how to structure large software systems.', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('COS301', 'Operating Systems', 3, 'Processes, threads, CPU scheduling, memory management and file systems.', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('COS305', 'Computer Networks', 3, 'TCP/IP, routing, switching, LAN and WAN design and network protocols.', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('AIN301', 'Introduction to Artificial Intelligence', 3, 'Intelligent agents, search algorithms, knowledge representation and reasoning.', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN305', 'Machine Learning', 3, 'Supervised and unsupervised learning, neural networks, deep learning and model evaluation.', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN307', 'Natural Language Processing', 3, 'Text processing, word embeddings, language models, sentiment analysis and chatbots.', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('DTS301', 'Data Visualization and Analytics', 2, 'Exploratory data analysis, charts, dashboards and telling stories with data.', (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('DTS305', 'Big Data Technologies', 3, 'Distributed storage and processing of very large datasets with Hadoop and Spark.', (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('CYB301', 'Network Security', 3, 'Firewalls, cryptography, intrusion detection and protecting networks from attacks.', (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));

SELECT d.dept_name, COUNT(c.course_id) AS courses
FROM Department d LEFT JOIN Course c ON d.dept_id = c.dept_id
GROUP BY d.dept_name;

-- Part 2, Step 1: Lecturers
INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES
('VUA/ST/101', 'Dr Amaka Okafor', 'a.okafor@vua.edu.ng', 1),
('VUA/ST/102', 'Dr Musa Bello', 'm.bello@vua.edu.ng', 1),
('VUA/ST/103', 'Dr Chidi Nwankwo', 'c.nwankwo@vua.edu.ng', 2),
('VUA/ST/104', 'Mrs Hauwa Danjuma', 'h.danjuma@vua.edu.ng', 2),
('VUA/ST/105', 'Dr Femi Adeleke', 'f.adeleke@vua.edu.ng', 3),
('VUA/ST/106', 'Dr Ifeoma Chukwu', 'i.chukwu@vua.edu.ng', 3),
('VUA/ST/107', 'Mr Abubakar Sadiq', 'a.sadiq@vua.edu.ng', 4),
('VUA/ST/108', 'Dr Titilayo Ogunleye', 't.ogunleye@vua.edu.ng', 4),
('VUA/ST/109', 'Dr Emmanuel Ekong', 'e.ekong@vua.edu.ng', 5),
('VUA/ST/110', 'Mrs Aisha Mohammed', 'a.mohammed@vua.edu.ng', 5);

-- Step 2: Students (change the FIRST row to your own name and matric number)
INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id) VALUES
('11728', 'Danzoss Blessing Teyei', 'F', '2008-04-23', 1),
('20231235', 'John Musa', 'M', '2004-11-02', 2),
('20231236', 'Chiamaka Eze', 'F', '2005-07-21', 1),
('20231237', 'Ibrahim Yusuf', 'M', '2003-09-09', 3),
('20231238', 'Funke Adeyemi', 'F', '2006-01-30', 4),
('20231239', 'Chinedu Nwosu', 'M', '2004-05-17', 5),
('20231240', 'Zainab Abdullahi', 'F', '2005-12-03', 2),
('20231241', 'Tunde Bakare', 'M', '2003-02-25', 1),
('20231242', 'Ngozi Ibe', 'F', '2006-08-11', 3),
('20231243', 'Emeka Okonkwo', 'M', '2004-04-06', 4),
('20231244', 'Halima Sani', 'F', '2007-01-19', 5),
('20231245', 'Segun Ajayi', 'M', '2005-10-28', 1),
('20231246', 'Blessing Udoh', 'F', '2006-06-15', 2),
('20231247', 'Yakubu Garba', 'M', '2003-12-22', 3),
('20231248', 'Folake Balogun', 'F', '2004-08-08', 4),
('20231249', 'Kelechi Nnamdi', 'M', '2007-03-01', 5),
('20231250', 'Hauwa Lawal', 'F', '2005-05-05', 1),
('20231251', 'Oluwaseun Bright', 'M', '2006-11-12', 2),
('20231252', 'Mercy Effiong', 'F', '2004-02-14', 3),
('20231253', 'David Ogbu', 'M', '2005-09-30', 4);

-- Step 3: Enrolments (40)
INSERT INTO Enrolment (student_id, course_id) VALUES
(1,1),(1,2),(2,1),(2,3),(3,1),(3,2),(3,8),(4,5),(4,6),
(5,1),(5,8),(5,9),(6,10),(6,4),(7,3),(7,4),(8,1),(8,2),
(9,5),(9,7),(10,1),(10,9),(11,10),(11,4),(12,1),(12,2),(12,6),
(13,3),(13,4),(14,5),(14,6),(14,7),(15,8),(15,9),(16,10),(16,3),
(17,1),(17,2),(18,7),(18,6);

-- Course allocations (11)
INSERT INTO CourseAllocation (course_id, lecturer_id) VALUES
(1,1),(1,2),(2,2),(3,3),(4,4),(5,5),(6,6),(7,5),(8,7),(9,8),(10,9);

-- Make student 1 me
UPDATE Student SET matric_no = '11728' WHERE student_id = 1;

-- Part 3: UPDATE
SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '11728';
UPDATE Student SET dept_id = 2 WHERE matric_no = '11728';
SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '11728';

INSERT INTO Department (dept_name) VALUES ('Library and Information Science');
INSERT INTO Student (matric_no, full_name, dept_id)
VALUES ('20239999', 'Transfer Student',
(SELECT dept_id FROM Department WHERE dept_name = 'Library and Information Science'));

DELETE FROM Department WHERE dept_name = 'Library and Information Science';

UPDATE Student
SET dept_id = (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')
WHERE matric_no = '20239999';

DELETE FROM Department WHERE dept_name = 'Library and Information Science';

SELECT * FROM Department;

  SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
  UNION ALL SELECT 'Lecturers', COUNT(*) FROM Lecturer
  UNION ALL SELECT 'Students', COUNT(*) FROM Student
  UNION ALL SELECT 'Courses', COUNT(*) FROM Course
  UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment
  UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;