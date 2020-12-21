--select data from specific database 
USE [Record of Grades];

--review data within table in database 
SELECT * FROM Grade_Records;

--ensure unique records (by removing any the duplicates) from the specified columns 
SELECT DISTINCT studentID,First_name,Lastname
INTO StudentInformation
FROM Grade_Records;

--Set studentID as primary key
ALTER TABLE StudentInformation
	ADD PRIMARY KEY (studentID);

SELECT DISTINCT studentID, Midtermexam, Finalexam, assignment1, assignment2
INTO StudentAssignments
FROM Grade_Records;

										ALTER TABLE StudentAssignments
										ADD AssignmentID int NOT NULL;
										--Set AssignemntID as primary key
										ALTER TABLE StudentAssignments
										ADD PRIMARY KEY (AssignmentID);
										--Msg 8111, Level 16, State 1, Line 28
										--Cannot define PRIMARY KEY constraint on nullable column in table 'StudentAssignments'.

--Add unique identifying column as PK instead
ALTER TABLE StudentAssignments 
ADD AssignmentID int IDENTITY  (1,1) primary key;

--Creating additional table from Main table 
SELECT StudentID,Studentaverage,Grade
INTO StudentGrades
FROM Grade_Records;	

	--ASSIGNING PRIMARY KEY
--Add unique identifying column as PK
ALTER TABLE StudentGrades 
ADD GradeID int IDENTITY  (1,1) primary key;

	--ASSIGNING FOREIGN KEYS  
	--Assigning PK and FK for Referential Integrity

--Alter tables to add columns for the purpose of defining relationship ]
--Ensuring referential integrity
ALTER TABLE StudentInformation
ADD GradeID int;

--relationships from StudentInformation table to other tables
ALTER TABLE StudentInformation
ADD FOREIGN KEY (GradeID) REFERENCES StudentGrades(GradeID);

--relationships from other tables to StudentInformation table
ALTER TABLE StudentGrades
ADD FOREIGN KEY (StudentID) REFERENCES StudentInformation(StudentID);

ALTER TABLE StudentAssignments 
ADD FOREIGN KEY (StudentID) REFERENCES StudentInformation(StudentID);

	--2NF to 3NK has been satisfied