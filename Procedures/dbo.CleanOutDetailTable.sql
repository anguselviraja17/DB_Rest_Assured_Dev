SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Anthony Troy>
-- Create date: <12-9-21>
-- Description:	<Check Equipmemt Rates then insert into Detail Table>
-- =============================================
CREATE PROCEDURE [dbo].[CleanOutDetailTable] 
	-- Add the parameters for the stored procedure here
	@Bill_ID integer,
	@Job_ID integer,
	@Rest_Co_ID integer,
	@Summary_ID integer
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Remove old records
DELETE 
FROM [dbo].[RA - Audit Results - Detail]
WHERE [dbo].[RA - Audit Results - Detail].[Rest_Bill_ID] = @Bill_ID AND [dbo].[RA - Audit Results - Detail].[Audit_Summary_ID] = @Summary_ID;

END
GO
