CREATE DATABASE AircraftDB
GO

USE AircraftDB
GO

--category
CREATE TABLE tbl_Category
(
	categoryId INT IDENTITY PRIMARY KEY,
	categoryName NVARCHAR(70) NOT NULL
)

INSERT INTO tbl_Category VALUES('Military Aircraft'),('Jet Aircraft')

SELECT * FROM tbl_Category


--aircraft condition
CREATE TABLE tbl_AircraftCondition
(
	conditionId INT IDENTITY PRIMARY KEY,
	condition NVARCHAR(50) NOT NULL
)

INSERT INTO tbl_AircraftCondition VALUES('New'),('Used')
SELECT * FROM tbl_AircraftCondition

--manufacturer
CREATE TABLE tbl_Manufacturer
(
	mfId INT IDENTITY PRIMARY KEY,
	mfName NVARCHAR(100) NOT NULL
)
INSERT INTO tbl_Manufacturer VALUES('Bell'),('Beachcraft')
select * from tbl_Manufacturer

--Flight rule
CREATE TABLE tbl_FlightRule
(
	flRuleId INT IDENTITY PRIMARY KEY,
	flRule NVARCHAR(20) NOT NULL
)

INSERT INTO tbl_FlightRule VALUES('VFR'),('IFR')
SELECT * FROM tbl_FlightRule

--aircrafts
CREATE TABLE tbl_Aircrafts
(
	aircraftId INT IDENTITY(1001,1) PRIMARY KEY,
	slNo NVARCHAR(50) NOT NULL,
	category INT REFERENCES tbl_Category(categoryId) NOT NULL,
	aircraftCondition INT REFERENCES tbl_AircraftCondition(conditionId) NOT NULL,
	manufacturedBy INT REFERENCES tbl_Manufacturer(mfId) NOT NULL,
	productionDate DATE NOT NULL,
	UnitPrice MONEY NOT NULL,
	isAvailable BIT NULL,
	picUrl NVARCHAR(200) NULL
)

SELECT a.aircraftId,a.slNo,a.category,c.categoryName,a.aircraftCondition,con.condition,a.manufacturedBy,m.mfName,a.productionDate,a.UnitPrice,a.isAvailable,a.picUrl FROM tbl_Aircrafts a INNER JOIN tbl_Category c ON a.category=c.categoryId INNER JOIN tbl_AircraftCondition con ON a.aircraftCondition=con.conditionId INNER JOIN tbl_Manufacturer m ON a.manufacturedBy= m.mfId

INSERT INTO tbl_Aircrafts VALUES
('VR5248',1,1,1,'2012-12-12',15000000,1,'a1.jpeg'),
('VR5248',1,1,1,'2012-12-12',15000000,1,'a1.jpeg')

SELECT * FROM tbl_Aircrafts

--aircraft specification
CREATE TABLE tbl_Specification
(
	specId INT IDENTITY PRIMARY KEY,
	aircraftId INT REFERENCES tbl_Aircrafts(aircraftId) NOT NULL,
	noOfSeat INT NOT NULL,
	flightRule INT REFERENCES tbl_FlightRule(flRuleId) NOT NULL,
	engine NVARCHAR(100) NOT NULL,
	adsBEquiped BIT NULL
)

INSERT INTO tbl_Specification VALUES(1002,2,1,'Double Propellar',1)

select * from tbl_Specification
 SELECT s.specId,s.aircraftId,s.noOfSeat,s.flightRule,fr.flRule,s.engine,s.adsBEquiped,a.slNo FROM tbl_Specification s INNER JOIN tbl_Aircrafts a ON s.aircraftId=a.aircraftId INNER JOIN tbl_FlightRule fr ON s.flightRule = fr.flRuleId

--country
CREATE TABLE tbl_Country
(
	countryId INT IDENTITY PRIMARY KEY,
	countryName NVARCHAR(70) NOT NULL
)
INSERT INTO tbl_Country VALUES('Bangladesh'),('USA'),('Australia'),('Newzealand')

--gender
CREATE TABLE tbl_Gender
(
	genderId INT IDENTITY PRIMARY KEY,
	gender NVARCHAR(20) NOT NULL
)

INSERT INTO tbl_Gender VALUES('Female'),('Male')

--customers
CREATE TABLE tbl_Customers 
(
	customerId INT IDENTITY PRIMARY KEY,
	userId NVARCHAR(200) NOT NULL,
	customerName NVARCHAR(100) NOT NULL,
	customerGender INT REFERENCES tbl_Gender(genderId) NOT NULL,
	country INT REFERENCES tbl_Country(countryId) NOT NULL,
	contactNo NVARCHAR(11) NOT NULL,
	email NVARCHAR(200) NOT NULL,
	age INT NOT NULL,
	accountPassword NVARCHAR(200) NOT NULL
)

SELECT * FROM tbl_Customers

INSERT INTO tbl_Customers VALUES
('safiaTabassum','Safia Tabassum',1,1,'01584256932','st@gmail.com',36,'saf123'),
('ahanaSarkar','Ahana Sarkar',1,2,'01523695485','as@gmail.com',26,'aha123'),
('afrinJahan','Afrin Jahan',1,1,'01584254258','aj@gmail.com',36,'afj123'),
('mohonaAlam','Mohona Alam',1,1,'01845856932','ma@gmail.com',45,'moh123')

SELECT cus.customerId,cus.userId,cus.customerName,cus.customerGender,gen.gender,cus.country,con.countryName,cus.contactNo,cus.email,cus.age,cus.accountPassword FROM tbl_Customers cus
INNER JOIN tbl_Gender gen ON cus.customerGender=gen.genderId
INNER JOIN tbl_Country con ON cus.country=con.countryId


CREATE TABLE tbl_CustomerOrderDetails
(
	orderId INT IDENTITY PRIMARY KEY,
	aircraftId INT REFERENCES tbl_Aircrafts(aircraftId) NOT NULL,
)


--orderdetails
--CREATE TABLE tbl_OrderDetails
--(
--	orderId INT IDENTITY PRIMARY KEY,
--	aircraftId INT REFERENCES tbl_Aircrafts(aircraftId) NOT NULL,
--	customerId INT REFERENCES tbl_Customers(customerId) NOT NULL,
--	orderDate DATE NOT NULL,
--	unitPrice MONEY NOT NULL,
--	quantity INT NOT NULL,
--	totalPrice MONEY NOT NULL
--)



