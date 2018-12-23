---MASALAH-AUTHORIZATION
use HotelNakamaDone
Alter Authorization on database::HotelNakamaDone To [IKO-JUNIYUS\Acer]

---Pembutan-TABEL
USE HotelNakamaDone
GO
CREATE TABLE Hotel.HotelDetail
(
	HotelCode char (8) NOT NULL,
	HotelID char (6) NOT NULL,
	HotelName VARCHAR(50) NOT NULL,
	Location VARCHAR (200) NOT NULL,
	HotelPhone NUMERIC (13) NOT NULL
)
GO
CREATE TABLE Employees.Employee
(
	EmpCode char (8) NOT NULL,
	EmpID char (6) NOT NULL,
	HotelCode char (8) NOT NULL,
	EmpName VARCHAR (50)  NOT NULL,
	EmpTitle VARCHAR (10)  NOT NULL,
	EmpDOB DATETIME NOT NULL,
	EmpAddress VARCHAR (100) NOT NULL,
	EmpZipID NUMERIC (10) NOT NULL,
	EmpPhone NUMERIC (13) NOT NULL
)
GO
CREATE TABLE Bookings.Booking
(
	BookingCode char (8) NOT NULL,
	BookingID char (6) NOT NULL,
	BookingDate DATETIME NOT NULL,
	CustCode char (8) NOT NULL,
	EmpCode CHAR (8) NOT NULL,
	PaymentCode char (8) NOT NULL,
	LastDays DATETIME NOT NULL,
	BookingDescrip VARCHAR (100) NOT NULL
) 
GO
CREATE TABLE Customers.Customer
(
	CustCode char (8) NOT NULL,
	CustID char (6) NOT NULL,
	CustName VARCHAR(50) NOT NULL,
	CustAddress VARCHAR (200) NOT NULL,
	CustZipID NUMERIC NOT NULL,
	CustPhone NUMERIC NOT NULL,
)
GO
CREATE TABLE Bookings.BookingRoom
(
	RoomCode char (8) NOT NULL,
	BookingCode char (8) NOT NULL
)
GO
CREATE TABLE Rooms.Room
(
	RoomCode char (8) NOT NULL,
	RoomID char (6) NOT NULL,
	RoomName VARCHAR (30) NOT NULL,
	RoomType VARCHAR (20) NOT NULL,
	Descrip VARCHAR (200) NOT NULL,
	RoomStatus VARCHAR (20) NOT NULL,
	RoomPrice MONEY NOT NULL,
	RoomLocation varchar (30) NOT NULL
)
GO
CREATE TABLE Payments.Payment
(
	PaymentCode char (8) NOT NULL,
	PaymentID char (6) NOT NULL,
	BookingCode CHAR (8) NOT NULL,
	PaymentDate DATETIME NOT NULL,
	Fine MONEY NOT NULL,
	DescripFine VARCHAR (100) NOT NULL,
	Total MONEY NOT NULL
)
