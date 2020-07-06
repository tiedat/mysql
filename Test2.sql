CREATE DATABASE test2;
USE test2;

CREATE TABLE Students(
StudentID INT(4) AUTO_INCREMENT PRIMARY KEY,
StudentName NVARCHAR(50),
Age INT(4),
Email VARCHAR(100));

INSERT INTO Students(StudentName,Age,Email) VALUES ('Nguyen Quang An',18,'an@yahoo.com');
INSERT INTO Students(StudentName,Age,Email) VALUES ('Nguyen Cong Vinh',20,'vinh@gmail.com');
INSERT INTO Students(StudentName,Age,Email) VALUES ('Nguyen Van Quyen',19,'Quyen');
INSERT INTO Students(StudentName,Age,Email) VALUES ('Pham Thanh Binh',25,'binh@com');
INSERT INTO Students(StudentName,Age,Email) VALUES ('Nguyen Van Tai Em',30,'taiem@sport.vn');

SELECT * FROM Students;

CREATE TABLE Classes(
ClassID INT(4) AUTO_INCREMENT PRIMARY KEY,
ClassName NVARCHAR(50));

INSERT INTO Classes(ClassName) VALUES ('C0706L');
INSERT INTO Classes(ClassName) VALUES ('C0708G');

SELECT * FROM Classes;

CREATE TABLE ClassStudent(
StudentID INT(4),
FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
ClassID INT(4),
FOREIGN KEY(ClassID) REFERENCES Classes(ClassID));

INSERT INTO ClassStudent(StudentID,ClassID) VALUES(1,1);
INSERT INTO ClassStudent(StudentID,ClassID) VALUES(2,1);
INSERT INTO ClassStudent(StudentID,ClassID) VALUES(3,2);
INSERT INTO ClassStudent(StudentID,ClassID) VALUES(4,2);
INSERT INTO ClassStudent(StudentID,ClassID) VALUES(5,2);

SELECT * FROM ClassStudent;

CREATE TABLE Subjects(
SubjectID INT(4) AUTO_INCREMENT PRIMARY KEY,
SubjectName NVARCHAR(50));

INSERT INTO Subjects(SubjectName) VALUES('SQL');
INSERT INTO Subjects(SubjectName) VALUES('Java');
INSERT INTO Subjects(SubjectName) VALUES('C');
INSERT INTO Subjects(SubjectName) VALUES('Visual Basic');

SELECT * FROM Subjects;

CREATE TABLE Marks(
SubjectID INT(4),
FOREIGN KEY(SubjectID) REFERENCES Subjects(SubjectID),
StudentID INT(4),
FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
Mark INT(4));

INSERT INTO Marks(SubjectID,StudentID,Mark) VALUES (1,1,8);
INSERT INTO Marks(SubjectID,StudentID,Mark) VALUES (2,1,4);
INSERT INTO Marks(SubjectID,StudentID,Mark) VALUES (1,1,9);
INSERT INTO Marks(SubjectID,StudentID,Mark) VALUES (1,3,7);
INSERT INTO Marks(SubjectID,StudentID,Mark) VALUES (1,4,3);
INSERT INTO Marks(SubjectID,StudentID,Mark) VALUES (2,5,5);
INSERT INTO Marks(SubjectID,StudentID,Mark) VALUES (3,3,8);
INSERT INTO Marks(SubjectID,StudentID,Mark) VALUES (1,5,1);
INSERT INTO Marks(SubjectID,StudentID,Mark) VALUES (2,4,3);

SELECT * FROM Marks;


--    1. Hien thi danh sach nhung hoc vien nao co dia chi email chinh xac
SELECT StudentID, StudentName, Email FROM Students
WHERE Email LIKE '%@%.com' OR Email LIKE '%@%.vn';

--    2. Hien thi danh sach nhung hoc vien nao co Ho  la Nguyen
SELECT StudentID, StudentName FROM Students
WHERE StudentName LIKE 'Nguyen %';

