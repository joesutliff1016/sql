IF DB_ID('Membership') IS NOT NULL
	DROP DATABASE Membership
GO

CREATE DATABASE Membership
GO

USE Membership
GO


CREATE TABLE Individuals
(IndividualID int NOT NULL IDENTITY PRIMARY KEY,
 FirstName varchar(50) NOT NULL,
 LastName varchar(50) NOT NULL,
 Address varchar(100) NULL,
 Phone varchar(50) NULL)

CREATE TABLE Groups
(GroupID int NOT NULL IDENTITY PRIMARY KEY,
 GroupName varchar(50) NOT NULL,
 Dues money NOT NULL DEFAULT 0 CHECK (Dues >= 0))

CREATE Table GroupMembership
(GroupID int REFERENCES Groups(GroupID),
 IndividualID int REFERENCES Individuals(IndividualID))


 CREATE CLUSTERED INDEX IX_GroupMembership_GroupID
    ON GroupMembership(GroupID)
CREATE INDEX IX_GroupMembership_IndividualID
    ON GroupMembership(IndividualID)


ALTER TABLE Individuals
ADD DuesPaid bit NOT NULL DEFAULT 0

USE AP
GO
ALTER TABLE Invoices
ADD CHECK ((PaymentDate IS NULL AND PaymentTotal = 0) OR
           (PaymentDate IS NOT NULL AND PaymentTotal > 0)),
    CHECK ((PaymentTotal + CreditTotal) <= InvoiceTotal)

USE Membership
GO
DROP TABLE GroupMembership

CREATE Table GroupMembership
(GroupID int REFERENCES Groups(GroupID),
 IndividualID int REFERENCES Individuals(IndividualID),
 UNIQUE(GroupID, IndividualID))

