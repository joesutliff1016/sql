DROP TABLE InvoiceCopy
DROP TABLE VendorCopy

SELECT *
INTO InvoiceCopy
FROM Invoices

SELECT *
INTO VendorCopy
FROM Vendors


INSERT InvoiceCopy
VALUES (32, 'AX-014-027', '2012-6-21', 434.58, 0, 0,
        2, '2012-07-08', NULL)


INSERT VendorCopy
SELECT VendorName 
	  ,VendorAddress1
	  ,VendorAddress2
      ,VendorCity
	  ,VendorState
	  ,VendorZipCode
      ,VendorPhone
	  ,VendorContactLName
	  ,VendorContactFName
      ,DefaultTermsID
	  ,DefaultAccountNo
FROM Vendors
WHERE VendorState <> 'CA'


UPDATE VendorCopy
SET DefaultAccountNo = 403
WHERE DefaultAccountNo = 400


UPDATE InvoiceCopy
SET PaymentDate = GETDATE(),
    PaymentTotal = InvoiceTotal - CreditTotal
WHERE InvoiceTotal - CreditTotal - PaymentTotal > 0


UPDATE InvoiceCopy
SET TermsID = 2
WHERE VendorID IN
    (SELECT VendorID
     FROM VendorCopy
     WHERE DefaultTermsID = 2)


UPDATE InvoiceCopy
SET TermsID = 2
FROM InvoiceCopy JOIN VendorCopy
  ON InvoiceCopy.VendorID = VendorCopy.VendorID
WHERE DefaultTermsID = 2



DELETE VendorCopy
WHERE VendorState = 'MN'


DELETE VendorCopy
WHERE VendorState NOT IN
  (SELECT DISTINCT VendorState
   FROM VendorCopy JOIN InvoiceCopy
     ON VendorCopy.VendorID = InvoiceCopy.VendorID)
