CREATE PROC updateuserbyid
@Id INT,
@name NVARCHAR(MAX),
@lastname NVARCHAR(MAX),
@username NVARCHAR(MAX),
@cardnumber FLOAT
AS
BEGIN
    UPDATE dbo.Users SET Name = @name,LastName = @lastname,UserName = @username, BankCard = @cardnumber 
	WHERE Id = @Id
END
