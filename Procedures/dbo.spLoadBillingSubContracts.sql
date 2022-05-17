SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
  
/* Created from Access Query: 'BR-TMP Load - Billing Materials for Blue River and Bunk'   */  
  
CREATE PROC spLoadBillingSubContracts(@ProcessID int) as  
  
declare @JobID int,  
  @BillID int,  
  @RestCo int  
  
set nocount on  
  
select @JobID  = JobID,  
  @BillID = BillID  
from BillProcess  
where ID = @ProcessID  
  
delete  from [RA - Rest Bills Unscrubbed-Subcontractor-Cost]  
where Job_ID       = @JobID   
and  Rest_Bill_ID = @BillID  
set nocount off  
  
INSERT INTO [RA - Rest Bills Unscrubbed-Subcontractor-Cost] (Rest_Bill_ID, Job_ID, Subcontractor_Vendor, Work_Description, Work_Date, Invoice_Receipt, Total_Cost, Markup, Markup_Total_Cost, Total_Due )  
SELECT @BillID BillID, @JobID JobID, S.[Subcontractor/Vendor], S.Description, S.Date, S.[Inv / Recpt #], S.Total, S.[Mark Up %], S.[Mark Up Total], S.[Total Due]  
FROM [Staging-TM-1-SubVendor] S  
WHERE S.[Subcontractor/Vendor] Is Not Null  
AND  S.BillID = @ProcessID  
ORDER BY ID  
GO
