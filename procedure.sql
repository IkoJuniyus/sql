---Procedure
create PROCEDURE spPayment @PaymentID INT,@BookingID INT, @PaymentDate datetime, @DescipFine varchar, @Fine money , @Total money
as
begin
	declare @Out datetime
	declare @IN datetime
	declare @RoomP INT
	declare @Total money
	SET @RoomP = (select RoomPrice from Rooms.RoomType order by RoomPrice DESC)
	set @Out = (select CONVERT (INT,CheckOut))
	set @IN = (select CONVERT (INT,CheckIN))
	SET @Total = (@RoomP * (@Out - @IN))
	IF EXISTS (SELECT * FROM Bookings.Booking)
end

---EXECUTE
exec spPayment


---Procedure
create procedure spEmployee @EmpID INT ,@HotelID INT,@EmpName varchar,@EmpTitle varchar,@EmpDOB datetime,@EmpAddress varchar,@EmpZipID numeric,@EmpPhone varchar
as
begin
	DECLARE @AEmpID INT
	DECLARE @BEmpID INT
	SET @AEmpID = (SELECT TOP 1 EmpID FROM Employees.Employee ORDER BY EmpID DESC)
	SET @AEmpID = (SELECT * FROM Employees.Employee WHERE EmpID = @AEmpID)
	SET @BEmpID = (@AEmpID + 1)
	begin
		if @BEmpID < 10
		begin
			insert Employees.Employee(EmpID,HotelID,EmpName,EmpTitle,EmpDOB,EmpAddress,EmpZipID,EmpPhone)
			vALUES ('EM000'+ @BEmpID,@HotelID,@EmpName,@EmpTitle,@EmpDOB,@EmpAddress,@EmpZipID,@EmpPhone)
		end
		else
		begin
			if @BEmpID <100
			begin
				insert Employees.Employee(EmpID,HotelID,EmpName,EmpTitle,EmpDOB,EmpAddress,EmpZipID,EmpPhone)
				vALUES ('EM00'+ @BEmpID,@HotelID,@EmpName,@EmpTitle,@EmpDOB,@EmpAddress,@EmpZipID,@EmpPhone)
			end
			else
			begin
				if @BEmpID <1000
				begin
					insert Employees.Employee(EmpID,HotelID,EmpName,EmpTitle,EmpDOB,EmpAddress,EmpZipID,EmpPhone)
					vALUES ('EM00'+ @BEmpID,@HotelID,@EmpName,@EmpTitle,@EmpDOB,@EmpAddress,@EmpZipID,@EmpPhone)
				end
				else
				begin
					insert Employees.Employee(EmpID,HotelID,EmpName,EmpTitle,EmpDOB,EmpAddress,EmpZipID,EmpPhone)
					vALUES ('EM'+ @BEmpID,@HotelID,@EmpName,@EmpTitle,@EmpDOB,@EmpAddress,@EmpZipID,@EmpPhone)
				end
			end
		end
	end
end

---execute
exec spEmployee