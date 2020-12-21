--STEPS TO ACHEIVE 1NF
USE [Record of Grades];

--Reviewed information in database table 
SELECT * FROM gradeRecord;

--Checked that column headings are unique 
SELECT * FROM gradeRecord
WHERE ('single value')
IN	
(
	StudentID,
	First_name,
	Lastname,
	Midtermexam,
	Finalexam,
	assignment1,
	assignment2,
	Totalpoints,
	Studentaverage,
	Grade
);

--Removed entire rows with NULL values 
DELETE FROM gradeRecord
WHERE 
COALESCE
(
	StudentID,
	First_name,
	Lastname,
	Midtermexam,
	Finalexam,
	assignment1,
	assignment2,
	Totalpoints,
	Studentaverage,
	Grade
)
IS NULL;
-- 51 rows 
SELECT * FROM gradeRecord;

--Removed duplicate records and saved data into a new file 
SELECT DISTINCT * INTO Grade_Records FROM gradeRecord;

--Double check using COUNT(*)>1 statement 
SELECT	StudentID,
		First_name,
		Lastname,
		Midtermexam,
		Finalexam,
		assignment1,
		assignment2,
		Totalpoints,
		Studentaverage,
		Grade, 
COUNT(*)
FROM Grade_Records
GROUP BY 
		StudentID,
		First_name,
		Lastname,
		Midtermexam,
		Finalexam,
		assignment1,
		assignment2,
		Totalpoints,
		Studentaverage,
		Grade
HAVING COUNT(*)>1
ORDER BY StudentID;
--0 rows were affected 

--Reviewed information in database table 
SELECT * FROM Grade_Records;

--update the StudentID column to a NOT NULL value to establish as PK
ALTER TABLE Grade_Records
ALTER COLUMN StudentID nvarchar(50) NOT NULL;

--establish PK
ALTER TABLE Grade_Records
	ADD PRIMARY KEY (studentID);

	--1NF to 2NK has been satisfied