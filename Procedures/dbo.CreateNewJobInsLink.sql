SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,>
-- Description:	<Description,,>
-- =============================================
CREATE      PROCEDURE [dbo].[CreateNewJobInsLink]
	-- Add the parameters for the stored procedure here
	       @Job_ID int
           ,@Insurance_Co_ID int
           ,@Coverage_Percent decimal(5,2)
           ,@Ins_Contact_for_Job int

	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @DateTime datetime
	DECLARE @id integer

	SET @DateTime = GETDATE()

INSERT INTO [dbo].[RA - Jobs-ROMs - Insurance Co Linkage]
           ([Job_ID]
           ,[Insurance_Co_ID]
           ,[Coverage_Percent]
           ,[Ins_Contact_for_Job])
     VALUES
           (@Job_ID
           ,@Insurance_Co_ID
           ,@Coverage_Percent
           ,@Ins_Contact_for_Job)

		   select @id = Scope_Identity()

		   RETURN @id


END
GO
