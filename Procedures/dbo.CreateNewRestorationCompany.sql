SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE     PROCEDURE [dbo].[CreateNewRestorationCompany]
	-- Add the parameters for the stored procedure here
	       @Rest_Co_Name nvarchar(255)
           ,@Rest_Co_Service nvarchar(255)
           ,@Rest_Co_Industry nvarchar(255)
           ,@Rest_Co_HQ_Address nvarchar(255)
           ,@Rest_Co_HQ_City nvarchar(255)
           ,@Rest_Co_HQ_State nvarchar(255)
           ,@Rest_Co_HQ_Zip nvarchar(10)
           ,@Rest_Co_HQ_Country nvarchar(255)
           ,@Rest_Co_Primary_Contact nvarchar(255)
           ,@Rest_Co_Primary_Contact_Phone nvarchar(255)
		   ,@Rest_Co_Primary_Contact_email nvarchar(255)
		   ,@Rest_Co_Federal_ID_Num nvarchar(50)

	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @DateTime datetime
	DECLARE @id integer

	SET @DateTime = GETDATE()

		   INSERT INTO [dbo].[RA - Restoration Companies]
           ([Rest_Co_Name]
           ,[Rest_Co_Service]
           ,[Rest_Co_Industry]
           ,[Rest_Co_HQ_Address]
           ,[Rest_Co_HQ_City]
           ,[Rest_Co_HQ_State]
           ,[Rest_Co_HQ_Zip]
           ,[Rest_Co_HQ_Country]
           ,[Date_Added]
           ,[Rest_Co_Primary_Contact]
           ,[Rest_Co_Primary_Contact_Phone]
           ,[Rest_Co_Primacy_Contact_email]
		   ,[Rest_Co_Federal_ID_Num])

     VALUES
           (@Rest_Co_Name
           ,@Rest_Co_Service
           ,@Rest_Co_Industry
           ,@Rest_Co_HQ_Address
           ,@Rest_Co_HQ_City
           ,@Rest_Co_HQ_State
           ,@Rest_Co_HQ_Zip
           ,@Rest_Co_HQ_Country
           ,GETDATE()
           ,@Rest_Co_Primary_Contact
           ,@Rest_Co_Primary_Contact_Phone
           ,@Rest_Co_Primary_Contact_email
           ,@Rest_Co_Federal_ID_Num)

		   select @id = Scope_Identity()

		   RETURN @id


END
GO
