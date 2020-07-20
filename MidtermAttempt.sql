
SELECT *
FROM Offices
ORDER BY Country
		,State
		,City



SELECT LastName
	AS NumberOfEmployees
FROM Employees



SELECT CustomerName AS C
       ,salesRepEmployeeNumber 
	   ,LastName +',' + FirstName AS E
FROM Customers JOIN Employees 
ON salesRepEmployeeNumber = employeeNumber
ORDER BY customerName



SELECT productName
	   ,orderNumber
	   ,quantityInStock
FROM Products JOIN OrderDetails
ON Products.productCode = OrderDetails.productCode


SELECT employeeNumber
       ,LastName +',' + FirstName AS EmployeeName
FROM Employees JOIN Offices
ON Employees.officeCode = Offices.officeCode
WHERE city = 'Sydney'


SELECT productName
FROM Products
WHERE productName LIKE '%Ford%'


SELECT productName
FROM Products
WHERE productName LIKE '%Honda%'



 
SELECT orderNumber
		,orderDate
FROM Orders
WHERE orderDate BETWEEN '2003-03-01' AND '2004-01-01'
ORDER BY orderDate DESC                      
   








		 



