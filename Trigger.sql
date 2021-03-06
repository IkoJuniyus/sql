CREATE TRIGGER Payments.TrPayment
ON Payments.Payment
FOR DELETE
AS
	ROLLBACK TRANSACTION
RETURN

CREATE TRIGGER Hotel.TrHotel
ON Hotel.HotelDetail
FOR DELETE
AS
	ROLLBACK TRANSACTION
RETURN

CREATE TRIGGER Bookings.TrBooking
ON Bookings.Booking
FOR DELETE
AS
	ROLLBACK TRANSACTION
RETURN