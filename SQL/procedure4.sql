CREATE PROC getuserbyid
@userid INT
AS
BEGIN 
 SELECT * FROM dbo.Users WHERE Id = @userid

END


SELECT CONCAT(Name,' ',LastName) FROM dbo.Users


