
SELECT VendorID
		,SUM(PaymentTotal) 
	AS PaymentSum
FROM Invoices
GROUP BY VendorID


SELECT TOP 10 VendorName
		,SUM(PaymentTotal) 
	AS PaymentSum
FROM Vendors JOIN Invoices
	ON Vendors.VendorID 
	= Invoices.VendorID
GROUP BY VendorName
ORDER BY PaymentSum DESC


SELECT VendorName
		,COUNT(*) 
	AS InvoiceCount
		,SUM(InvoiceTotal) 
	AS InvoiceSum
FROM Vendors JOIN Invoices
	ON Vendors.VendorID 
		= Invoices.VendorID
GROUP BY VendorName
ORDER BY InvoiceCount DESC


SELECT GLAccounts.AccountDescription
		,COUNT(*) 
	AS LineItemCount
		,SUM(InvoiceLineItemAmount) 
	AS LineItemSum
FROM GLAccounts JOIN InvoiceLineItems
	ON GLAccounts.AccountNo 
		= InvoiceLineItems.AccountNo
GROUP BY GLAccounts.AccountDescription
HAVING COUNT(*) > 1
ORDER BY LineItemCount DESC


SELECT GLAccounts.AccountDescription
		,COUNT(*) 
	AS LineItemCount
		,SUM(InvoiceLineItemAmount) 
	AS LineItemSum
FROM GLAccounts JOIN InvoiceLineItems
	ON GLAccounts.AccountNo 
		= InvoiceLineItems.AccountNo
 JOIN Invoices
	ON InvoiceLineItems.InvoiceID 
		= Invoices.InvoiceID
WHERE InvoiceDate BETWEEN '2011-12-01' 
		AND '2012-02-29'
GROUP BY GLAccounts.AccountDescription
HAVING COUNT(*) > 1
ORDER BY LineItemCount DESC


SELECT AccountNo
		,SUM(InvoiceLineItemAmount) 
	AS LineItemSum
FROM InvoiceLineItems
GROUP BY AccountNo WITH ROLLUP


SELECT VendorName
		,AccountDescription
		,COUNT(*) 
	AS LineItemCount
		,SUM(InvoiceLineItemAmount) 
	AS LineItemSum
FROM Vendors JOIN Invoices
	ON Vendors.VendorID 
		= Invoices.VendorID
 JOIN InvoiceLineItems
   ON Invoices.InvoiceID 
		= InvoiceLineItems.InvoiceID
 JOIN GLAccounts
   ON InvoiceLineItems.AccountNo 
		= GLAccounts.AccountNo
GROUP BY VendorName
		,AccountDescription
ORDER BY VendorName, AccountDescription


SELECT VendorName,
       COUNT(DISTINCT InvoiceLineItems.AccountNo) 
	AS [# of Accounts]
FROM Vendors JOIN Invoices
	ON Vendors.VendorID 
		= Invoices.VendorID
 JOIN InvoiceLineItems
	ON Invoices.InvoiceID 
		= InvoiceLineItems.InvoiceID
GROUP BY VendorName
HAVING COUNT(DISTINCT InvoiceLineItems.AccountNo) > 1
ORDER BY VendorName
