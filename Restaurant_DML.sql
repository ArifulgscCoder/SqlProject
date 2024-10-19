
USE Restaurant
GO
INSERT INTO Catagory (CatagoryID,CatagoryName)
VALUES
	(211,'Basmati_kacci'),
	(212,'Curry'),
	(213,'Polao'),
	(214,'Dessert'),
	(215,'Beverage');

GO
INSERT INTO Customers(CustomerID,FirstName,LastName,EmailAddress,PhoneNumber)
VALUES
		(101,'Ariful',	'Islam',	'Ariful@gmail.com',	'01908933132'),
		(102,'Azizul',	'Rahman',	'Azizul@gmail.com',	'01763555663'),
		(103,'Rakib',	'Khan',		'rakib@gmail.com',	'01687526554'),
		(104,'Shuvo',	'Sarkar',	'shuvo@gmail.com',	'01856364752'),
		(105,'Emrul',	'Hasan',	'emrul@gmail.com',	'01687569958'),
		(106,'Monirul', 'Talukder',	'monirul@gmail.com','01756932551'),
		(107,'Rayhan',	'Khan',		'rayhan@gmail.com',	'01693548566'),
		(108,'Shafiq',	'Sheikh',	'shafiq@gmail.com',	'01526458965'),
		(109,'Mojibur',	'Rahman',	'Mojibur@gmail.com','01636585485'),
		(110,'Shaon',	'Talukder',	'shaon@gmail.com',	'01580405081')

GO
INSERT INTO Seat(SeatID,SeatName,Capacity)
VALUES
	(1,'Seat-1',2),
	(2,'Seat-2',4),
	(3,'Seat-3',6),
	(4,'Seat-4',3),
	(5,'Seat-5',4),
	(6,'Seat-6',2),
	(7,'Seat-7',2),
	(8,'Seat-8',5)


GO
INSERT INTO MenuItems(MenuItemID,MenuName,Price,CategoryID)
VALUES
	(1,'Basmati Kacchi Half',			379,211),
	(2,'Basmati Kacchi 1:1',			580,211),
	(3,'Basmati Kacchi 1:3',			1579,211),
	(4,'Basmati Kacchi 1:5',			2699,211),
	(5,'Beef Rezala',					200,212),
	(6,'Chicken Roast',					150,212),
	(7,'Whole Chicken Roast',			500,212),
	(8,'Plain Polao',					120,213),
	(9,'Murog Polao',					299,213),
	(10,'Firni',						70,214),
	(11,'Jorda',						70,214),
	(12,'Borhani - 1 Glass',			80,215),
	(13,'Zafrani Sorbot - 1 Glass',		90,215),
	(14,'Soft Drinks - 1 Glass',		40,215)

GO
INSERT INTO Orders (OrderID, CustomerID, SeatID,OrderDate, TotalAmount)
VALUES
	    (1, 101, 5,'2023-12-15 ', 918),
	    (2, 102, 3,'2023-12-16 ', 1740),
	    (3, 103, 2,'2023-12-17 ', 2899),
	    (4, 104, 6,'2023-12-18 ', 640),
		(5, 105, 1,'2023-12-19 ', 938),
	    (6, 106, 8,'2023-12-20 ', 1819),
	    (7, 107, 4,'2023-12-21 ', 760),
	    (8, 108, 7,'2023-12-22 ', 758),
		(9, 109, 2,'2023-12-23 ', 960),
	    (10,110, 3,'2023-12-24 ', 3379)
    
	

GO
INSERT INTO OrderItems (OrderItemID, OrderID, MenuItemID, Quantity, Subtotal)
VALUES
    (301, 1,	1,	2,	758),
    (302, 1,	12,	2,	160),
    (303, 2,	2,	3,	1740),
    (304, 3,	4,	1,	2699),
    (305, 3,	14,	5,	200),
    (306, 4,	7,	1,	500),
    (307, 4,	10,	2,	140),
	(308, 5,	1,	2,	758),
    (309, 5,	13,	2,	180),
    (310, 6,	3,	1,	1579),
    (311, 6,	12,	3,	240),
    (312, 7,	6,	4,	600),
    (313, 7,	14,	4,	160),
    (314, 8,	9,	2,	598),
	(315, 8,	12,	2,	160),
    (316, 9,	8,	6,	720),
    (317, 9,	14,	6,	240),
    (318, 10,	4,	1,	2699),
    (319, 10,	12,	5,	400),
    (320, 10,	10, 4,	280);
    

