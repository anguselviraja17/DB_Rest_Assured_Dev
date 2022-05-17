SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
  
/* Created from Access Query: 'BR-TMP Load - Billing Materials for Blue River and Bunk'   */  
  
CREATE PROC spLoadBillingMaterials(@ProcessID int) as  
  
declare @JobID int,  
  @BillID int,  
  @RestCo int  
  
set nocount on  
  
select @JobID  = JobID,  
  @BillID = BillID,  
  @RestCo = RestCo  
from BillProcess  
where ID = @ProcessID  
  
delete  from [RA - Rest Bills Unscrubbed-Materials]  
where Job_ID       = @JobID   
and  Rest_Bill_ID = @BillID  
and  Rest_Co_ID   = @RestCo  
set nocount off  
  
INSERT INTO [RA - Rest Bills Unscrubbed-Materials] (Material_Name, Work_Date, Unit_Type, Quantity, Unit_Cost, Total_Cost, Rest_Bill_ID, Job_ID, Rest_Co_ID )  
SELECT M.[Item Description], M.Date, M.Unit, M.Quantity, M.Price, M.Total, @BillID BillID, @JobID JobID, @RestCo RestCo  
FROM [Staging-TM-1-Material] M (nolock)  
WHERE M.Unit not in ('Day', 'Week', 'Month', 'Daily', 'Weekly', 'Monthly', 'EPP')  
AND  M.BillID = @ProcessID  
ORDER BY ID  
GO
