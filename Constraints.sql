use HotelNakamaDone
alter table Hotel.HotelDetail
add constraint pkHotelID PRIMARY KEY (HotelID)
GO
ALTER TABLE Employees.Employee
add constraint pkEmpID PRIMARY KEY (EmpID)
GO
ALTER TABLE Bookings.Booking
add constraint pkBookingID PRIMARY KEY (BookingID)
GO
ALTER TABLE Customers.Customer
add constraint pkCustID PRIMARY KEY (CustID)
GO
ALTER TABLE Rooms.Room
add constraint pkRoomID PRIMARY KEY (RoomID)
GO
ALTER TABLE Rooms.RoomType
add constraint pkRoomTID PRIMARY KEY (RoomTID)
GO
ALTER TABLE Payments.Payment
add constraint pkPaymentID PRIMARY KEY (PaymentID)
GO
ALTER TABLE Employees.Employee
add constraint fkHotelID FOREIGN KEY (HotelID) REFERENCES Hotel.HotelDetail
GO
ALTER TABLE Bookings.Booking
add constraint fkEmpID FOREIGN KEY (EmpID) REFERENCES Employees.Employee
GO
ALTER TABLE Bookings.Booking
add constraint fkCustID FOREIGN KEY (CustID) REFERENCES Customers.Customer
GO
ALTER TABLE Bookings.Booking
add constraint fkPaymentID FOREIGN KEY (PaymentID) REFERENCES Payments.Payment
GO
ALTER TABLE Rooms.RoomCheckIN
add constraint fkBookingID FOREIGN KEY (BookingID) REFERENCES Bookings.Booking
GO
ALTER TABLE Rooms.RoomCheckIN
add constraint fkRoomID foreign key (RoomID) REFERENCES Rooms.Room
GO
ALTER TABLE Rooms.Room
add constraint fkRoomTID FOREIGN KEY (RoomTID) REFERENCES Rooms.RoomType
Go
ALTER TABle Hotel.HotelDetail
add constraint uqHotelID UNIQUE (HotelID)
GO
ALTER TABLE Employees.Employee
ADD constraint uqEmpID UNIQUE (EmpID)
GO
ALTER TABLE Employees.Employee
add constraint uqEmpPhone unique (EmpPhone)
Go
alter table Bookings.Booking
add constraint uqBookingID UNIQUE (BookingID)
GO
ALTER TABLE Customers.Customer
add constraint uqCustID UNIQUE (CustID)
GO
ALTER TABLE Customers.Customer
ADD CONSTRAINT uqCustPhone unique (CustPhone)
GO
ALTER TABLE Rooms.Room
add constraint uqRoomID UNIQUE (RoomID)
GO
ALTER TABLE Rooms.RoomType
add constraint uqRoomTID unique (RoomTID)
GO
alter table Payments.Payment
add constraint uqPaymentID unique (PaymentID)
GO
ALTER TABLE Employees.Employee
add Constraint ckEmpDOB Check (EmpDOB < GETDATE())
GO
ALTER TABLE Customers.Customer
add Constraint ckCustID check (CustID < GETDATE())
GO
ALTER TABLE Bookings.Booking
add constraint ckCheckIN check (CheckIN >= GETDATE())
GO
ALTER TABLE Bookings.Booking
add constraint ckCheckOut check (CheckOut >= GETDATE())
GO
ALTER TABLE Hotel.HotelDetail
add constraint ckHotelID check (HotelID LIKE 'HO[0-9][0-9][0-9][0-9]')
GO
ALTER TABLE Employees.Employee
add constraint ckEmpID check (EmpID LIKE 'Em[0-9][0-9][0-9][0-9]')
GO
ALTER TABLE Bookings.Booking
add constraint ckBookingID check (BookingID LIKE 'BO[0-9][0-9][0-9][0-9]')
GO
ALTER TABLE Customers.Customer
add constraint ckCustID check (CustID LIKE 'CU[0-9][0-9][0-9][0-9]')
GO
ALTER TABLE Rooms.Room
add constraint ckRoomID check (RoomID LIKE 'Ro[0-9][0-9][0-9][0-9]')
GO
ALTER TABLE Rooms.RoomType
add constraint ckRoomTID check (RoomTID LIKE 'TID[0-9][0-9][0-9][0-9]')
GO
ALTER TABLE Payments.Payment
add constraint ckPaymentID CHECK (PaymentID LIKE 'PA[0-9][0-9][0-9][0-9]')
GO
ALTER TABLE Rooms.RoomType
add constraint ckRoomType check (RoomType IN('VVIP','VIP','REGULER'))
GO
ALTER TABLE Rooms.RoomType
add constraint ckDefRoomTtpe default 'REGULER' for RoomType
GO
alter table Bookings.Booking
add constraint chkCheckOut check (CheckOut >= getdate())
go
alter table Bookings.Booking
add constraint chkCheckIN CHECK (CheckIN >= GETDATE())
go
alter table Payments.Payment
add constraint ckPaymentDate check (PaymentDate >= getdate())
GO
ALTER TABLE Bookings.Booking
ADD CONSTRAINT ckBookingDate DEFAULT GETDATE() FOR BookingDate
GO
ALTER TABLE Bookings.Booking
ADD CONSTRAINT ckDefCheckOut CHECK (CheckOut >= BookingDate)

use HotelNakamaDone
create rule rlWaktu
as @Waktu >= getdate()

create rule rlMoney
as @Money > 0

create rule rlFine
as @Fine >= 0

sp_bindrule 'rlWaktu','Bookings.Booking.BookingDate'

sp_bindrule 'rlWaktu','Employees.Employee.EmpDOB'

sp_bindrule 'rlWaktu','Payments.Payment.PaymentDate'

sp_bindrule 'rlWaktu','Bookings.Booking.CheckIN'

sp_bindrule 'rlWaktu','Bookings.Booking.CheckOut'

sp_bindrule 'rlFine','Payments.Payment.Fine'

sp_bindrule 'rlMoney','Payments.Payment.Total'