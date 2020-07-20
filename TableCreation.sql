USE master

--drop database if it exists
IF DB_ID('CarDealership') IS NOT NULL
BEGIN
	DROP DATABASE CarDealership
END
--creates database
CREATE DATABASE CarDealership
GO
--select the database
--use it for the rest of
--the script
USE CarDealership
GO


/*************************************************
	CREATE TABLES
*************************************************/

CREATE TABLE Make
(
	MakeID	smallint	PRIMARY KEY IDENTITY
	,Name	varchar(50) NOT NULL
)
GO

--Normally insert and ignore identity column.
--INSERT INTO Make (Name)
		--VALUES('Honda')

--When using scripts, seeing identity
--value is useful
SET IDENTITY_INSERT Make ON

INSERT INTO Make(MakeID, Name) 
		VALUES(1, 'Honda')
		,(2, 'Chevy')
		,(3, 'Ford')
		,(4, 'Ferrari')

SET IDENTITY_INSERT Make OFF


CREATE TABLE Vehicle
(
	VehicleID		int				PRIMARY KEY	IDENTITY
	,VinNumber		char(50)		NOT NULL UNIQUE
	,Model			varchar(50)		NOT NULL
	,Year			char(4)			NOT NULL
	,Color			varchar(70)		NULL
	,IsAuto			bit				NULL
	,Purchaseprice  decimal(9, 2)	NULL
	,MakeId			smallint
		REFERENCES Make(MakeID)					
	
)

GO

CREATE INDEX IX_VehicleModel
	ON Vehicle(Model)


CREATE TABLE SalesPerson
(	EmployeeID		int		PRIMARY KEY IDENTITY
	,HireDate		date			NOT NULL
	,IsActive		bit				NOT NULL DEFAULT 1 
	,LeaveReason	varchar(50)		NULL
	,FirstName		varchar(30)		NOT NULL
	,LastName		varchar(30)		NULL

)
