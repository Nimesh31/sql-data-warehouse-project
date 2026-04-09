/*
================================================
Create DB and Scemas 
================================================

Script Purpose:
	- Creating new DB DataWarehouse.
	- Checkcking if the DB we are trying to create already exist's or not. 
	- If the DB already exist's we simply drop it and recreate a new DB.
	- We setup 3 Scemas: 
		- Bronze. 
		- Silver.
		- Gold. 

WARNING:
	If you are planning to run this script then you must know that this scrip
	will drop entire DataWarehouse DB causing all the data to be permanently 
	beeing deleted.

	PROCEED WITH CAUTION.
*/



-- Creaet a new DB.
USE master;
GO
-- Master DB in use here we create other DBs.

-- Checking if DB exist's or not.
-- If DB exist's then drop it to recreate the DB.
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN 
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO


-- Creating new DB
CREATE DATABASE DataWarehouse;
GO

-- Switch to new DB
USE DataWarehouse;
GO
-- Creating Scema:

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;

