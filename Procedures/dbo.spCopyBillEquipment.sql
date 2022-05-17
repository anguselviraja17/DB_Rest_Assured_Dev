SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

/* Created from Can-Belfor-EQUIP load to Unscrubbed */

CREATE PROC [dbo].[spCopyBillEquipment] (@BillProcessID int) AS

BEGIN TRY
	DECLARE @Rows int

	SET NOCOUNT ON

	DELETE FROM [RA - Rest Bills Unscrubbed-Equipment] 
	WHERE	BillProcessID = @BillProcessID

	INSERT INTO [RA - Rest Bills Unscrubbed-Equipment] 
			(BillProcessID, 
			Equipment_Name, 
			Work_Date,
			Unit_Type, 
			Quantity, 
			Unit_Cost, 
			Tax_or_OandP, 
			Total_Cost, 
			Rest_Bill_ID, 
			Job_ID, 
			Rest_Co_ID)

	SELECT	@BillProcessID as [BillProcessID],
			[Item Description],
			[Date],
			[Unit], 
			[Quantity],
			[Price], 
			[Mark Up],
			[Total],
			TM.[BillID],
			[JobID],
			[RestCo]
	FROM	[TM-1-Material] TM
	JOIN	[BillProcess] BP ON (BP.[ID] = @BillProcessID)
	WHERE   [Unit] in ('EPP', 'DAY', 'WEEK', 'MONTH')
	AND		TM.[BillID] = @BillProcessID

	SET @Rows = @@ROWCOUNT
	SET NOCOUNT OFF
	SELECT @Rows 'Result'
END TRY

BEGIN CATCH

	IF XACT_STATE() <> 0   -- If we're in a transaction, rollback.
		ROLLBACK TRANSACTION

	SET NOCOUNT ON
	INSERT INTO ErrorLog(ErrorNumber, ErrorState, ErrorSeverity, ErrorProcedure, ErrorLine, ErrorMessage)
		VALUES (ERROR_NUMBER(), ERROR_STATE(), ERROR_SEVERITY(), ERROR_PROCEDURE(), ERROR_LINE(), ERROR_MESSAGE())
	SET NOCOUNT OFF

	SELECT	0 - ERROR_NUMBER() Result
END CATCH
GO
