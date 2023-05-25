USE CostcoDatabase;


-- Query 1:

SELECT
	P.ProductName,
	SUM( OL.Quantity) AS 'Amount of Orders'
FROM Orders AS O
INNER JOIN OrderLines as OL ON O.OrderID = OL.OrderID
INNER JOIN Products as P ON OL.ProductID = P.ProductID
GROUP BY P.ProductID, P.ProductName
ORDER BY [Amount of Orders] ASC;



-- Query 2:

SELECT 
	V.VendorID,
	V.VendorName,
	COUNT(P.ProductID) AS 'Amount of Products'
FROM Products AS P
LEFT OUTER JOIN ProductVendors AS PV ON P.ProductID = PV.ProductID
RIGHT OUTER JOIN Vendors AS V ON PV.VendorID = V.VendorID
GROUP BY V.VendorID, V.VendorName;

-- Query 3:

SELECT 
	M.MemberID,
	CONCAT(M.FirstName,' ', COALESCE(M.MiddleName, ' '), ' ', M.LastName) AS 'Member Name',
	M.MemberType,
	O.OrderID,
	P.ProductID,
	P.ProductName
FROM Members AS M
LEFT OUTER JOIN Orders AS O ON M.MemberID = O.MemberID
LEFT OUTER JOIN OrderLines AS OL ON O.OrderID = OL.OrderID
LEFT OUTER JOIN Products AS P ON OL.ProductID = P.ProductID
WHERE M.MemberType = 'Business';

-- Query 4:

SELECT 
	E.EmployeeID,
	E.StoreID,
	CONCAT(E.FirstName, ' ', E.LastName) AS 'Employee Name',
	E.EmployeeType,
	SUM(S.HoursWorked) AS 'Total Hours Worked'
FROM Employees AS E
INNER JOIN Schedule AS S ON E.EmployeeID = S.EmployeeID
GROUP BY E.EmployeeID, E.FirstName, E.LastName, E.EmployeeType, E.StoreID
ORDER BY [Total Hours Worked] DESC;

-- Query 5:
SELECT 
	M.MemberID,
    CONCAT(M.FirstName,' ', COALESCE(M.MiddleName, ' '), ' ', M.LastName) AS 'Member Name',
    COUNT(O.OrderID) as 'Total Orders'
FROM Members as M
INNER JOIN Orders as O
	on M.MemberID = O.MemberID
GROUP BY M.MemberID, M.FirstName, M.MiddleName, M.LastName
ORDER BY M.MemberID;



-- Stored Procedure 1: Add Members	

USE CostcoDatabase;
GO
CREATE OR ALTER PROCEDURE AddMembers
( @FirstName			VARCHAR(25),
  @MiddleName		VARCHAR(25),
  @LastName			VARCHAR(25),
  @PhoneNumber		VARCHAR(15),
  @StreetAddress		VARCHAR(35),
  @City				VARCHAR(25),
  @State				CHAR(2),
  @ZipCode			VARCHAR(10),
  @MemberType		VARCHAR(10),
  @EmailOptIN		CHAR(1),
  @EmailAddress		VARCHAR(254),
  @PrimaryEmailFlag	CHAR(1)
)
AS
BEGIN
	DECLARE @MemberID BIGINT;

	BEGIN TRANSACTION;

		INSERT INTO Members ( FirstName, MiddleName, LastName, PhoneNumber, StreetAddress, City, State, ZipCode, MemberType )
		VALUES ( @FirstName, @MiddleName, @LastName, @PhoneNumber, @StreetAddress, @City, @State, @ZipCode, @MemberType );
		SET @MemberID = SCOPE_IDENTITY();

		INSERT INTO MemberEmails ( MemberID, EmailAddress, PrimaryEmailFlag )
		VALUES ( @MemberID, @EmailAddress, @PrimaryEmailFlag);

	COMMIT;
END

EXECUTE AddMembers 'Bobby', NULL, 'Newport', '9302139248', '2341 9th Street', 'Pawnee', 'IN', '47305', 'GoldStar','Y', 'bbgnew@gmail.com', 'Y';

SELECT * FROM Members;






