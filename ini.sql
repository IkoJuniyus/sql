---PEMBUTAN-DATABASE
CREATE DATABASE HotelNakamaDone
ON
(
NAME = dbHotelNakamaDone_dat,
FILENAME = 'D:\SQL SERVER Q2\tugas sql\dbHotelNakamaDone_Dat.mdf',
SIZE = 10,
FILEGROWTH = 5
)
LOG ON
(
NAME = dbHotelNakama_log,
FILENAME = 'D:\SQL SERVER Q2\tugas sql\dbHotelNakamaDone_Log.idf',
SIZE = 10,
FILEGROWTH = 5
)

---Pembuatan-SCHEMA
USE HotelNakamaDone
GO
CREATE SCHEMA Hotel
GO
CREATE SCHEMA Customers
GO
CREATE SCHEMA Rooms
GO
CREATE SCHEMA Employees
GO 
CREATE SCHEMA Payments
GO
CREATE SCHEMA Bookings


---MASALAH-AUTHORIZATION
use HotelNakamaDone
Alter Authorization on database::HotelNakamaDone To [IKO-JUNIYUS\Acer]


---Pembutan-TABEL
USE HotelNakamaDone
GO
CREATE TABLE Hotel.HotelDetail
(
	HotelID INT NOT NULL,
	HotelName VARCHAR(50) NOT NULL,
	Location VARCHAR (200) NOT NULL,
	HotelPhone varchar(14) not null
)
GO
CREATE TABLE Employees.Employee
(
	EmpID INT NOT NULL,
	HotelID INT NOT NULL,
	EmpName VARCHAR (50)  NOT NULL,
	EmpTitle VARCHAR (10)  NOT NULL,
	EmpDOB DATETIME NOT NULL,
	EmpAddress VARCHAR (100) NOT NULL,
	EmpZipID NUMERIC (10) NOT NULL,
	EmpPhone varchar(14) NOT NULL
)
GO
CREATE TABLE Bookings.Booking
(
	BookingID INT NOT NULL,
	BookingDate DATETIME NOT NULL,
	CustID INT NOT NULL,
	EmpID INT NOT NULL,
	PaymentID INT NOT NULL,
	CheckOut DATETIME NOT NULL,
	CheckIN DATETIME NOT NULL,
	BookingDescrip VARCHAR (100) NOT NULL
) 
GO
CREATE TABLE Customers.Customer
(
	CustID INT NOT NULL,
	CustName VARCHAR(50) NOT NULL,
	CustAddress VARCHAR (200) NOT NULL,
	CustZipID NUMERIC NOT NULL,
	CustPhone varchar(14) NOT NULL
)
GO
CREATE TABLE Rooms.Room
(
	RoomID INT NOT NULL,
	RoomStatus varchar not null,
	RoomTID INT NOT NULL
)
GO
CREATE TABLE Rooms.RoomCheckIN
(
	BookingID INT NOT NULL,
	RoomID int not null	
)
GO
CREATE TABLE Rooms.RoomType
(
	RoomTID INT NOT NULL,
	RoomStock INT NOT NULL,
	RoomType varchar not null,
	RoomDescrip INT NOT NULL,
	RoomPrice INT NOT NULL
)
GO
CREATE TABLE Payments.Payment
(
	PaymentID INT NOT NULL,
	BookingID INT NOT NULL,
	PaymentDate DATETIME NOT NULL,
	DescripFine VARCHAR (100) NOT NULL,
	Fine MONEY NOT NULL,
	Total MONEY NOT NULL
)



