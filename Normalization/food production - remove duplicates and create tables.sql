--select data from specific database 
USE [Production of Food];

--review data within table in database 
SELECT * FROM Food_Production;

--remove duplicate values in main column for new table 
SELECT DISTINCT Food_product
INTO Food_products
FROM Food_Production;

--review data within new table 
SELECT * FROM Food_products;

--add unique identity column as primary key to new table 
ALTER TABLE Food_products 
ADD FoodProductID int IDENTITY  (1,1) primary key;

--add additional columns with information from main table
ALTER TABLE Food_products 
ADD Land_use_change nvarchar(50),
Animal_Feed nvarchar(50),
Farm float;	

				--main table needs to be adjusted to genereate new tables 
				ALTER TABLE Food_Production
				ALTER COLUMN Land_use_change nvarchar(50) NULL;

				ALTER TABLE Food_Production
				ALTER COLUMN Animal_Feed nvarchar(50) NULL; 

				ALTER TABLE Food_Production
				ALTER COLUMN Farm float NULL;

-- populate tables with data from main table
INSERT INTO Food_products(Food_product,Land_use_change,Animal_Feed,Farm)
SELECT Food_product,Land_use_change,Animal_Feed,Farm
FROM Food_Production;

				--revert original table back to no null values 
				ALTER TABLE Food_Production
				ALTER COLUMN Land_use_change nvarchar(50) NOT NULL;

				ALTER TABLE Food_Production
				ALTER COLUMN Animal_Feed nvarchar(50) NOT NULL; 

				ALTER TABLE Food_Production
				ALTER COLUMN Farm float NOT NULL;

--Creating additional tables from Main table 
SELECT Processing,Transport,Packging,Retail 
INTO Manufacturing
FROM Food_Production;

SELECT Freshwater_withdrawals_per_1000kcal_liters_per_1000kcal, Freshwater_withdrawals_per_100g_protein_liters_per_100g_protein,Freshwater_withdrawals_per_kilogram_liters_per_kilogram
INTO Freshwater_statistics
FROM Food_Production;

SELECT Land_use_per_1000kcal_m_per_1000kcal, Land_use_per_kilogram_m_per_kilogram
INTO Land_use_statisitics
FROM Food_Production;

--add additional columns with missing information from main table
ALTER TABLE Land_use_statisitics 
ADD Land_use_per_100g_protein_m_per_100g_protein nvarchar(50);

-- populate column added with data from main table
INSERT INTO Land_use_statisitics(Land_use_per_100g_protein_m_per_100g_protein)
SELECT Land_use_per_100g_protein_m_per_100g_protein
FROM Food_Production;

--review and check data within new tables 
SELECT * FROM Manufacturing;

SELECT * FROM Freshwater_statistics;

SELECT * FROM Land_use_statisitics;