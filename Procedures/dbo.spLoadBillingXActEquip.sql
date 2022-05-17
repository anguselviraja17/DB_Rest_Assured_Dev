SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
/* Created from Access Query: 'FO-TMP Load - Billing Equip for Best Rest and Bob's'   */      
      
CREATE   PROC [dbo].[spLoadBillingXActEquip](@ProcessID int) as      
    
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
where Job_ID      = @JobID       
and  Rest_Bill_ID = @BillID      
and  Rest_Co_ID   = @RestCo      
set nocount off      
      
-- AT - Updated to focus the selection of Equipment based on Unit being a time period
-- Needed to take "Category" out because between this query and the material procedure we were putting the same items in both unscrubbed tables
-- [AT] 4-14-22 
-- Removed Category ...I excluded these from Labor and Materials as well
-- New logic is:
--     Labor = Specifically Hourly, Square, Linear or Cubic feet
--     Equipment = Specifically a unit of time outside of Hourly...DAY, MO, WEEK and variations
--     Materials = Everything else...EA, Box, Gallon, etc...
-- There could be cases where Materials become a dumping ground, but until we have better AI, it is important to ensure we don't double numbers
--
-- [AT] 5-9-22
-- Added a distinct Mark-up field to keep tax separate
--

INSERT INTO [RA - Rest Bills Unscrubbed-Equipment] 
(Equipment_Name, Work_Date, Unit_Type, Quantity, Unit_Cost, Total_Cost, Job_ID, Rest_Bill_ID, Rest_Co_ID, Tax_or_OandP, Markup)  
SELECT M.[Description], M.Date, M.Unit, M.Qty, M.[Unit Price], M.Total, @JobID JobID, @BillID BillID, @RestCo RestCo, Tax, [Mark Up]      
FROM [Staging-XAct-1-Detail] M  (nolock)       
WHERE ((M.Unit in ('Day', 'Week', 'Month', 'Daily', 'Weekly', 'Monthly', 'EPP', 'DA', 'WK', 'MO') OR (Equipment_Word_Match = 1)) )  
AND  M.BillID = @ProcessID      
ORDER BY M.ID      
  
INSERT INTO TempDave (BillID, XActDetail, ProcName)  
SELECT @BillID, ID, 'Equip'  
FROM [Staging-XAct-1-Detail] M  (nolock)       
WHERE ((M.Unit in ('Day', 'Week', 'Month', 'Daily', 'Weekly', 'Monthly', 'EPP', 'DA', 'WK', 'MO') OR (Equipment_Word_Match = 1)) )  
AND  M.BillID = @ProcessID      
ORDER BY M.ID 

--INSERT INTO [RA - Rest Bills Unscrubbed-Equipment] (Equipment_Name, Work_Date, Unit_Type, Quantity, Unit_Cost, Total_Cost, Job_ID, Rest_Bill_ID, Rest_Co_ID, Tax_or_OandP)  
--SELECT M.[Description], M.Date, M.Unit, M.Qty, M.[Unit Price], M.Total, @JobID JobID, @BillID BillID, @RestCo RestCo, Tax      
--FROM [Staging-XAct-1-Detail] M  (nolock)       
--WHERE (M.Category in ('EQUIPMENT') OR M.Unit in ('Day', 'Week', 'Month', 'Daily', 'Weekly', 'Monthly', 'EPP', 'DA', 'WK', 'MO'))  
--AND  M.BillID = @ProcessID      
--ORDER BY M.ID      
  
--INSERT INTO TempDave (BillID, XActDetail, ProcName)  
--SELECT @BillID, ID, 'Equip'  
--FROM [Staging-XAct-1-Detail] M  (nolock)       
--WHERE (M.Category in ('EQUIPMENT') OR M.Unit in ('Day', 'Week', 'Month', 'Daily', 'Weekly', 'Monthly', 'EPP', 'DA', 'WK', 'MO'))  
--AND  M.BillID = @ProcessID      
--ORDER BY M.ID      

GO
