--Name: Ariful Islam Shapla
--TraineeID:1280425

--Create Restaurant Mangement Database
USE MASTER
GO
IF DB_ID ('Restaurant') IS NOT NULL
DROP DATABASE Restaurant
go
create DAtabase Restaurant
on
(NAME='Restaurant_Data_1',
FileName='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER2022\MSSQL\DATA\Restaurant_Data_1.mdf',
Size=25 MB,
Maxsize=100mb,
FileGrowth=5%
)
log on
(NAME='Restaurant_Log_1',
FileName='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER2022\MSSQL\DATA\Restaurant_Log_1.ldf',
Size=2MB,
Maxsize=25mb,
FileGrowth=1%
);


--Create Table on Restaurant

USE Restaurant
GO
CREATE TABLE Catagory (
	CatagoryID INT PRIMARY KEY,
	CatagoryName VARCHAR(50)
);

GO
CREATE TABLE MenuItems (
    MenuItemID INT PRIMARY KEY,
    MenuName VARCHAR(50),
    Price DECIMAL(10, 2),
    CategoryID INT REFERENCES Catagory(CatagoryID),
);

GO
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    PhoneNumber VARCHAR(15),
    EmailAddress VARCHAR(50)
);

GO
CREATE TABLE Seat(
    SeatID INT PRIMARY KEY,
    SeatName VARCHAR(50),
    Capacity INT
);

GO
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
	SeatID INT FOREIGN KEY REFERENCES Seat(SeatID),
    OrderDate DATETIME,
    Amount DECIMAL(10, 2)
);

GO
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    MenuItemID INT FOREIGN KEY REFERENCES MenuItems(MenuItemID),
    Quantity INT,
    Subtotal DECIMAL(10, 2)
);

GO
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    PaymentDate DATE,
    TotalAmount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50)
);

GO
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
	Position VARCHAR(50)
);

GO
CREATE TABLE Feedback
(FeedbackID INT PRIMARY KEY NOT NULL,
Rating INT ,
Comment VARCHAR(50) 
)

----ALTER QUERY

ALTER TABLE Feedback
ADD Status VARCHAR(50);

----DROP QUERY

DROP TABLE Feedback


-- Give An Example Of Squence--------
CREATE SEQUENCE SQObject
AS int
START WITH 1 INCREMENT BY 1
MINVALUE 0 MAXVALUE 10000
CYCLE CACHE 10

--Drop sequence

DROP SEQUENCE SQObject

--Give an Example OF USING VIEW With Encryption 

GO
CREATE VIEW PaymentDetails
WITH ENCRYPTION
AS
SELECT TotalAmount,PaymentMethod
FROM Payments




--Store Procedure of Using INPUT AND OUTPUT PARAMETER

CREATE PROC spOrderWiseCustomerNameandAmount
@OrderID INT,
@CustomerName VARCHAR(50) OUTPUT,
@Amount MONEY OUTPUT
AS
BEGIN
SELECT @Amount=Amount,@CustomerName=(FirstName+' '+LastName)
FROM Orders AS O JOIN Customers AS C
ON O.CustomerID=C.CustomerID
WHERE OrderID=@OrderID
END


--Example of Schaler Valued Function

CREATE FUNCTION fnDateWiseAmount(@PaymentDate DATE) 
RETURNS MONEY
AS
BEGIN
DECLARE @TotalAmount MONEY
SELECT @TotalAmount=TotalAmount 
FROM Payments
WHERE PaymentDate=@PaymentDate
RETURN @TotalAmount
END


--Example of TABLE VALUED FUNCTION 


CREATE FUNCTION fnCustomerNameWiseMenuName()
RETURNS TABLE
AS
RETURN
(SELECT (FirstName+' '+LastName)AS CustomerName,MenuName FROM Orders AS O JOIN Customers AS C
ON O.CustomerID=C.CustomerID
JOIN OrderItems AS OD
ON O.OrderID=OD.OrderID
JOIN MenuItems AS M
ON OD.MenuItemID=M.MenuItemID)

-- Give an Example of Another Table-valued function

