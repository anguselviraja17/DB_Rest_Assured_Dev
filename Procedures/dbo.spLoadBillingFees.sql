SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- Update Log
--
-- AT [4-3-22] - Updated Logic to send "Equipmnent Term Discount" to Unscrubbed Equipment Credit Table instead of Unscrubbed Fees
--
--

--select * from [RA - Rest Bills Unscrubbed-Other-Fee-Totals]  
--select * from [Staging-TM-1-Fees]

CREATE PROC [dbo].[spLoadBillingFees](@ProcessID int) as    
    
declare @JobID int,    
  @BillID int,
  @RestCo int
  
set nocount on    
    
select @JobID  = JobID,    
  @BillID = BillID,
  @RestCo = RestCo
from BillProcess    
where ID = @ProcessID    
    
delete from [RA - Rest Bills Unscrubbed-Other-Fee-Totals]  
where Job_ID       = @JobID     
and  Rest_Bill_ID = @BillID    

set nocount off    
    
INSERT INTO  [RA - Rest Bills Unscrubbed-Other-Fee-Totals]  (Fee_Name, Fee_Description, Total_Due, Rest_Bill_ID, Job_ID)
SELECT Description, Description, Amount, @BillID BillID, @JobID JobID
FROM [Staging-TM-1-Fees] (nolock)     
WHERE BillID = @ProcessID    and [staging-TM-1-Fees].[Description] <> 'Equipment Term Discount'
ORDER BY ID    

delete from [RA - Rest Bills Unscrubbed-Equip-Credit]  
where Job_ID       = @JobID     
and  Rest_Bill_ID = @BillID    
and ([RA - Rest Bills Unscrubbed-Equip-Credit].[Equipment_Name] = 'Equipment Term Discount' or [RA - Rest Bills Unscrubbed-Equip-Credit].[Equipment_Name] = 'Term Discount')

INSERT INTO  [RA - Rest Bills Unscrubbed-Equip-Credit]
([RA - Rest Bills Unscrubbed-Equip-Credit].Equipment_Name,
[RA - Rest Bills Unscrubbed-Equip-Credit].Total_Credit,
[RA - Rest Bills Unscrubbed-Equip-Credit].[Rest_Bill_ID],
[RA - Rest Bills Unscrubbed-Equip-Credit].[Job_ID],
[RA - Rest Bills Unscrubbed-Equip-Credit].[Rest_Co_ID])
SELECT 
Description,
Amount,
@BillID BillID,
@JobID JobID,
@RestCo RestCo
FROM [Staging-TM-1-Fees] (nolock)     
WHERE BillID = @ProcessID    and [staging-TM-1-Fees].[Description] = 'Equipment Term Discount'
ORDER BY ID    
    
	

GO
