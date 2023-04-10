CREATE DATABASE Course
USE Course

CREATE TABLE Students(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(20),
Surname NVARCHAR(20)
)

INSERT INTO Students
VALUES 
('Abbas','Abbasov'),
('Hikmet','Abbasov'),
('Nermin','Abbasova'),
('Tofiq','Abbasov'),
('Humbet','Nerimanov')

SELECT * FROM Students

CREATE TABLE Groups
(Id INT PRIMARY KEY IDENTITY,
No NVARCHAR(20)
)

INSERT INTO Groups
VALUES
('P232'),
('P132'),
('P332'),
('P123')


SELECT * FROM Groups

ALTER TABLE Students
ADD GroupId INT FOREIGN KEY REFERENCES Groups(Id)

SELECT * FROM Students
JOIN Groups
ON Students.GroupId = Groups.Id

SELECT S.Id,S.Name,S.Surname,G.No  FROM Students AS S
LEFT JOIN Groups AS G
ON S.GroupId = G.Id

CREATE TABLE Exam
(Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(20)
)

INSERT INTO Exam
VALUES 
('Proqramlasdirma'),
('Qrafik ve Veb Dizayn'),
('Digital Marketinq'),
('UX/UI Dizayn'),
('Kibertehlukesizlik')

CREATE TABLE StudentExam
(
	StudentId INT NOT NULL FOREIGN KEY REFERENCES Students(Id),
	ExamId INT NOT NULL FOREIGN KEY REFERENCES Exam(Id),
	Point INT,
)

SELECT COUNT(StudentId) FROM StudentExam WHERE StudentId=5

SELECT *,(SELECT COUNT(StudentId) FROM StudentExam WHERE StudentId=Students.Id) AS ExamCount FROM Students

CREATE TABLE Subject
(Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(20)
)

INSERT INTO Subject
VALUES 
('Proqramlasdirma'),
('Qrafik ve Veb Dizayn'),
('Digital Marketinq'),
('UX/UI Dizayn'),
('Kibertehlukesizlik')

SELECT * FROM Subject

SELECT * FROM Exam
WHERE SubjectId IS NULL

ALTER TABLE Exam
ADD SubjectId INT FOREIGN KEY REFERENCES Subject(Id)

SELECT *,(SELECT CONCAT(Name, ' ', Surname) AS 'FullName' FROM Students WHERE StudentExam.StudentId = Students.Id),Groups.No FROM StudentExam
JOIN Students
ON StudentId = Students.Id
JOIN Groups
ON Students.GroupId = Groups.Id

SELECT CONCAT(Name, ' ', Surname) AS 'FullName',Groups.No FROM Students
JOIN Groups
ON Students.GroupId = Groups.Id

SELECT CONCAT(Name, ' ', Surname) AS FullName FROM Students


SELECT *,(Select AVG(Point) from StudentExam
Where StudentId=Students.Id) AS AvgPoint FROM Students