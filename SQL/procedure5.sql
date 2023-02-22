CREATE OR ALTER PROC Adduser
@name NVARCHAR(MAX),
@lastname NVARCHAR(MAX),
@username NVARCHAR(MAX),
@cardnumber FLOAT
AS
BEGIN	
 INSERT INTO dbo.Users
 (
     Name,
     LastName,
     UserName,
     BankCard
 )
 VALUES
 (   @name, -- Name - nvarchar(max)
     @lastname, -- LastName - nvarchar(max)
     @username, -- UserName - nvarchar(max)
     @cardnumber   -- BankCard - float
     )

END