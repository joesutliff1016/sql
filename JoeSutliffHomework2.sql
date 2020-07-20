SELECT *
FROM Vendors JOIN 
		Invoices ON 
	Vendors.VendorID 
		= Invoices.VendorID


SELECT VendorName
		,InvoiceNumber
		,InvoiceDate
		,InvoiceTotal 
		- PaymentTotal 
		- CreditTotal AS Balance
FROM Vendors JOIN Invoices
  ON Vendors.VendorID 
	= Invoices.VendorID
WHERE InvoiceTotal 
	- PaymentTotal 
	- CreditTotal > 0
ORDER BY VendorName


SELECT VendorName
	,DefaultAccountNo
	,AccountDescription
FROM Vendors JOIN 
	GLAccounts ON 
	Vendors.DefaultAccountNo 
	= GLAccounts.AccountNo
ORDER BY AccountDescription, VendorName


SELECT VendorName
		,InvoiceNumber
		,InvoiceDate
		,InvoiceTotal 
		- PaymentTotal 
		- CreditTotal AS Balance
FROM Vendors, Invoices
WHERE Vendors.VendorID 
		= Invoices.VendorID
		AND InvoiceTotal 
		- PaymentTotal 
		- CreditTotal > 0
ORDER BY VendorName


SELECT VendorName AS Vendor, 
		InvoiceDate AS Date
		,InvoiceNumber AS Number
		,InvoiceSequence AS [#]
		,InvoiceLineItemAmount AS LineItem
FROM Vendors AS v JOIN Invoices AS i
  ON v.VendorID = i.VendorID
 JOIN InvoiceLineItems AS li
   ON i.InvoiceID = li.InvoiceID
ORDER BY Vendor, Date, Number, [#]


SELECT DISTINCT v1.VendorID, v1.VendorName,
       v1.VendorContactFName 
	   + ' ' 
	   + v1.VendorContactLName AS Name
FROM Vendors AS v1 JOIN Vendors AS v2
ON (v1.VendorID <> v2.VendorID) AND
   (v1.VendorContactFName = v2.VendorContactFName)
ORDER BY Name


SELECT GLAccounts.AccountNo
		,AccountDescription
FROM GLAccounts LEFT JOIN InvoiceLineItems
  ON GLAccounts.AccountNo 
	= InvoiceLineItems.AccountNo
WHERE InvoiceLineItems.AccountNo IS NULL
ORDER BY GLAccounts.AccountNo


  SELECT VendorName
		,VendorState
  FROM Vendors
  WHERE VendorState = 'CA'
UNION
  SELECT VendorName, 'Outside CA'
  FROM Vendors
  WHERE VendorState <> 'CA'
ORDER BY VendorName
