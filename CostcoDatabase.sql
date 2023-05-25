DROP DATABASE IF EXISTS CostcoDatabase;
CREATE DATABASE CostcoDatabase;

USE CostcoDatabase;

DROP TABLE IF EXISTS Members;
CREATE TABLE Members
( MemberID			BIGINT NOT NULL IDENTITY(1,1),
  FirstName			VARCHAR(25) NOT NULL,
  MiddleName		VARCHAR(25) DEFAULT NULL,
  LastName			VARCHAR(25) NOT NULL,
  PhoneNumber		VARCHAR(15) NOT NULL,
  StreetAddress		VARCHAR(35) NOT NULL,
  City				VARCHAR(25) NOT NULL,
  State				CHAR(2) NOT NULL,
  ZipCode			VARCHAR(10) NOT NULL,
  MemberType		VARCHAR(10) NOT NULL,
  EmailOptIn			CHAR(1) NOT NULL DEFAULT 'Y'
  CONSTRAINT PK_Customers_MemberID PRIMARY KEY ( MemberID ),
  CONSTRAINT CHECK_Members_EmailOptIn CHECK ( EmailOptIn IN ( 'Y','N' ) )
);

CREATE UNIQUE INDEX UIX_Members_FullName ON Members ( FirstName, MiddleName, LastName );

DROP TABLE IF EXISTS Executive;
CREATE TABLE Executive
( MemberID			BIGINT NOT NULL,
  PercentBack		CHAR(1) DEFAULT '2'
  CONSTRAINT PK_Executive_MemberID PRIMARY KEY ( MemberID )
  CONSTRAINT FK_Executive_MemberID FOREIGN KEY ( MemberID ) REFERENCES Members ( MemberID ),
);



DROP TABLE IF EXISTS GoldStar;
CREATE TABLE GoldStar
( MemberID			BIGINT NOT NULL,
  Cards			CHAR(1) DEFAULT '1'
  CONSTRAINT PK_GoldStar_MemberID PRIMARY KEY ( MemberID )
  CONSTRAINT FK_GoldStar_MemberID FOREIGN KEY ( MemberID ) REFERENCES Members ( MemberID ),
);

DROP TABLE IF EXISTS Business;
CREATE TABLE Business
( MemberID			BIGINT NOT NULL,
  BusinessName		VARCHAR(25) NOT NULL,
  CONSTRAINT PK_Business_MemberID PRIMARY KEY ( MemberID ),
  CONSTRAINT FK_Business_MemberID FOREIGN KEY ( MemberID ) REFERENCES Members ( MemberID )
);

DROP TABLE IF EXISTS MemberEmails;
CREATE TABLE MemberEmails
( MemberID				BIGINT NOT NULL,
  EmailAddress			VARCHAR(254) NOT NULL,
  PrimaryEmailFlag		CHAR(1) NOT NULL DEFAULT 'Y',
  
  CONSTRAINT PK_MemberEmails_MemberID_EmailAddress PRIMARY KEY ( MemberID, EmailAddress ),
  CONSTRAINT FK_MemberEmails_MemberID FOREIGN KEY ( MemberID ) REFERENCES Members ( MemberID ),
  CONSTRAINT CHECK_MemberEmails_PrimaryEmailFlag CHECK ( PrimaryEmailFlag IN ( 'Y', 'N' ) )
);

DROP TABLE IF EXISTS Stores;
CREATE TABLE Stores
( StoreID				SMALLINT NOT NULL IDENTITY(1,1),
  StreetAddress			VARCHAR(35) NOT NULL,
  City					VARCHAR(25) NOT NULL,
  [State]				CHAR(2) NOT NULL,
  ZipCode				VARCHAR(10) NOT NULL
  CONSTRAINT PK_Stores_StoreID PRIMARY KEY ( StoreID )
);


DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees
( EmployeeID			INT NOT NULL IDENTITY(1,1),
  StoreID				SMALLINT NOT NULL,
  SSN					VARCHAR(10) NOT NULL,
  FirstName				VARCHAR(25) NOT NULL,
  MiddleName			VARCHAR(25) DEFAULT NULL,
  LastName				VARCHAR(25) NOT NULL,
  StreetAddress			VARCHAR(35) NOT NULL,
  City					VARCHAR(25) NOT NULL,
  State					CHAR(2) NOT NULL,
  ZipCode				VARCHAR(10) NOT NULL,
  HourlyWage				DECIMAL(5,2) NOT NULL,
  EmployeeType				VARCHAR(15) NOT NULL
  CONSTRAINT PK_Employees_EmployeeID PRIMARY KEY ( EmployeeID ),
  CONSTRAINT FK_Employees_StoreID FOREIGN KEY ( StoreID ) REFERENCES Stores (StoreID)
);

CREATE UNIQUE INDEX UIX_Employees_FullName ON Employees ( FirstName, MiddleName, LastName );