CREATE FUNCTION fnGetOrdersByCustomer(@CustomerId INT)
RETURNS TABLE
AS
RETURN
(
SELECT 
O.OrderID,
O.OrderDate,
O.Amount,
M.MenuItemID,
M.MenuName,
OI.Quantity,
OI.Subtotal
FROM Orders AS O JOIN OrderItems AS OI 
ON O.OrderID = OI.OrderID
JOIN MenuItems AS M 
ON OI.MenuItemID = M.MenuItemID
WHERE O.CustomerID = @CustomerId
);


--Example of Multi-statement table-valued function
CREATE FUNCTION fnGetOrderSummaryByCustomer(@customerId INT)
RETURNS @OrderSummary TABLE 
(
 OrderID INT,
 OrderDate DATE,
 TotalQuantity INT,
 TotalAmount DECIMAL(10, 2)
)
AS
BEGIN
 DECLARE @OrderId INT;
INSERT INTO @OrderSummary (OrderID, OrderDate, TotalQuantity, TotalAmount)
SELECT 
OI.OrderID,
OrderDate,
SUM(Quantity) AS TotalQuantity,
SUM(Amount) AS TotalAmount
FROM 
Orders as O join OrderItems AS OI ON O.OrderID=OI.OrderID 
GROUP BY 
OI.OrderID, OrderDate
RETURN;
END;


-- Example of AFTER TRIGGER INSERT

CREATE TRIGGER trCustomersInsert
ON Customers
AFTER INSERT
AS
DECLARE @CustomerID INT,@FirstName VARCHAR(50),
@LastName VARCHAR(50),@PhoneNumber VARCHAR(20),@EmailAddress VARCHAR(50)
SELECT @CustomerID=CustomerID FROM inserted
SELECT @FirstName=FirstName FROM inserted
SELECT @LastName=@LastName FROM inserted
SELECT @PhoneNumber=PhoneNumber FROM inserted
SELECT @EmailAddress=EmailAddress FROM inserted
BEGIN
INSERT INTO CustomerNewInsert (CustomerID,FirstName,
LastName,PhoneNumber,EmailAddress) VALUES
(@CustomerID,@FirstName,@LastName,@PhoneNumber,@EmailAddress);

PRINT 'Inserted Successfully'
END



--Example of AFTER TRIGGER DELETE

CREATE TRIGGER trPaymentDelete
ON Payments
AFTER DELETE
AS
DECLARE @PaymentID INT
SELECT @PaymentID=Paymentid FROM deleted
DECLARE @OrderID INT
SELECT @OrderID=OrderID FROM deleted
DECLARE @PaymentDate DATE
SELECT @PaymentDate=PaymentDate FROM deleted
DECLARE @TotalAmount DECIMAL
SELECT @TotalAmount=TotalAmount FROM deleted
DECLARE @PaymentMethod VARCHAR(50)
SELECT @PaymentMethod=PaymentMethod FROM deleted

IF @TotalAmount>500
BEGIN
RAISERROR ('Cannot Deleted',11,1)
ROLLBACK
END
ELSE
BEGIN
PRINT 'Deleted sucessfully'
END
INSERT INTO PaymentDelete (PaymentID,OrderID,PaymentDate,TotalAmount,PaymentMethod)
VALUES
(@PaymentID,@OrderID,@PaymentDate,@TotalAmount,@PaymentMethod);



--Example of Instead of INSERT TRIGGER

DROP TRIGGER IF EXISTS trInsteadOfInsert
GO
CREATE TRIGGER trInsteadOfInsert
ON Customers
INSTEAD OF INSERT
AS
BEGIN
DECLARE @PhoneNumber Varchar(20)
SELECT @PhoneNumber=PhoneNumber FROM inserted
if @PhoneNumber IS NULL
BEGIN
RAISERROR('Cannot Inserted',16,1)
ROLLBACK
END
else
BEGIN
PRINT 'Inserted Successfully!!'
END
END


--Example of Instead of Delete TRIGGER

DROP TRIGGER IF EXISTS trInsteadOfDelete
GO
CREATE TRIGGER trInsteadOfDelete
ON Orders
INSTEAD OF DELETE
AS
BEGIN
DECLARE @Amount money
SELECT @Amount=Amount FROM deleted
if @Amount>500
BEGIN
RAISERROR('Cannot Delete',16,1)
ROLLBACK
END
else
BEGIN
PRINT 'Deleted Successfully!!'
END
END


