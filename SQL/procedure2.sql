CREATE PROC deleteuser
@firstname NVARCHAR(MAX),
@lastname NVARCHAR(MAX)
AS
BEGIN	 
   DELETE FROM dbo.Users WHERE CONCAT(Name,' ',LastName) = CONCAT(@firstname,' ',@lastname) 
END



SELECT CONCAT(Name,' ',LastName) FROM dbo.Users