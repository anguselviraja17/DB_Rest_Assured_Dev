SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
  
/* Created from Access Query: 'FO-TMP Load - Billing Equip for Best Rest and Bob's'   */  
  
CREATE   PROC [dbo].[spLoadBillingEquip](@ProcessID int) as  
  
declare @JobID int,  
  @BillID int,  
  @RestCo int  
  
set nocount on  
  
select @JobID  = JobID,  
  @BillID = BillID,  
  @RestCo = RestCo  
from BillProcess  
where ID = @ProcessID  
  
delete from [RA - Rest Bills Unscrubbed-Equipment]  
where Job_ID       = @JobID   
and  Rest_Bill_ID = @BillID  
and  Rest_Co_ID   = @RestCo  
set nocount off  
  
INSERT INTO [RA - Rest Bills Unscrubbed-Equipment] (Equipment_Name, Work_Date, Unit_Type, Quantity, Unit_Cost, Total_Cost, Job_ID, Rest_Bill_ID, Rest_Co_ID )  
SELECT M.[Item Description], M.Date, M.Unit, M.Quantity, M.Price, M.Total, @JobID JobID, @BillID BillID, @RestCo RestCo  
FROM [Staging-TM-1-Material] M  (nolock)   
WHERE M.Unit in ('Day', 'Week', 'Month', 'Daily', 'Weekly', 'Monthly', 'EPP')  
AND  M.BillID = @ProcessID  
ORDER BY M.ID  
  
INSERT INTO [RA - Rest Bills Unscrubbed-Equipment] (  
Equipment_Name,  
Unit_Type,  
Work_Date,  
Quantity,  
Unit_Cost,  
Tax_or_OandP,  
Total_Cost,  
Rest_Bill_ID,  
Job_ID,  
Rest_Co_ID )  
SELECT E.[Item Description],  
E.Unit,  
E.Date,  
E.Quantity,  
E.Price,  
E.[Mark Up],  
E.Total,  
@BillID BillID,  
@JobID JobID,  
@RestCo RestCo  
FROM [Staging-TM-1-Equipment] E  
--WHERE E.Unit in ('Day', 'Week', 'Month', 'Daily', 'Weekly', 'Monthly', 'EPP')  
WHERE E.BillID = @ProcessID and E.Unit <> 'ETD'  
ORDER BY E.ID

GO