--    3. Hien thi danh sach cac ban hoc vien cua lop C0706L
SELECT Students.StudentID, StudentName, ClassName FROM Students, ClassStudent, Classes
WHERE Classes.ClassName = 'C0706L' 
AND Classes.ClassID=ClassStudent.ClassID
AND ClassStudent.StudentID=Students.StudentID
ORDER BY Students.StudentID ASC;

--    4. Hien danh sach va diem cua hoc vien ung voi cac mon hoc
SELECT SubjectName, StudentName, Mark FROM Subjects, Students, Marks
WHERE Subjects.SubjectID=Marks.SubjectID
AND Marks.StudentID=Students.StudentID
ORDER BY SubjectName ASC, StudentName ASC;

--    5. Hien thi danh sach hoc vien chua thi mon nao (chua co diem)
SELECT Students.StudentID, StudentName FROM Students
WHERE Students.StudentID NOT IN (
SELECT StudentID FROM Marks);

--    6. Hien thi mon hoc chua duoc hoc vien nao thi
SELECT SubjectID, SubjectName FROM Subjects
WHERE SubjectID NOT IN (
SELECT SubjectID FROM Marks);

--    7. Tinh diem trung binh cho cac hoc vien
SELECT Students.StudentID, StudentName,
ROUND(AVG(Mark),2) AS 'Average Point'
FROM Students, Marks
WHERE Students.StudentID=Marks.StudentID
GROUP BY Marks.StudentID;

--    8. Hien thi mon hoc nao duoc thi nhieu nhat

-- Method 1:
SELECT M.SubjectID, SubjectName,
		COUNT(*) AS 'Amount Student'
FROM Marks M 
INNER JOIN Subjects S 
ON S.SubjectID=M.SubjectID
GROUP BY SubjectID
HAVING COUNT(M.StudentID) >= ALL( SELECT COUNT(*) FROM Marks GROUP BY SubjectID);

-- https://dev.mysql.com/doc/refman/5.7/en/optimizing-subqueries.html

-- Method 2:
CREATE TEMPORARY TABLE temp (
SELECT M.SubjectID, SubjectName,
		COUNT(*) AmountStudent
FROM Marks M 
INNER JOIN Subjects S 
ON S.SubjectID=M.SubjectID
GROUP BY SubjectID);

SELECT ANY_VALUE(SubjectName), MAX(AmountStudent) FROM temp;

-- https://dev.mysql.com/doc/refman/5.7/en/group-by-handling.html

--    9. Hien thi mon hoc nao co hoc sinh thi duoc diem cao nhat


SELECT Su.SubjectID, SubjectName, MAX(M.Mark)
FROM Subjects Su INNER JOIN Marks M
ON Su.SubjectID=M.SubjectID
GROUP BY M.SubjectID
HAVING MAX(M.Mark) >= ALL(SELECT MAX(Mark) FROM Marks);

--    10. Hien thi mon hoc nao co nhieu diem duoi diem trung binh nhat ( <5)
SELECT Su.SubjectID, SubjectName, COUNT(*)
FROM Subjects Su INNER JOIN Marks M
ON Su.SubjectID=M.SubjectID
WHERE M.Mark < 5
GROUP BY M.SubjectID
HAVING COUNT(*) >= ALL(SELECT COUNT(*) FROM Marks WHERE Mark < 5 GROUP BY SubjectID);

--    11. Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu cau Age >15 va Age < 50
ALTER TABLE Students
ADD CHECK (Age>15 AND AGE<50);

--    12. Loai bo tat ca quan he giua cac bang


--    13. Xoa hoc vien co StudentID la 1
DELETE FROM Students
WHERE SudentId = 1;

--    14. Trong bang Student them mot column Status co kieu du lieu la Bit va co gia tri Default la 1
ALTER TABLE Students
ADD Status BIT(2) DEFAULT 1;

--    15. Cap nhap gia tri Status trong bang Student thanh 0
SET SQL_SAFE_UPDATES = 0;

UPDATE Students
SET Status=0;

SET SQL_SAFE_UPDATES = 1;






