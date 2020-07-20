
SELECT VendorContactFName
		,VendorContactLName
		,VendorName
FROM Vendors
ORDER BY VendorContactLName, VendorContactFName



SELECT InvoiceNumber AS Number,
       InvoiceTotal AS Total,
       PaymentTotal + CreditTotal AS Credits,
       InvoiceTotal - 
	   (PaymentTotal 
	   + CreditTotal) AS Balance
FROM Invoices;



SELECT VendorContactLName 
		+ ', ' 
		+ VendorContactFName 
		AS [Full Name]
FROM Vendors
ORDER BY VendorContactLName, VendorContactFName


SELECT InvoiceTotal
		,InvoiceTotal 
		/ 10 AS [10%]
		,InvoiceTotal 
		* 1.1 AS [Plus 10%]
FROM Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 1000
ORDER BY InvoiceTotal DESC


SELECT InvoiceNumber AS Number
		,InvoiceTotal AS Total
		,PaymentTotal 
		+ CreditTotal AS Credits,
        InvoiceTotal 
		- (PaymentTotal 
		+ CreditTotal) AS Balance
FROM Invoices
WHERE InvoiceTotal BETWEEN 500 AND 10000


SELECT VendorContactLName 
		+ ', ' 
		+ VendorContactFName AS [Full Name]
FROM Vendors
WHERE VendorContactLName LIKE '[A-C,E]%'
ORDER BY VendorContactLName, VendorContactFName


SELECT *
FROM Invoices
WHERE ((InvoiceTotal - PaymentTotal - CreditTotal <= 0) AND
      PaymentDate IS NULL) OR
      ((InvoiceTotal - PaymentTotal - CreditTotal > 0) AND
      PaymentDate IS NOT NULL)






