SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC spLoadBillingXActSubContracts(@ProcessID int) as    
    
declare @JobID int,    
		@BillID int,    
		@RestCo int    
    
set nocount on    
    
select	@JobID  = JobID,    
		@BillID = BillID    
from	BillProcess    
where	ID = @ProcessID    
    
delete  from [RA - Rest Bills Unscrubbed-Subcontractor-Cost]    
where	Job_ID       = @JobID     
and		Rest_Bill_ID = @BillID    
set nocount off    
    
INSERT INTO [RA - Rest Bills Unscrubbed-Subcontractor-Cost] (Rest_Bill_ID, Job_ID, Subcontractor_Vendor, Work_Description, Work_Date, Invoice_Receipt, Total_Cost, Markup, Markup_Total_Cost, Total_Due )    
SELECT  @BillID BillID, @JobID JobID, NULL, S.Description, S.Date, NULL,
CASE WHEN [Unit Price] IS NULL THEN 0 ELSE [Unit Price] END +
CASE WHEN [Remove] IS NULL THEN 0 ELSE [Remove] END + 
CASE WHEN [Replace] IS NULL THEN 0 ELSE [Replace] END AS CalcUnitPrice, 
NULL, NULL, S.[Total]
FROM	[Staging-XAct-1-Detail] S    
WHERE	S.[Category] IN ('VENDORS')
AND		S.BillID = @ProcessID    
ORDER BY ID 

INSERT INTO TempDave (BillID, XActDetail, ProcName)
SELECT @BillID, ID, 'SunContract'
FROM	[Staging-XAct-1-Detail] S    
WHERE	S.[Category] IN ('VENDORS')
AND		S.BillID = @ProcessID    
ORDER BY ID 


GO
