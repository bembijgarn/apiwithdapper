CREATE PROC filter 
@CardNumber FLOAT 
AS
BEGIN 
  SELECT * FROM dbo.Users WHERE BankCard > @CardNumber
END

CREATE PROC	selectall
AS
BEGIN		
     SELECT * FROM Users
END