GO
INSERT INTO Payments (PaymentID, OrderID, PaymentDate, TotalAmount, PaymentMethod)
VALUES
    (10001, 1,	'2023-12-15',	918,		'Cash'),
    (10002, 2,	'2023-12-16',	1740,		'Cash'),
    (10003, 3,	'2023-12-17',	2899,		'Debit Card'),
    (10004, 4,	'2023-12-18',	640,		'Cash'),
	(10005, 5,	'2023-12-19',	938,		'Bkash'),
    (10006, 6,	'2023-12-20',	1819,		'Nagad'),
    (10007, 7,	'2023-12-21',	760,		'Debit Card'),
    (10008, 8,	'2023-12-22',	758,		'Bkash'),
	(10009, 9,	'2023-12-23',	960,		'Cash'),
    (10010, 10,	'2023-12-24',	3379,		'Debit Card');

GO
INSERT INTO Staff(StaffID,FirstName,LastName,Position)
VALUES
	(1001, 'Jamal',	'Khan',		'Manager'),
	(2001, 'Kamal',	'Talukder', 'Chef'),
	(3001, 'Shaon', 'Sheikh',	'Cashier'),
	(4001, 'Joni',	'Ahmed',	'Waiter'),
	(5001, 'Lotif', 'Sarkar',	'Waiter'),
	(6001, 'Salam',	'Mondol',	'Waiter')


--Insert Query

INSERT INTO Staff 
VALUES
(7001,'Moslim','Uddin','Waiter')

--Update Query
UPDATE Staff
SET Position= 'CO-Chef'
WHERE StaffID=7001

--Delete Query
DELETE FROM Staff
WHERE StaffID=7001

--Insert BY SEQUENCE
INSERT INTO Orders VALUES
(NEXT VALUE FOR SQObject,111,5,'2023-12-24 00:00:00.000',2000)


--Give an Example of using AND Clause 

SELECT OrderID,OrderDate,TotalAmount FROM Orders
WHERE OrderDate<'2023-12-18' AND TotalAmount>700

--Give an Example Of NOT IN Clause

SELECT * FROM MenuItems
WHERE MenuName NOT IN ('Firni','Jorda') 
AND Price>100

--Give an Example Of BETWEEN Clause

SELECT * FROM Orders
WHERE OrderDate BETWEEN '2023-12-17 00:00:00.000' AND '2023-12-23 00:00:00.000'


--Give an Example Of using WILDCARD

SELECT MenuName,Price FROM MenuItems
WHERE MenuName LIKE 'Basmati%'

--Give an Example Of OFFSET FETCH

SELECT * FROM OrderItems
ORDER BY OrderItemID
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY

--Give an Example Of JOIN Query

SELECT C.CatagoryName, COUNT(O.OrderID)AS NumberOfOrders
FROM MenuItems AS M JOIN Catagory AS C 
ON M.CategoryID =C.CatagoryID
JOIN OrderItems AS OI 
ON M.MenuItemID = OI.MenuItemID
JOIN Orders AS O
ON OI.OrderID = O.OrderID
GROUP BY C.CatagoryName;

--Give an Example Of GROUP Query

SELECT OrderID,PaymentDate,PaymentMethod,AVG(TotalAmount) 
FROM Payments
GROUP BY OrderID,PaymentDate,PaymentMethod
HAVING AVG(TotalAmount)>1500


--Give an Example Of SUBQuery

SELECT C.CustomerID,(C. FirstName +' '+ C. LastName) AS CustomerName,
OrderDate,Amount FROM Orders AS O
JOIN Customers AS C
ON O.CustomerID=C.CustomerID
WHERE O.CustomerID IN
(SELECT CustomerID FROM Customers)

--Give Example of correlated subquery


SELECT OrderID,PaymentDate,PaymentMethod,TotalAmount 
FROM Payments
WHERE TotalAmount>
(SELECT AVG(TotalAmount) FROM Payments)