DROP TABLE IF EXISTS Administrator;
CREATE TABLE Administrator
( EmployeeID			INT NOT NULL,
  Department			VARCHAR(25) NOT NULL
  CONSTRAINT PK_Adminsistrator_EmployeeID PRIMARY KEY ( EmployeeID ),
  CONSTRAINT FK_Adminsistrator_EmployeeID FOREIGN KEY ( EmployeeID ) REFERENCES Employees ( EmployeeID )
);

DROP TABLE IF EXISTS Cashier;
CREATE TABLE Cashier
( EmployeeID			INT NOT NULL,
  RegisterID			CHAR(3) NOT NULL
  CONSTRAINT PK_Cashier_EmployeeID PRIMARY KEY ( EmployeeID )
  CONSTRAINT FK_Cashier_EmployeeID FOREIGN KEY ( EmployeeID ) REFERENCES Employees ( EmployeeID )
);

DROP TABLE IF EXISTS FoodService;
CREATE TABLE FoodService
( EmployeeID			INT NOT NULL,
  Station				VARCHAR(25) NOT NULL
  CONSTRAINT PK_FoodService_EmployeeID PRIMARY KEY ( EmployeeID )
  CONSTRAINT FK_FoodService_EmployeeID FOREIGN KEY ( EmployeeID ) REFERENCES Employees ( EmployeeID )
);

DROP TABLE IF EXISTS Schedule;
CREATE TABLE Schedule
( ScheduleID			INT NOT NULL,
  EmployeeID			INT NOT NULL,
  WorkDate				Date NOT NULL,
  HoursWorked				DECIMAL(4,2) NOT NULL
  CONSTRAINT PK_Schedule_ScheduleID_EmployeeID PRIMARY KEY ( ScheduleID, EmployeeID )
  CONSTRAINT FK_Schedule_EmployeeID FOREIGN KEY ( EmployeeID ) REFERENCES Employees ( EmployeeID )
);


DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders
( OrderID				INT NOT NULL IDENTITY(1,1),
  MemberID				BIGINT NOT NULL,
  OrderDate				DATE NOT NULL,
  OrderTime				TIME NOT NULL,
  StoreID				SMALLINT NOT NULL,
  OrderStatus				VARCHAR(15) NOT NULL
  CONSTRAINT PK_Orders_OrderID PRIMARY KEY ( OrderID ),
  CONSTRAINT FK_Orders_MemberID FOREIGN KEY ( MemberID ) REFERENCES Members ( MemberID ),
  CONSTRAINT FK_Orders_StoreID FOREIGN KEY ( StoreID ) REFERENCES Stores ( StoreID )
);

DROP TABLE IF EXISTS Products;
CREATE TABLE Products
( ProductID					INT NOT NULL IDENTITY (1,1),
  ProductName				VARCHAR(50) NOT NULL,
  ProductDescription		VARCHAR(500) NOT NULL,
  SalesPrice				DECIMAL(9,2) NOT NULL,
  InventoryOnHand			SMALLINT NOT NULL
  CONSTRAINT PK_Products_ProductID PRIMARY KEY ( ProductID )
);

DROP TABLE IF EXISTS OrderLines;
CREATE TABLE OrderLines
( OrderID					INT NOT NULL,
  ProductID					INT NOT NULL,
  Price						DECIMAL(9,2) NOT NULL,
  Quantity					TINYINT NOT NULL
  CONSTRAINT PK_OrderLines_OrderID_ProductID PRIMARY KEY ( OrderID, ProductID ),
  CONSTRAINT FK_OrderLines_OrderID FOREIGN KEY (OrderID ) REFERENCES Orders ( OrderID ),
  CONSTRAINT FK_OrderLines_ProductID FOREIGN KEY (ProductID ) REFERENCES Products ( ProductID )
);

DROP TABLE IF EXISTS Vendors;
CREATE TABLE Vendors
( VendorID					SMALLINT NOT NULL IDENTITY(1,1),
  VendorName				VARCHAR(25) NOT NULL,
  VendorDescription			VARCHAR(100) NOT NULL
  CONSTRAINT PK_Vendors_VendorID PRIMARY KEY ( VendorID )
);

DROP TABLE IF EXISTS ProductVendors;
CREATE TABLE ProductVendors
( ProductID					INT NOT NULL,
  VendorID					SMALLINT NOT NULL,
  UnitCost					DECIMAL(9,2) NOT NULL
  CONSTRAINT PK_ProductVendors_ProductID_VendorID PRIMARY KEY ( ProductID, VendorID ),
  CONSTRAINT FK_ProductVendors_ProductID FOREIGN KEY ( ProductID ) REFERENCES Products ( ProductID ),
  CONSTRAINT FK_ProductVendors_VendorID FOREIGN KEY ( VendorID ) REFERENCES Vendors ( VendorID )
);







