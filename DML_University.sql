use University

-- inseart data to hostel table 
INSERT INTO hostel (hostel_id, hostel_name, no_of_seats) VALUES
(1, 'NizwaH', 80),
(2, 'MuscatH', 100),
(3, 'IbriH', 60);

-- inseart data to department Table
INSERT INTO department (department_id, d_name) VALUES
(1, 'IT'),
(2, 'Math'),
(3, 'Physics');

-- faculty Table
INSERT INTO faculty (F_id, F_name, department, salary, department_id) VALUES
(1, 'Yousuf', 'IT', 700, 1),
(2, 'Aisha', 'Math', 650, 2),
(3, 'Hassan', 'Physics', 550, 3);

-- faculty_MobileNO table
INSERT INTO faculty_MobileNO (F_id, MobileNO) VALUES
(1, '92001234'),
(2, '93005678'),
(3, '94007890');

-- course
INSERT INTO course (course_id, course_name, duration, department_id) VALUES
(101, 'Python', 3, 1),
(102, 'Algebra', 4, 2),
(103, 'Quantum', 5, 3);

-- student 
INSERT INTO student (S_id, L_name, F_name, city, state_, pin_code, DOB, hostel_id, F_id) VALUES
(1, 'Al-Harthy', 'Salim', 'Muscat', 'Muscat', '100001', '2002-01-15', 2, 1),
(2, 'Al-Balushi', 'Noor', 'Nizwa', 'sur', '100002', '2001-05-20', 1, 2),
(3, 'Al-Zadjali', 'Khalid', 'Ibri', 'suhar', '100003', '2003-03-10', 3, 3);


INSERT INTO Student_PhoneNo (S_id, PhoneNo) VALUES
(1, '91234567'),
(2, '92345678'),
(3, '93456789');

INSERT INTO course_student (course_id, S_id) VALUES
(101, 1),
(102, 2),
(103, 3);

INSERT INTO subjects (subject_id, subject_name, F_id) VALUES
(1, 'Coding', 1),
(2, 'Calculus', 2),
(3, 'Optics', 3);

INSERT INTO exams (department_id, exam_code, time00, date00, room) VALUES
(1, 'IT2025', 2.5, '2025-06-10', 'A101'),
(2, 'MATH25', 3.0, '2025-06-12', 'B202'),
(3, 'PHY999', 2.0, '2025-06-14', 'C303');






