SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,>
-- Description:	<Description,,>
-- =============================================
CREATE      PROCEDURE [dbo].[CreateNewSubmission]
	-- Add the parameters for the stored procedure here
	       @Rest_Co_ID int,
           @Job_ID int,
           @Bill_ID int,
           @Submission_Sequence_Number int,
           @Submission_Current_State int,
           @Submission_Current_Status int,
           @Submission_Current_Location int,
           @Submission_Last_State_Change_Date date,
           @Last_Update_User nvarchar(50)


	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @DateTime datetime
	DECLARE @id integer

	SET @DateTime = GETDATE()

INSERT INTO [dbo].[RA - Workflow - Bill Submission State]
           (Rest_Co_ID,
           Job_ID,
           Bill_ID,
           Submission_Sequence_Number,
           Submission_Current_State,
           Submission_Current_Status,
           Submission_Current_Location,
           Submission_Last_State_Change_Date,
           Last_Update_User)
     VALUES
           (@Rest_Co_ID,
           @Job_ID,
           @Bill_ID,
           @Submission_Sequence_Number,
           @Submission_Current_State,
           @Submission_Current_Status,
           @Submission_Current_Location,
           @Submission_Last_State_Change_Date,
           @Last_Update_User)

		   select @id = Scope_Identity()

		   RETURN @id


END
GO