-- Stored Procedure 2: Add Employees
GO 
CREATE OR ALTER PROCEDURE AddEmployees
( @StoreID				CHAR(1),
  @SSN					VARCHAR(10),
  @FirstName			VARCHAR(25),
  @MiddleName			VARCHAR(25),
  @LastName				VARCHAR(25),
  @StreetAddress		VARCHAR(35),
  @City					VARCHAR(25),
  @State				CHAR(2),
  @ZipCode				VARCHAR(10),
  @HourlyWage			DECIMAL(5,2),
  @EmployeeType			VARCHAR(15),
  @EmpTypeCategory		VARCHAR(25)
)
AS
BEGIN
	DECLARE @EmployeeID INT;

	BEGIN TRANSACTION;

		INSERT INTO Employees ( StoreID, SSN, FirstName, MiddleName, LastName, StreetAddress, City, State, ZipCode, HourlyWage, EmployeeType )
		VALUES (@StoreID, @SSN, @FirstName, @MiddleName, @LastName, @StreetAddress, @City, @State, @ZipCode, @HourlyWage, @EmployeeType )
		SET @EmployeeID = SCOPE_IDENTITY();
	
		IF (@EmployeeType = 'Administrator')
			BEGIN
				INSERT INTO Administrator ( EmployeeID, Department )
				VALUES ( @EmployeeID, @EmpTypeCategory);
			END
		ELSE IF ( @EmployeeType = 'Cashier' )
			BEGIN
				INSERT INTO Cashier ( EmployeeID, RegisterID )
				VALUES ( @EmployeeID, @EmpTypeCategory);
			END
		ELSE IF ( @EmployeeType = 'FoodService' )
			BEGIN
				INSERT INTO FoodService(EmployeeID, Station)
				VALUES ( @EmployeeID, @EmpTypeCategory);
			END
			
	COMMIT;
END

EXECUTE AddEmployees '1', '963886871', 'Gabe', NULL, 'Lewis', '4322 Ripple Street', 'Tallahassee', 'FL', '32301', '14', 'Administrator', 'Human Resources';
EXECUTE AddEmployees '3', '963886221', 'Jo', NULL, 'Bennett', '2345 Tide Boulevard', 'Tallahassee', 'FL', '32301', '14', 'FoodService', 'Bakery';


SELECT * FROM Employees;
SELECT * FROM Administrator;
SELECT * FROM FoodService;
SELECT * FROM Cashier;



-- Stored Procedure 3: Update Order Status

GO
CREATE OR ALTER PROCEDURE UpdateOrderStatus
( @OrderID			INT,
  @OrderStatus		VARCHAR(15)
)
AS
	BEGIN
		UPDATE Orders SET OrderStatus = @OrderStatus 
		WHERE OrderID = @OrderID;
END


EXECUTE UpdateOrderStatus '3', 'Fulfilled';

SELECT * FROM Orders;


-- Stored Procedure 4: Vendor with the Most Orders

GO
CREATE OR ALTER PROCEDURE VendorMostOrders
AS
BEGIN
SELECT 
	V.VendorID,
	V.VendorName,
	COUNT(O.OrderID) AS 'Total Orders',
	SUM(OL.Quantity) AS 'Quantity Ordered',
	SUM( (OL.Quantity) * OL.Price ) AS 'Total Sales'
FROM Vendors AS V
INNER JOIN ProductVendors AS PV	ON V.VendorID = PV.VendorID
INNER JOIN Products AS P ON PV.ProductID = P.ProductID
INNER JOIN OrderLines AS OL ON P.ProductID = OL.ProductID
INNER JOIN Orders AS O ON OL.OrderID = O.OrderID

GROUP BY V.VendorID, V.VendorName
ORDER BY V.VendorID ASC;
END;

GO
EXECUTE VendorMostOrders;





-- View 1: Back Orders by Store
GO
CREATE OR ALTER VIEW StoreOrders AS
	SELECT
		O.StoreID,
		O.OrderID,
		M.MemberID,
		CONCAT(M.FirstName, ' ', COALESCE(M.MiddleName, ' '), ' ', M.LastName) AS 'Member Name',
		ME.EmailAddress,
		O.OrderStatus,
		NULL AS 'Total Back Orders'
	FROM Orders AS O
	INNER JOIN Members AS M ON M.MemberID = O.MemberID
	INNER JOIN MemberEmails AS ME ON ME.MemberID = O.MemberID
	WHERE O.OrderStatus = 'Back Ordered'
	
	UNION

	SELECT
		NULL,
		NULL,
		NULL,
		'Total Back Orders',
		NULL,
		'Back Ordered',
		COUNT(OrderStatus)
	FROM Orders
	WHERE OrderStatus = 'Back Ordered'

SELECT *
FROM StoreOrders

-- View 2: Most Sales by Members

GO
CREATE OR ALTER VIEW MemberSalesMost AS
	SELECT 
		M.MemberID,
		M.MemberType,
		CONCAT(M.FirstName,' ', COALESCE(M.MiddleName, ' '), ' ', M.LastName) AS MemberName,
		SUM((OL.Price * OL.Quantity)) AS 'Total Spent'
	FROM Members AS M
	INNER JOIN Orders AS O ON M.MemberID = O.MemberID
	INNER JOIN OrderLines AS OL ON O.OrderID = OL.OrderID
	GROUP BY M.MemberID, M.FirstName, M.MiddleName, M.LastName, M.MemberType;


		
SELECT * FROM MemberSalesMost
ORDER BY [Total Spent] DESC

