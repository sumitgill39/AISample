-- =====================================================
-- Simple Student Database - Just what you need!
-- =====================================================

CREATE DATABASE IF NOT EXISTS student_ai_db;
USE student_ai_db;

-- Drop existing tables
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS student_marks;

-- =====================================================
-- TABLE 1: STUDENTS (Basic Info)
-- =====================================================

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    age INT,
    gender ENUM('Male', 'Female') NOT NULL,
    study_hours_per_week INT,
    attendance_percentage DECIMAL(5,2)
);

-- =====================================================
-- TABLE 2: STUDENT_MARKS (All subject marks in one table)
-- =====================================================

CREATE TABLE student_marks (
    mark_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    mathematics DECIMAL(5,2),
    physics DECIMAL(5,2),
    chemistry DECIMAL(5,2),
    biology DECIMAL(5,2),
    english DECIMAL(5,2),
    history DECIMAL(5,2),
    geography DECIMAL(5,2),
    computer_science DECIMAL(5,2),
    semester VARCHAR(20),
    year INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- =====================================================
-- INSERT 100 STUDENTS
-- =====================================================

INSERT INTO students (student_name, age, gender, study_hours_per_week, attendance_percentage) VALUES
('Alice Johnson', 17, 'Female', 20, 95.5),
('Bob Smith', 16, 'Male', 15, 88.2),
('Carol Davis', 18, 'Female', 25, 92.1),
('David Wilson', 17, 'Male', 12, 78.5),
('Emma Brown', 16, 'Female', 18, 90.3),
('Frank Miller', 18, 'Male', 22, 85.7),
('Grace Lee', 17, 'Female', 16, 93.4),
('Henry Garcia', 16, 'Male', 14, 82.1),
('Ivy Martinez', 18, 'Female', 24, 96.8),
('Jack Anderson', 17, 'Male', 19, 87.3),
('Kate Taylor', 16, 'Female', 21, 91.2),
('Liam Thomas', 18, 'Male', 13, 79.6),
('Mia Jackson', 17, 'Female', 17, 89.4),
('Noah White', 16, 'Male', 23, 94.1),
('Olivia Harris', 18, 'Female', 26, 97.3),
('Peter Clark', 17, 'Male', 15, 84.8),
('Quinn Lewis', 16, 'Female', 11, 76.2),
('Ryan Robinson', 18, 'Male', 20, 88.9),
('Sophia Walker', 17, 'Female', 18, 92.7),
('Tyler Hall', 16, 'Male', 24, 95.2),
('Uma Allen', 18, 'Female', 14, 81.5),
('Victor Young', 17, 'Male', 16, 86.3),
('Wendy King', 16, 'Female', 22, 93.8),
('Xavier Wright', 18, 'Male', 25, 96.1),
('Yara Lopez', 17, 'Female', 17, 87.9),
('Zoe Hill', 16, 'Female', 12, 78.4),
('Aaron Green', 18, 'Male', 21, 91.6),
('Bella Adams', 17, 'Female', 19, 89.1),
('Carlos Baker', 16, 'Male', 23, 94.7),
('Diana Gonzalez', 18, 'Female', 13, 80.2),
('Ethan Nelson', 17, 'Male', 18, 88.5),
('Fiona Carter', 16, 'Female', 20, 92.3),
('Gabriel Mitchell', 18, 'Male', 24, 95.8),
('Hannah Perez', 17, 'Female', 16, 85.7),
('Ian Roberts', 16, 'Male', 14, 77.9),
('Julia Turner', 18, 'Female', 22, 90.4),
('Kevin Phillips', 17, 'Male', 17, 87.2),
('Luna Campbell', 16, 'Female', 25, 96.3),
('Mason Parker', 18, 'Male', 15, 83.1),
('Nora Evans', 17, 'Female', 19, 89.8),
('Oscar Edwards', 16, 'Male', 21, 93.5),
('Paige Collins', 18, 'Female', 26, 97.1),
('Quincy Stewart', 17, 'Male', 18, 86.9),
('Ruby Sanchez', 16, 'Female', 12, 79.3),
('Sean Morris', 18, 'Male', 23, 92.7),
('Tara Rogers', 17, 'Female', 20, 88.6),
('Ulysses Reed', 16, 'Male', 24, 94.9),
('Vera Cook', 18, 'Female', 14, 81.7),
('Will Morgan', 17, 'Male', 16, 85.4),
('Xara Bell', 16, 'Female', 22, 91.8),
('Yusuf Murphy', 18, 'Male', 25, 96.5),
('Zara Bailey', 17, 'Female', 17, 87.1),
('Adam Rivera', 16, 'Male', 13, 78.8),
('Beth Cooper', 18, 'Female', 21, 90.2),
('Caleb Richardson', 17, 'Male', 19, 88.7),
('Daisy Cox', 16, 'Female', 23, 93.6),
('Eli Howard', 18, 'Male', 15, 82.3),
('Faith Ward', 17, 'Female', 18, 89.5),
('Grayson Torres', 16, 'Male', 20, 92.1),
('Hazel Peterson', 18, 'Female', 24, 95.4),
('Isaac Gray', 17, 'Male', 16, 86.2),
('Jade Ramirez', 16, 'Female', 14, 80.9),
('Kyle James', 18, 'Male', 22, 91.3),
('Lily Watson', 17, 'Female', 17, 87.8),
('Max Brooks', 16, 'Male', 25, 94.2),
('Nina Kelly', 18, 'Female', 13, 79.5),
('Owen Sanders', 17, 'Male', 19, 88.1),
('Piper Price', 16, 'Female', 21, 92.8),
('Quest Bennett', 18, 'Male', 26, 96.7),
('Rosa Wood', 17, 'Female', 18, 86.6),
('Sam Barnes', 16, 'Male', 12, 77.2),
('Tina Ross', 18, 'Female', 23, 93.9),
('Umar Henderson', 17, 'Male', 20, 89.3),
('Violet Coleman', 16, 'Female', 24, 95.1),
('Wade Jenkins', 18, 'Male', 14, 81.4),
('Xyla Perry', 17, 'Female', 16, 84.9),
('Yale Powell', 16, 'Male', 22, 91.7),
('Zita Long', 18, 'Female', 25, 96.4),
('Alex Patterson', 17, 'Male', 17, 87.5),
('Bree Hughes', 16, 'Female', 13, 78.1),
('Cole Flores', 18, 'Male', 21, 90.8),
('Dove Washington', 17, 'Female', 19, 88.4),
('Ezra Butler', 16, 'Male', 23, 94.6),
('Faye Simmons', 18, 'Female', 15, 82.7),
('Gage Foster', 17, 'Male', 18, 86.8),
('Hope Gonzales', 16, 'Female', 20, 92.5),
('Ivan Bryant', 18, 'Male', 24, 95.7),
('Joy Alexander', 17, 'Female', 16, 85.2),
('Knox Russell', 16, 'Male', 12, 77.6),
('Leah Griffin', 18, 'Female', 22, 91.1),
('Marc Diaz', 17, 'Male', 17, 87.3),
('Naya Hayes', 16, 'Female', 25, 96.2),
('Otto Myers', 18, 'Male', 14, 80.5),
('Penn Ford', 17, 'Male', 19, 89.7),
('Queen Hamilton', 16, 'Female', 21, 93.3),
('Reid Graham', 18, 'Male', 26, 97.2),
('Sage Sullivan', 17, 'Female', 18, 88.2),
('Trey Wallace', 16, 'Male', 11, 76.8),
('Ursa Woods', 18, 'Female', 23, 92.4),
('Vale West', 17, 'Female', 20, 90.1),
('Wade Stone', 16, 'Male', 24, 94.8),
('Xara Cole', 18, 'Female', 15, 83.6),
('Yael Owen', 17, 'Male', 17, 86.4),
('Zuri Lane', 16, 'Female', 19, 89.9);

-- =====================================================
-- INSERT MARKS FOR ALL 100 STUDENTS
-- =====================================================

INSERT INTO student_marks (student_id, mathematics, physics, chemistry, biology, english, history, geography, computer_science, semester, year) VALUES
(1, 88.5, 90.2, 87.3, 89.1, 94.2, 86.7, 91.3, 92.8, 'Spring', 2024),
(2, 79.3, 81.7, 78.9, 80.4, 85.2, 77.8, 83.6, 82.1, 'Spring', 2024),
(3, 95.1, 96.8, 94.2, 93.7, 98.3, 92.4, 95.9, 97.2, 'Spring', 2024),
(4, 68.7, 70.2, 66.8, 69.5, 74.1, 65.3, 71.7, 67.9, 'Spring', 2024),
(5, 84.2, 86.5, 83.7, 85.1, 89.6, 82.3, 87.8, 88.4, 'Spring', 2024),
(6, 87.6, 89.3, 86.1, 88.7, 91.4, 85.9, 90.2, 91.8, 'Spring', 2024),
(7, 82.9, 84.6, 81.4, 83.8, 87.2, 80.5, 85.7, 86.3, 'Spring', 2024),
(8, 76.4, 78.1, 75.2, 77.6, 80.9, 74.7, 79.3, 78.8, 'Spring', 2024),
(9, 96.7, 98.2, 95.4, 94.8, 99.1, 93.6, 97.3, 98.5, 'Spring', 2024),
(10, 85.8, 87.4, 84.6, 86.2, 89.7, 83.1, 88.5, 89.1, 'Spring', 2024),
(11, 89.2, 90.8, 88.1, 89.6, 92.3, 87.4, 91.7, 92.9, 'Spring', 2024),
(12, 73.5, 75.1, 72.3, 74.7, 78.2, 71.8, 76.4, 75.9, 'Spring', 2024),
(13, 81.7, 83.4, 80.5, 82.9, 86.1, 79.2, 84.6, 85.2, 'Spring', 2024),
(14, 91.3, 92.9, 90.2, 91.7, 94.8, 89.5, 93.1, 94.4, 'Spring', 2024),
(15, 97.4, 98.9, 96.1, 95.6, 99.3, 94.2, 97.8, 98.7, 'Spring', 2024),
(16, 78.9, 80.5, 77.7, 79.3, 82.6, 76.1, 81.2, 80.8, 'Spring', 2024),
(17, 70.2, 71.8, 69.1, 71.5, 74.7, 68.4, 72.9, 72.3, 'Spring', 2024),
(18, 86.5, 88.1, 85.3, 87.7, 90.2, 84.8, 89.4, 90.6, 'Spring', 2024),
(19, 90.1, 91.7, 89.4, 90.8, 93.5, 88.2, 92.6, 93.3, 'Spring', 2024),
(20, 93.8, 95.4, 92.6, 94.2, 96.7, 91.3, 95.9, 96.1, 'Spring', 2024),
(21, 75.6, 77.2, 74.4, 76.8, 79.3, 73.1, 78.5, 77.9, 'Spring', 2024),
(22, 83.4, 85.0, 82.2, 84.6, 87.1, 81.7, 86.3, 86.8, 'Spring', 2024),
(23, 92.7, 94.3, 91.5, 93.1, 95.8, 90.4, 94.7, 95.2, 'Spring', 2024),
(24, 95.9, 97.5, 94.7, 96.3, 98.1, 93.8, 97.4, 98.0, 'Spring', 2024),
(25, 84.3, 85.9, 83.1, 85.5, 88.2, 82.6, 87.1, 87.7, 'Spring', 2024),
(26, 72.1, 73.7, 71.0, 73.4, 76.5, 70.3, 74.8, 74.2, 'Spring', 2024),
(27, 88.7, 90.3, 87.5, 89.9, 92.4, 86.8, 91.2, 91.8, 'Spring', 2024),
(28, 85.2, 86.8, 84.0, 86.4, 89.1, 83.5, 87.9, 88.5, 'Spring', 2024),
(29, 92.4, 94.0, 91.2, 93.6, 95.3, 90.7, 94.1, 94.7, 'Spring', 2024),
(30, 74.8, 76.4, 73.6, 76.0, 78.7, 72.9, 77.3, 76.9, 'Spring', 2024),
(31, 86.1, 87.7, 85.0, 87.4, 90.0, 84.3, 88.8, 89.3, 'Spring', 2024),
(32, 89.8, 91.4, 88.6, 90.2, 92.9, 87.1, 91.5, 92.1, 'Spring', 2024),
(33, 94.6, 96.2, 93.4, 95.8, 97.5, 92.9, 96.3, 96.9, 'Spring', 2024),
(34, 80.7, 82.3, 79.5, 81.9, 84.4, 78.8, 83.2, 82.6, 'Spring', 2024),
(35, 71.5, 73.1, 70.4, 72.8, 75.2, 69.7, 74.1, 73.5, 'Spring', 2024),
(36, 87.9, 89.5, 86.7, 89.1, 91.6, 85.2, 90.4, 90.8, 'Spring', 2024),
(37, 83.6, 85.2, 82.4, 84.8, 87.3, 81.9, 86.5, 86.9, 'Spring', 2024),
(38, 95.3, 96.9, 94.1, 95.7, 98.2, 93.4, 96.8, 97.4, 'Spring', 2024),
(39, 77.2, 78.8, 76.1, 78.5, 81.0, 75.4, 79.8, 79.2, 'Spring', 2024),
(40, 85.9, 87.5, 84.7, 87.1, 89.8, 84.0, 88.4, 89.0, 'Spring', 2024),
(41, 91.1, 92.7, 89.9, 92.3, 94.6, 88.4, 93.0, 93.6, 'Spring', 2024),
(42, 96.8, 98.4, 95.6, 97.2, 99.1, 94.9, 98.3, 98.9, 'Spring', 2024),
(43, 82.4, 84.0, 81.2, 83.6, 86.1, 80.5, 84.9, 84.3, 'Spring', 2024),
(44, 73.8, 75.4, 72.7, 75.1, 77.6, 72.0, 76.4, 75.8, 'Spring', 2024),
(45, 90.5, 92.1, 89.3, 91.7, 94.2, 88.6, 93.0, 92.4, 'Spring', 2024),
(46, 84.7, 86.3, 83.5, 85.9, 88.4, 82.8, 87.2, 86.6, 'Spring', 2024),
(47, 93.2, 94.8, 92.0, 94.4, 96.1, 91.3, 95.7, 95.1, 'Spring', 2024),
(48, 76.9, 78.5, 75.8, 78.2, 80.7, 75.1, 79.5, 78.9, 'Spring', 2024),
(49, 81.3, 82.9, 80.1, 82.5, 85.0, 79.4, 83.8, 83.2, 'Spring', 2024),
(50, 88.4, 90.0, 87.2, 89.6, 92.1, 86.5, 90.9, 90.3, 'Spring', 2024),
(51, 92.8, 94.4, 91.6, 94.0, 95.7, 90.9, 94.3, 93.7, 'Spring', 2024),
(52, 79.6, 81.2, 78.4, 80.8, 83.3, 77.7, 82.1, 81.5, 'Spring', 2024),
(53, 74.1, 75.7, 73.0, 75.4, 77.9, 72.3, 76.7, 76.1, 'Spring', 2024),
(54, 89.7, 91.3, 88.5, 90.9, 93.4, 87.8, 92.2, 91.6, 'Spring', 2024),
(55, 85.5, 87.1, 84.3, 86.7, 89.2, 83.6, 88.0, 87.4, 'Spring', 2024),
(56, 94.9, 96.5, 93.7, 96.1, 97.8, 93.0, 96.4, 95.8, 'Spring', 2024),
(57, 77.8, 79.4, 76.7, 79.1, 81.6, 76.0, 80.4, 79.8, 'Spring', 2024),
(58, 82.6, 84.2, 81.4, 83.8, 86.3, 80.7, 85.1, 84.5, 'Spring', 2024),
(59, 90.9, 92.5, 89.7, 92.1, 94.8, 89.0, 93.4, 92.8, 'Spring', 2024),
(60, 75.4, 77.0, 74.3, 76.7, 79.2, 73.6, 78.0, 77.4, 'Spring', 2024),
(61, 86.8, 88.4, 85.6, 88.0, 90.7, 85.1, 89.5, 88.9, 'Spring', 2024),
(62, 88.1, 89.7, 86.9, 89.3, 91.8, 86.2, 90.6, 90.0, 'Spring', 2024),
(63, 96.2, 97.8, 95.0, 97.4, 98.9, 94.3, 97.7, 97.1, 'Spring', 2024),
(64, 80.9, 82.5, 79.7, 82.1, 84.8, 79.0, 83.4, 82.8, 'Spring', 2024),
(65, 73.3, 74.9, 72.2, 74.6, 77.1, 71.5, 75.9, 75.3, 'Spring', 2024),
(66, 87.2, 88.8, 86.0, 88.4, 90.9, 85.3, 89.7, 89.1, 'Spring', 2024),
(67, 84.0, 85.6, 82.8, 85.2, 87.9, 82.1, 86.5, 85.9, 'Spring', 2024),
(68, 91.6, 93.2, 90.4, 92.8, 95.1, 89.7, 94.1, 93.5, 'Spring', 2024),
(69, 94.1, 95.7, 92.9, 95.3, 97.0, 92.2, 96.6, 96.0, 'Spring', 2024),
(70, 78.5, 80.1, 77.4, 79.8, 82.3, 76.7, 81.1, 80.5, 'Spring', 2024),
(71, 71.9, 73.5, 70.8, 73.2, 75.7, 70.1, 74.5, 73.9, 'Spring', 2024),
(72, 88.6, 90.2, 87.4, 89.8, 92.5, 86.7, 91.1, 90.5, 'Spring', 2024),
(73, 83.8, 85.4, 82.6, 85.0, 87.7, 81.9, 86.3, 85.7, 'Spring', 2024),
(74, 95.7, 97.3, 94.5, 96.9, 98.6, 93.8, 97.2, 96.6, 'Spring', 2024),
(75, 76.3, 77.9, 75.2, 77.6, 80.1, 74.5, 78.9, 78.3, 'Spring', 2024),
(76, 87.0, 88.6, 85.8, 88.2, 90.9, 85.1, 89.5, 88.9, 'Spring', 2024),
(77, 89.3, 90.9, 88.1, 90.5, 93.2, 87.4, 91.8, 91.2, 'Spring', 2024),
(78, 93.5, 95.1, 92.3, 94.7, 96.4, 91.6, 96.0, 95.4, 'Spring', 2024),
(79, 75.7, 77.3, 74.6, 77.0, 79.5, 73.9, 78.3, 77.7, 'Spring', 2024),
(80, 86.4, 88.0, 85.2, 87.6, 90.3, 84.5, 88.9, 88.3, 'Spring', 2024),
(81, 91.8, 93.4, 90.6, 93.0, 95.7, 89.9, 94.3, 93.7, 'Spring', 2024),
(82, 96.5, 98.1, 95.3, 97.7, 99.2, 94.6, 98.0, 97.4, 'Spring', 2024),
(83, 81.1, 82.7, 79.9, 82.3, 85.0, 79.2, 83.6, 83.0, 'Spring', 2024),
(84, 72.7, 74.3, 71.6, 74.0, 76.5, 70.9, 75.3, 74.7, 'Spring', 2024),
(85, 88.9, 90.5, 87.7, 90.1, 92.8, 87.0, 91.4, 90.8, 'Spring', 2024),
(86, 84.6, 86.2, 83.4, 85.8, 88.5, 82.7, 87.1, 86.5, 'Spring', 2024),
(87, 92.1, 93.7, 90.9, 93.3, 95.0, 90.2, 94.6, 94.0, 'Spring', 2024),
(88, 77.4, 79.0, 76.3, 78.7, 81.2, 75.6, 80.0, 79.4, 'Spring', 2024),
(89, 85.3, 86.9, 84.1, 86.5, 89.2, 83.4, 87.8, 87.2, 'Spring', 2024),
(90, 90.6, 92.2, 89.4, 91.8, 94.5, 88.7, 93.1, 92.5, 'Spring', 2024),
(91, 94.4, 96.0, 93.2, 95.6, 97.3, 92.5, 96.9, 96.3, 'Spring', 2024),
(92, 74.2, 75.8, 73.1, 75.5, 78.0, 72.4, 76.8, 76.2, 'Spring', 2024),
(93, 87.5, 89.1, 86.3, 88.7, 91.4, 85.6, 90.0, 89.4, 'Spring', 2024),
(94, 83.1, 84.7, 81.9, 84.3, 87.0, 81.2, 85.6, 85.0, 'Spring', 2024),
(95, 95.8, 97.4, 94.6, 97.0, 98.7, 93.9, 97.3, 96.7, 'Spring', 2024),
(96, 78.0, 79.6, 76.9, 79.3, 81.8, 76.2, 80.6, 80.0, 'Spring', 2024),
(97, 82.8, 84.4, 81.6, 84.0, 86.7, 80.9, 85.3, 84.7, 'Spring', 2024),
(98, 86.7, 88.3, 85.5, 87.9, 90.6, 84.8, 89.2, 88.6, 'Spring', 2024),
(99, 70.6, 72.2, 69.5, 71.9, 74.4, 68.8, 73.2, 72.6, 'Spring', 2024),
(100, 89.4, 91.0, 88.2, 90.6, 93.3, 87.5, 91.9, 91.3, 'Spring', 2024);

-- =====================================================
-- SIMPLE QUERIES TO CHECK DATA
-- =====================================================

-- Show all students
SELECT student_id, student_name, age, gender, study_hours_per_week, attendance_percentage FROM students LIMIT 10;

-- Show marks for first 5 students
SELECT 
    s.student_name,
    sm.mathematics,
    sm.physics,
    sm.chemistry,
    sm.biology,
    sm.english,
    sm.history,
    sm.geography,
    sm.computer_science
FROM students s
JOIN student_marks sm ON s.student_id = sm.student_id
LIMIT 5;

-- Calculate average marks per student
SELECT 
    s.student_name,
    ROUND((sm.mathematics + sm.physics + sm.chemistry + sm.biology + 
           sm.english + sm.history + sm.geography + sm.computer_science) / 8, 2) as average_marks
FROM students s
JOIN student_marks sm ON s.student_id = sm.student_id
ORDER BY average_marks DESC
LIMIT 10;

-- Show subject-wise class averages
SELECT 
    ROUND(AVG(mathematics), 2) as Math_Avg,
    ROUND(AVG(physics), 2) as Physics_Avg,
    ROUND(AVG(chemistry), 2) as Chemistry_Avg,
    ROUND(AVG(biology), 2) as Biology_Avg,
    ROUND(AVG(english), 2) as English_Avg,
    ROUND(AVG(history), 2) as History_Avg,
    ROUND(AVG(geography), 2) as Geography_Avg,
    ROUND(AVG(computer_science), 2) as CS_Avg
FROM student_marks;

SELECT 'Simple database setup complete!' as message;