---Constarint
use HotelNakamaDone
GO
ALTER TABLE Hotel.HotelDetail
ADD CONSTRAINT pkHotelCode PRIMARY KEY (HotelCode)
GO
ALTER TABLE Employees.Employee
ADD CONSTRAINT pkEmpCode PRIMARY KEY (EmpCode)
GO
ALTER TABLE Bookings.Booking
ADD CONSTRAINT pkBookingCode PRIMARY KEY (BookingCode)
GO
ALTER TABLE Customers.Customer
ADD CONSTRAINT pkCustCode PRIMARY KEY (CustCode)
GO
ALTER TABLE Payments.Payment
ADD CONSTRAINT pkPaymentCode PRIMARY KEY (PaymentCode)
GO
ALTER TABLE Rooms.Room
ADD CONSTRAINT pkRoomCode PRIMARY KEY (RoomCode)
GO
ALTER TABLE Employees.Employee
ADD CONSTRAINT fkHotelCode FOREIGN KEY (HotelCode) REFERENCES Hotel.HotelDetail (HotelCode)
GO
ALTER TABLE Bookings.Booking
ADD CONSTRAINT fkEmpCode FOREIGN KEY (EmpCode) REFERENCES Employees.Employee
GO
ALTER TABLE Bookings.Booking
ADD CONSTRAINT fkCustCode FOREIGN KEY (CustCode) REFERENCES Customers.Customer
GO
ALTER TABLE Bookings.Booking
ADD CONSTRAINT fkPaymentCode FOREIGN KEY (PaymentCode) REFERENCES Payments.Payment
GO
ALTER TABLE Bookings.BookingRoom
ADD CONSTRAINT fkBookingCode FOREIGN KEY (BookingCode) REFERENCES Bookings.Booking
GO
ALTER TABLE Bookings.BookingRoom
ADD CONSTRAINT fkRoomCode FOREIGN KEY (RoomCode) REFERENCES Rooms.Room
GO
ALTER TABLE Hotel.HotelDetail
ADD CONSTRAINT uqHotelID UNIQUE (HotelID)
GO
ALTER TABLE Employees.Employee
ADD CONSTRAINT uqEmpID UNIQUE (EmpID)
GO
ALTER TABLE Bookings.Booking
ADD CONSTRAINT uqBookingID UNIQUE (BookingID)
GO
ALTER TABLE Customers.Customer
ADD CONSTRAINT uqCustID UNIQUE (CustID)
GO
ALTER TABLE Payments.Payment
ADD CONSTRAINT uqPaymentID UNIQUE (PaymentID)
GO
ALTER TABLE Rooms.Room
ADD CONSTRAINT uqRoomID UNIQUE (RoomID)
GO
ALTER TABLE Employees.Employee
ADD CONSTRAINT ckEmpDOB CHECK (EmpDOB < GETDATE())
GO
ALTER TABLE Bookings.Booking
ADD CONSTRAINT ckBookingDate CHECK (BookingDate < GETDATE())
GO
ALTER TABLE Payments.Payment
ADD CONSTRAINT ckPaymentDate CHECK (PaymentDate < GETDATE())
GO
ALTER TABLE Payments.Payment
ADD CONSTRAINT ckDefPaymentDate DEFAULT GETDATE() FOR PaymentDate
GO
ALTER TABLE Rooms.Room
ADD CONSTRAINT ckRoomCode CHECK (RoomCode LIKE 'Ro[0-9][0-9][0-9][0-9]')
GO
ALTER TABLE Bookings.booking
ADD CONSTRAINT ckBookingCode CHECK (BookingCode LIKE 'Bo[0-9][0-9][0-9][0-9]')
GO
ALTER TABLE Payments.Payment
ADD CONSTRAINT ckPaymentCode CHECK (PaymentCode LIKE 'Pa[0-9][0-9][0-9][0-9]')
GO
ALTER TABLE Customers.Customer
ADD CONSTRAINT ckCustCode CHECK (CustCode LIKE 'Cu[0-9][0-9][0-9][0-9]')
GO
ALTER TABLE Employees.Employee
ADD CONSTRAINT ckEmpCode CHECK (EmpCode LIKE 'Em[0-9][0-9][0-9][0-9]')
GO
ALTER TABLE Hotel.HotelDetail
ADD CONSTRAINT ckHotelCode CHECK (HotelCode LIKE 'Ho[0-9][0-9][0-9][0-9]')
GO
ALTER TABLE Rooms.Room
ADD CONSTRAINT ckRoomStatus CHECK (RoomStatus IN ('Full','Blank'))
GO
ALTER TABLE Employees.Employee
ADD CONSTRAINT ckEmpCode CHECK (EmpCode LIKE 'Em[0-9][0-9][0-9][0-9]')
GO
ALTER TABLE Payments.Payment
ADD CONSTRAINT ckPaymentCode CHECK (PaymentCode LIKE 'PAY[0-9][0-9][0-9][0-9]')
GO
ALTER TABLE Rooms.Room
ADD CONSTRAINT ckRoomStatus DEFAULT 'Blank' FOR RoomStatus
GO
ALTER TABLE Bookings.Booking
ADD CONSTRAINT ckBookingID CHECK (BookingID LIKE 'Bo[0-9][0-9][0-9][0-9]')
GO
ALTER TABLE Bookings.Booking
ADD CONSTRAINT ckBookingDate CHECK  (BookingDate <= GETDATE())
GO
ALTER TABLE Bookings.Booking
ADD CONSTRAINT ckBookingDate DEFAULT GETDATE() FOR BookingDate
GO
ALTER TABLE Bookings.Booking
ADD CONSTRAINT ckLastDays CHECK (LastDays > BookingDate)
GO
ALTER TABLE Payments.Payment
ADD CONSTRAINT uqBookingCode UNIQUE (BookingCode)
GO
ALTER TABLE Bookings.BookingRoom
ADD CONSTRAINT uqRoomCode UNIQUE (RoomCode)
GO
ALTER TABLE Bookings.BookingRoom
ADD CONSTRAINT uqBookingCode UNIQUE (BookingCode)

---Rule
use HotelNakamaDone
   create rule rlWaktu
as @waktu < getdate()

sp_bindrule 'rlWaktu','Bookings.Booking.BookingDate'

sp_bindrule 'rlWaktu','Employees.Employee.EmpDOB'

sp_bindrule 'rlWaktu','Bookings.Booking.BookingDate'

sp_bindrule 'rlWaktu','Payments.Payment.PaymentDate'

