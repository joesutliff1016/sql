USE master

IF DB_ID('CarDealership') 
	IS NOT NULL
BEGIN
DROP DATABASE CarDealership
END

CREATE DATABASE CarDealership
GO

USE CarDealership
GO


/*********************************************************
	CREATE TABLES
**********************************************************/

CREATE TABLE Make
(
	MakeID	 smallint	 PRIMARY KEY
	,Name	 varchar(50) NOT NULL
)
