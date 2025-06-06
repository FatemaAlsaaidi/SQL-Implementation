# Topics: 
1. UNION / UNION ALL 
2. DROP vs DELETE vs TRUNCATE 
3. Subqueries (exploratory task � they search and try it) 
4. Transaction & Batch Script (exploratory and guided) 
5. *Hands-on comparison with real effect on data 
Practice Scenario: Training & Job Application System 
Your institute is managing two main datasets: 
� Trainees: People who complete training at your institute. 
� Job Applicants: External applicants who apply directly to job posts. 
Your goal is to: 
� Compare the data of both groups. 
� Clean or restructure the database safely. 
� Explore more advanced SQL topics on your own (subqueries, transactions). 
Tables -- Trainees Table
```
CREATE TABLE Trainees ( 
TraineeID INT PRIMARY KEY, 
FullName VARCHAR(100), 
Email VARCHAR(100), 
Program VARCHAR(50), 
GraduationDate DATE 
); 
```
-- Job Applicants Table 
```
CREATE TABLE Applicants ( 
ApplicantID INT PRIMARY KEY, 
FullName VARCHAR(100), 
Email VARCHAR(100), 
Source VARCHAR(20), -- e.g., "Website", "Referral" 
AppliedDate DATE 
); 
```

Sample Data -- Insert into Trainees
```
INSERT INTO Trainees VALUES 
(1, 'Layla Al Riyami', 'layla.r@example.com', 'Full Stack .NET', '2025-04-30'), 
(2, 'Salim Al Hinai', 'salim.h@example.com', 'Outsystems', '2025-03-15'), 
(3, 'Fatma Al Amri', 'fatma.a@example.com', 'Database Admin', '2025-05-01'); 
```
-- Insert into Applicants 
```
INSERT INTO Applicants VALUES 
(101, 'Hassan Al Lawati', 'hassan.l@example.com', 'Website', '2025-05-02'), 
(102, 'Layla Al Riyami', 'layla.r@example.com', 'Referral', '2025-05-05'), -- same person as 
trainee 
(103, 'Aisha Al Farsi', 'aisha.f@example.com', 'Website', '2025-04-28');
```