--Example of CUBE Operator

SELECT PaymentID,PaymentMethod,SUM(TotalAmount) AS SumAmount
FROM Payments
GROUP BY CUBE (PaymentID,PaymentMethod)

----Example of ROLLUP Operator
SELECT PaymentID,PaymentMethod,SUM(TotalAmount) AS SumAmount
FROM Payments
GROUP BY ROLLUP (PaymentID,PaymentMethod)


----Example of GROUPING SETS Operator
SELECT PaymentID,PaymentMethod,SUM(TotalAmount) AS SumAmount
FROM Payments
GROUP BY GROUPING SETS (PaymentID,PaymentMethod)

--Example of OVER clause

SELECT PaymentID,PaymentMethod,
SUM(TotalAmount) OVER (PARTITION BY PaymentMethod) AS SumPaymentAmount,
AVG(TotalAmount) OVER (PARTITION BY PaymentMethod) AS AvgPaymentAmount
FROM Payments


--Example of ANY Keyword

SELECT OrderID,PaymentDate,PaymentMethod,AVG(TotalAmount) AS AvgTotalAmount
FROM Payments
GROUP BY OrderID,PaymentDate,PaymentMethod
HAVING AVG(TotalAmount)>ANY
(SELECT PaymentID FROM Payments
WHERE PaymentID=30001
)



--Example of ALL Keyword

SELECT OrderID,PaymentDate,PaymentMethod,AVG(TotalAmount) AS AvgTotalAmount
FROM Payments
GROUP BY OrderID,PaymentDate,PaymentMethod
HAVING AVG(TotalAmount)=ALL
(SELECT PaymentID FROM Payments
WHERE PaymentID=30001)



--Example of SOME Keyword

SELECT OrderID,PaymentDate,PaymentMethod,AVG(TotalAmount) AS AvgTotalAmount
FROM Payments
GROUP BY OrderID,PaymentDate,PaymentMethod
HAVING AVG(TotalAmount)<SOME
(SELECT PaymentID FROM Payments
WHERE PaymentID=30001)

--An Example on CTE

WITH Summary 
AS
(
SELECT O.MenuItemID,Quantity,Subtotal,PaymentDate,PaymentMethod FROM Payments AS P
JOIN OrderItems AS O
ON O.OrderID=P.OrderID
)
  SELECT Summary.MenuItemID,Summary.Quantity,Summary.Subtotal,
  Summary.PaymentDate,Summary.PaymentMethod 
  FROM Summary



--Example Of Case ----

GO
SELECT MenuName,Price,
CASE
	WHEN Price BETWEEN 300 AND 999 THEN 'Expensive Menu'
	WHEN Price>1000 THEN 'More Expensive Menu'
ELSE 'Inexpensive Menu'
END AS MenuDetals
FROM MenuItems


--Example of IIF Function

GO
SELECT OrderID,Amount,
IIF (AMOUNT>1000,'Discount 100','No Discount') AS DiscountDetails
FROM Orders


----Statement to Cast

SELECT CAST('2023-12-17 00:00:00.000' AS DATE) AS CastDate;

--Statement to Convert

SELECT CONVERT(TIME, '2023-12-17 00:00:00.000') AS ConvertedTime;



--Justify Of VIEW

SELECT * FROM PaymentDetails

--Justify Store Procedure of Using INPUT AND OUTPUT PARAMETER

DECLARE @CustomerName VARCHAR(50)
DECLARE @Amount MONEY
EXEC  spOrderWiseCustomerNameandAmount 5,@CustomerName OUTPUT,@Amount OUTPUT
PRINT @CustomerName 
PRINT @Amount;

--justify Schaler Valued Function

SELECT dbo.fnDateWiseAmount('2023-12-17')


--Justify of TABLE VALUED FUNCTION

SELECT * FROM dbo.fnCustomerNameWiseMenuName()


---Justify of TABLE VALUED FUNCTION 2

SELECT * FROM dbo.fnGetOrdersByCustomer(101)


--Justify of Multi-statement table-valued function

SELECT * FROM fnGetOrderSummaryByCustomer(1)

--justify of AFTER TRIGGER DELETE

DELETE FROM Payments
WHERE TotalAmount=1000
