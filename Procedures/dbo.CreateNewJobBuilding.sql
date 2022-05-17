SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,>
-- Description:	<Description,,>
-- =============================================
CREATE       PROCEDURE [dbo].[CreateNewJobBuilding]
	-- Add the parameters for the stored procedure here
           @Insured_Co_ID int,
           @Job_ID int,
           @Assesssment_Instance_Num int,
           @Building_Name nvarchar(255),
           @Building_Address nvarchar(255),
           @Building_City nvarchar(255),
           @Building_State nvarchar(255),
           @Building_Zip nvarchar(255),
           @Building_County nvarchar(255),
           @Building_Country nvarchar(255),
           @Building_Lattitude decimal(8,6),
           @Building_Longitude decimal(9,6),
           @Building_Construction_Type int,
           @Occupancy_Industry_Type int,
           @Square_Footage int,
           @Number_of_Stories int,
           @Number_of_Stories_Affected int,
           @Average_Ceiling_Height int,
           @Floor_Coverings nvarchar(255),
           @Interior_Wall_Finishes nvarchar(255),
           @HVAC_System nvarchar(255),
           @Age_of_Building int,
           @Most_Recent_Renovation datetime,
           @Moisture_Reading_Initial int,
           @Moisture_Reading_Initial_Date datetime
		   

	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @DateTime datetime
	DECLARE @id integer

	SET @DateTime = GETDATE()

INSERT INTO [dbo].[RA - Jobs-ROMs - Building]
           ([Insured_Co_ID]
           ,[Job_ID]
           ,[Assesssment_Instance_Num]
           ,[Building_Name]
           ,[Building_Address]
           ,[Building_City]
           ,[Building_State]
           ,[Building_Zip]
           ,[Building_County]
           ,[Building_Country]
           ,[Building_Lattitude]
           ,[Building_Longitude]
           ,[Building_Construction_Type]
           ,[Occupancy_Industry_Type]
           ,[Square_Footage]
           ,[Number_of_Stories]
           ,[Number_of_Stories_Affected]
           ,[Average_Ceiling_Height]
           ,[Floor_Coverings]
           ,[Interior_Wall_Finishes]
           ,[HVAC_System]
           ,[Age_of_Building]
           ,[Most_Recent_Renovation]
           ,[Moisture_Reading_Initial]
           ,[Moisture_Reading_Initial_Date])
     VALUES
           (@Insured_Co_ID,
           @Job_ID,
           @Assesssment_Instance_Num,
           @Building_Name,
           @Building_Address,
           @Building_City,
           @Building_State,
           @Building_Zip,
           @Building_County,
           @Building_Country,
           @Building_Lattitude,
           @Building_Longitude,
           @Building_Construction_Type,
           @Occupancy_Industry_Type,
           @Square_Footage,
           @Number_of_Stories,
           @Number_of_Stories_Affected,
           @Average_Ceiling_Height,
           @Floor_Coverings, 
           @Interior_Wall_Finishes, 
           @HVAC_System, 
           @Age_of_Building,
           @Most_Recent_Renovation, 
           @Moisture_Reading_Initial,
           @Moisture_Reading_Initial_Date)

		   select @id = Scope_Identity()

		   RETURN @id


END
GO
