--select data from specific database 
USE [Production of Food];

--review data within table in database 
SELECT * FROM Food_Production;

--add unique identity column as primary key to new tables 
ALTER TABLE Manufacturing 
ADD ManufacturingID int IDENTITY (1,1);

ALTER TABLE Freshwater_statistics 
ADD Freshwater_ID int IDENTITY (1,1);

ALTER TABLE Land_use_statisitics 
ADD Land_use_ID int IDENTITY (1,1);

--Assigning PK and FK for Referential Integrity
ALTER TABLE Manufacturing
ADD CONSTRAINT PK_ManufacturingID PRIMARY KEY (ManufacturingID);

ALTER TABLE Freshwater_statistics
ADD CONSTRAINT PK_Freshwater_ID PRIMARY KEY (Freshwater_ID);

ALTER TABLE Land_use_statisitics
ADD CONSTRAINT PK_Land_Use_ID PRIMARY KEY (Land_use_ID);

--Alter tables to add columns for the purpose of defining relationship and adding Foreign Keys
--ENSURING REFERENTIAL INTEGRITY
ALTER TABLE Food_products
ADD ManufacturingID int;

ALTER TABLE Food_products
ADD Freshwater_ID int;

ALTER TABLE Food_products
ADD Land_use_ID int;

--ASSIGNING FOREIGN KEYS  
--relationships from Main table to other tables
ALTER TABLE Food_products
ADD FOREIGN KEY (ManufacturingID) REFERENCES Manufacturing(ManufacturingID);

ALTER TABLE Food_products
ADD FOREIGN KEY (Land_use_ID) REFERENCES Land_use_statisitics(land_use_ID);

ALTER TABLE Food_products
ADD FOREIGN KEY (Freshwater_ID) REFERENCES Freshwater_statistics(Freshwater_ID);



