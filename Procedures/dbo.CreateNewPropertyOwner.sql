SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [CreateNewPropertyOwner]
	-- Add the parameters for the stored procedure here
	       @Insured_Name nvarchar(255)
           ,@Insured_Desc nvarchar(255)
           ,@Insured_Industry nvarchar(255)
           ,@Insured_HQ_Address nvarchar(255)
           ,@Insured_HQ_State nvarchar(255)
           ,@Insured_HQ_City nvarchar(255)
           ,@Insured_HQ_Zip nvarchar(10)
           ,@Insured_HQ_Country nvarchar(255)
           ,@Insured_Geo_Coverage nvarchar(255)
           ,@Insured_Primary_Contact nvarchar(50)
           ,@Insured_Primary_Contact_Last_Name nvarchar(50)
           ,@Insured_Primary_Contact_Phone nvarchar(50)
           ,@Insured_Primacy_Contact_email nvarchar(50)

	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @DateTime datetime
	DECLARE @id integer

	SET @DateTime = GETDATE()

INSERT INTO [dbo].[RA - Insured Companies]
           ([Insured_Name]
           ,[Insured_Desc]
           ,[Insured_Industry]
           ,[Insured_HQ_Address]
           ,[Insured_HQ_State]
           ,[Insured_HQ_City]
           ,[Insured_HQ_Zip]
           ,[Insured_HQ_Country]
           ,[Date_Added]
           ,[Insured_Primary_Contact]
           ,[Insured_Primary_Contact_Last_Name]
           ,[Insured_Primary_Contact_Phone]
           ,[Insured_Primacy_Contact_email])
     VALUES
           (@Insured_Name
           ,@Insured_Desc
           ,@Insured_Industry
           ,@Insured_HQ_Address
           ,@Insured_HQ_State
           ,@Insured_HQ_City
           ,@Insured_HQ_Zip
           ,@Insured_HQ_Country
           ,GETDATE()
		   ,@Insured_Primary_Contact
           ,@Insured_Primary_Contact_Last_Name
           ,@Insured_Primary_Contact_Phone
           ,@Insured_Primacy_Contact_email
           )

		   select @id = Scope_Identity()

		   RETURN @id

END
GO
