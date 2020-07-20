USE master

--drop database if it exists
IF DB_ID('JoesEcigs') IS NOT NULL
BEGIN
	DROP DATABASE JoesEcigs
END
--creates database
CREATE DATABASE JoesEcigs
GO
--select the database
--use it for the rest of
--the script
USE JoesEcigs
GO



/*************************************************
	CREATE TABLES
*************************************************/

CREATE TABLE Products 
(	 productID				int				NOT NULL	PRIMARY KEY IDENTITY
	,productName			varchar(50)		NOT NULL
	,productVendor			varchar(50)		NOT NULL 
	,productDescription		text
	,quantityInStock		int				NOT NULL
	,buyPrice				int				NOT NULL
)
GO

CREATE TABLE ProductLines
(	productID				int				NOT NULL	PRIMARY KEY IDENTITY
		REFERENCES Products(productID)
   ,textDescription			text						
   ,htmlDescription			text		    NOT NULL	
   ,productImage			image
   ,productLine				int				NOT NULL


)
GO

CREATE TABLE Payments
(   customerNumber			int				NOT NULL	PRIMARY KEY IDENTITY
   ,checkNumber				varchar(50)		NOT NULL	
   ,paymentDate				varchar(50)		NOT NULL
   ,amount					int				NOT NULL	
)		
GO

CREATE TABLE Orders
(	orderNumber				int				NOT NULL	PRIMARY KEY IDENTITY
	,orderDate				varchar(50)     NOT NULL	
	,requiredDate			varchar(50)     NOT NULL	
	,shippedDate			varchar(50)		NOT NULL	
	,status					varchar(20)		NOT NULL
	,comments				varchar(100)	NULL
	,customerNumber	        int				NOT NULL
		
		
)
GO

CREATE TABLE OrderDetails	
(	orderNumber				int				NOT NULL	PRIMARY KEY IDENTITY
	REFERENCES Orders(orderNumber)
	,productCode			varchar(50)		NOT NULL
	,qauntityOrdered		int				NOT NULL	
	,priceEach				int				NOT NULL
	,orderLineNumber		int				NOT NULL
)
GO

CREATE TABLE Employees
(	employeeNumber			int				NOT NULL	PRIMARY KEY IDENTITY
	,lastName				varchar(50)		NOT NULL	
	,firstName				varchar(50)		NOT NULL
	,phoneNumber			int				NOT NULL
	,email					varchar(50)		NULL
	,locationCode			int				NOT NULL 
		
		
		 
		
		
	
)
GO

CREATE TABLE Customers
(	customerNumber			int				NOT NULL	PRIMARY KEY IDENTITY
	,customerName			varchar(50)		NOT NULL	
	,contactLastName		varchar(50)		NOT NULL	
	,contactFirstName		varchar(50)		NOT NULL
	,phone					int				NOT NULL
	,addressLine1			varchar(50)		NULL				
	,addressLine2			varchar(50)		NULL
	,city					varchar(50)		NULL
	,state					varchar(10)     NULL
	,postalCode				varchar(50)		NULL
	,country				varchar(50)		NULL
	,salesRepEmployeeNumber	int				NOT NULL
		REFERENCES Employees(employeeNumber)
)
GO

CREATE TABLE Locations
(	locationCode			int				NOT NULL	PRIMARY KEY IDENTITY	
	,addressLine1			varchar(50)		NOT NULL	
	,addressLine2			varchar(50)		NOT NULL
	,city					varchar(50)		NOT NULL	
	,state					varchar(10)		NOT NULL	
	,country				varchar(50)		NOT NULL	
	,postalCode				varchar(50)		NOT NULL	
	
	
)
GO

CREATE TABLE GiftCards
(	cardID				int				NOT NULL	PRIMARY KEY IDENTITY
	,cardNumber			int				NOT NULL
	,cardAmount			int				NOT NULL
	,cardBalance		money           NOT NULL
	,dateSold			varchar(50)		NOT NULL
	,expirationDate		varchar(50)		NOT NULL
	,productID			int				NOT NULL
		REFERENCES Products(productID)
	
)
GO

CREATE TABLE ShoppingCart
(	customerNumber		int				NOT NULL	PRIMARY KEY IDENTITY
		REFERENCES Customers(customerNumber)
	,itemTotal			money			NOT NULL
	,total				money			NOT NULL
	,subTotal			money			NOT NULL
	,grandTotal			money			NOT NULL
	,cartItems			int				NOT NULL
	,qauntityOrdered	int				NOT NULL
		
		
)
GO



