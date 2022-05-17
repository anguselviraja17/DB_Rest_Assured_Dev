SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,>
-- Description:	<Description,,>
-- =============================================
CREATE     PROCEDURE [dbo].[CreateNewJob]
	-- Add the parameters for the stored procedure here
	       @Contract_ID int
           ,@Rest_Co_Job_Number nvarchar(255)
           ,@Rest_Co_ID int
           ,@Insured_Co_ID int
           ,@IA_Co_ID int
           ,@Job_Name nvarchar(255)
           ,@Job_Description nvarchar(255)
           ,@Job_Type nvarchar(255)
           ,@Job_Event_Type int
           ,@Job_Contract_Date date
           ,@Job_Contract_Type nvarchar(255)
           ,@Rest_Co_Primary_Signer nvarchar(255)
           ,@Insured_Co_Primary_Signer nvarchar(255)
           ,@Building_Type int
           ,@Scope_of_Work_Summary nvarchar(max)
           ,@Construction_Type_Primary nvarchar(255)
           ,@ROM_Document nvarchar(max)
           ,@Estimated_Total_Cost money
           ,@Occupancy_Type_Primary nvarchar(255)
           ,@Estimated_Job_Duration int
           ,@Estimated_Job_Start_Date date
           ,@Estimated_Job_End_Date date
           ,@ROM_URL nvarchar(255)
           ,@IA_Company_Involved nchar(1)
           ,@IA_Assigned_Contact_ID int
           ,@RC_Contact_ID int
           ,@PO_Contact_ID int
           ,@CAT_Named_Event_Ind nchar(1)
           ,@CAT_Name nvarchar(50)

	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @DateTime datetime
	DECLARE @id integer

	SET @DateTime = GETDATE()

INSERT INTO [dbo].[RA - Jobs-ROMs]
           ([Contract_ID]
           ,[Rest_Co_Job_Number]
           ,[Rest_Co_ID]
           ,[Insured_Co_ID]
           ,[IA_Co_ID]
           ,[Job_Name]
           ,[Job_Description]
           ,[Job_Type]
           ,[Job_Event_Type]
           ,[Job_Contract_Date]
           ,[Job_Contract_Type]
           ,[Rest_Co_Primary_Signer]
           ,[Insured_Co_Primary_Signer]
           ,[Building_Type]
           ,[Scope_of_Work_Summary]
           ,[Construction_Type_Primary]
           ,[ROM_Document]
           ,[Estimated_Total_Cost]
           ,[Occupancy_Type_Primary]
           ,[Estimated_Job_Duration]
           ,[Estimated_Job_Start_Date]
           ,[Estimated_Job_End_Date]
           ,[ROM_URL]
           ,[IA_Company_Involved]
           ,[IA_Assigned_Contact_ID]
           ,[RC_Contact_ID]
           ,[PO_Contact_ID]
           ,[CAT_Named_Event_Ind]
           ,[CAT_Name]
		   ,[Submitted_to_RA_Date])
     VALUES
           (@Contract_ID
           ,@Rest_Co_Job_Number
           ,@Rest_Co_ID
           ,@Insured_Co_ID
           ,@IA_Co_ID
           ,@Job_Name
           ,@Job_Description
           ,@Job_Type
           ,@Job_Event_Type
           ,@Job_Contract_Date
           ,@Job_Contract_Type
           ,@Rest_Co_Primary_Signer
           ,@Insured_Co_Primary_Signer
           ,@Building_Type
           ,@Scope_of_Work_Summary
           ,@Construction_Type_Primary
           ,@ROM_Document
           ,@Estimated_Total_Cost
           ,@Occupancy_Type_Primary
           ,@Estimated_Job_Duration
           ,@Estimated_Job_Start_Date
           ,@Estimated_Job_End_Date
           ,@ROM_URL
           ,@IA_Company_Involved
           ,@IA_Assigned_Contact_ID
           ,@RC_Contact_ID
           ,@PO_Contact_ID
           ,@CAT_Named_Event_Ind
           ,@CAT_Name
           ,GetDate()
			)

		   select @id = Scope_Identity()

		   RETURN @id


END
GO
