SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NewBill-AddToBillProcess](  
  @FileName nvarchar(200),
  @BillID int,  
  @JobID int,
  @RestCo int,
  @SubmissionState int,
  @SummaryID int)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
Declare
@CountofBillProcesses int

 Select  @CountofBillProcesses = Count(*)
 From BillProcess
 Where BillID = @BillID and JobID = @JobID and RestCo = @RestCo and SubmissionState = @SubmissionState and AuditSummaryID = @SummaryID

If @CountofBillProcesses < 1

Begin

	Insert INTO BillProcess  
	(Filename,
	BillFormat,
	BillID,
	JobID,
	RestCo,
	SubmissionState,
	AuditSummaryID,
	Status,
	CreatedBy,
	EntryDate)
 
	Values 
	(@FileName,
	0,
	@BillID,
	@JobID,
	@RestCo,
	@SubmissionState,
	@SummaryID,
	'File Uploaded from FE',
	1,
	GetDate())

End


END
GO
