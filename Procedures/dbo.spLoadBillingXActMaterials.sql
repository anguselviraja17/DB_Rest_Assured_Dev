SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[spLoadBillingXActMaterials](@ProcessID int) as      
  
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

-- [AT] 4-14-22 
-- Removed Category ...I excluded these from Labor and Equipment as well
-- New logic is:
--     Labor = Specifically Hourly, Square, Linear or Cubic feet
--     Equipment = Specifically a unit of time outside of Hourly...DAY, MO, WEEK and variations
--     Materials = Everything else...EA, Box, Gallon, etc...
-- There could be cases where Materials become a dumping ground, but until we have better AI, it is important to ensure we don't double numbers
--
-- Also add a check for and ([Replace] > 0 or [Remove] > 0 or [Unit Price] > 0 or M.Qty > 0)
-- This check is to avoid adding "Subtotals" that may inadvertantly find there way into the staging table

-- [AT] Fixed the Case statement to reflect how Unit Price, Replace and Remove data appears in staging. They do not add together to produce "Unit Price"
--
-- [AT] Added mark-up

INSERT INTO [RA - Rest Bills Unscrubbed-Materials] (
  Material_Name, Work_Date, Unit_Type, Quantity, 
  Unit_Cost, 
  Total_Cost, Rest_Bill_ID, Job_ID, Rest_Co_ID, Tax_or_OandP, Mark_Up )      
SELECT left(M.[Description], 150), M.Date, M.Unit, M.Qty,   
CASE WHEN [Unit Price] IS NULL THEN 
     CASE WHEN [Replace] IS NULL THEN
	      CASE WHEN [Remove] IS NULL THEN
		       0 
		 ELSE [Remove] END
	 ELSE [Replace] END
ELSE [Unit Price] END AS CalcUnitPrice,
M.Total, @BillID BillID, @JobID JobID, @RestCo RestCo, Tax, [Mark Up]     
FROM [Staging-XAct-1-Detail] M (nolock)      
WHERE (M.Unit not in ('Day', 'Week', 'Month', 'Daily', 'Weekly', 'Monthly', 'EPP', 'DA', 'DAY', 'HR', 'HOUR', 'SF', 'LF', 'CF') and (Material_Word_Match = 1))  
AND  M.BillID = @ProcessID  
and ([Replace] > 0 or [Remove] > 0 or [Unit Price] > 0 or M.Qty > 0)
ORDER BY ID   
  
INSERT INTO TempDave (BillID, XActDetail, ProcName)  
SELECT @BillID, ID, 'Materials'  
FROM [Staging-XAct-1-Detail] M (nolock)      
WHERE (M.Unit not in ('Day', 'Week', 'Month', 'Daily', 'Weekly', 'Monthly', 'EPP', 'DA', 'DAY', 'HR', 'HOUR', 'SF', 'LF', 'CF') and (MAterial_Word_Match = 1))  
AND  M.BillID = @ProcessID      
and ([Replace] > 0 or [Remove] > 0 or [Unit Price] > 0 or M.Qty > 0)
ORDER BY ID 
      
--INSERT INTO [RA - Rest Bills Unscrubbed-Materials] (Material_Name, Work_Date, Unit_Type, Quantity, Unit_Cost, Total_Cost, Rest_Bill_ID, Job_ID, Rest_Co_ID, Tax_or_OandP )      
--SELECT left(M.[Description], 150), M.Date, M.Unit, M.Qty,   
--CASE WHEN [Unit Price] IS NULL THEN 0 ELSE [Unit Price] END +  
--CASE WHEN [Remove] IS NULL THEN 0 ELSE [Remove] END +   
--CASE WHEN [Replace] IS NULL THEN 0 ELSE [Replace] END AS CalcUnitPrice, M.Total, @BillID BillID, @JobID JobID, @RestCo RestCo, Tax     
--FROM [Staging-XAct-1-Detail] M (nolock)      
--WHERE (Category in ('CONSUMABLES', 'MATERIALS') AND M.Unit not in ('Day', 'Week', 'Month', 'Daily', 'Weekly', 'Monthly', 'EPP', 'DA', 'DAY', 'HR', 'HOUR'))  
--AND  M.BillID = @ProcessID  
--ORDER BY ID   
  
--INSERT INTO TempDave (BillID, XActDetail, ProcName)  
--SELECT @BillID, ID, 'Materials'  
--FROM [Staging-XAct-1-Detail] M (nolock)      
--WHERE (Category in ('CONSUMABLES', 'MATERIALS') AND M.Unit not in ('Day', 'Week', 'Month', 'Daily', 'Weekly', 'Monthly', 'EPP', 'DA', 'DAY', 'HR', 'HOUR'))  
--AND  M.BillID = @ProcessID      
--ORDER BY ID   

GO
