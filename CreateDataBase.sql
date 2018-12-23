
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

