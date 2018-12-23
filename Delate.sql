DROP TABLE [Bookings].[Booking]
DROP TABLE [Bookings].[BookingPay]
DROP TABLE [Customers].[Customer]
DROP TABLE [Employees].[Employee]
DROP TABLE [Hotel].[HotelDetail]
DROP TABLE [Rooms].[Room]
DROP TABLE [Payments].[Payment]
DROP TABLE [Rooms].[RoomBooking]

ALTER TABLE Rooms.Room
drop CONSTRAINT fkRoomCode

drop database HotelNakamaDone