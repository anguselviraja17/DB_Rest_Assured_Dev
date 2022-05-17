SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
  
/* Created from Access Query: 'FO-TMP Load - Billing Equip for Best Rest and Bob's'   */  
  
CREATE PROC spLoadBillingHotel(@ProcessID int) as  
  
declare @JobID int,  
  @BillID int,  
  @RestCo int  
  
set nocount on  
  
select @JobID  = JobID,  
  @BillID = BillID,  
  @RestCo = RestCo  
from BillProcess  
where ID = @ProcessID  
  
delete from [RA - Rest Bills Unscrubbed-Hotels]  
where Job_ID       = @JobID   
and  Rest_Bill_ID = @BillID  
and  Rest_Co_ID   = @RestCo  
set nocount off  
  
INSERT INTO [RA - Rest Bills Unscrubbed-Hotels] (Rest_Bill_ID, Job_ID, Rest_Co_ID, Name, Date, [Hotel Name], [Room #], [Per Room], [Daily Rate], [Rate %], [Rate Billed], [Mark Up %], [Mark Up Total], Total)  
  
SELECT @BillID BillID, @JobID JobID, @RestCo RestCo,  
  Name, Date, [Hotel Name], [Room #], [Per Room], [Daily Rate], [Rate %], [Rate Billed], [Mark Up %], [Mark Up Total], Total  
FROM [Staging-TM-1-Hotels] H  (nolock)   
WHERE H.BillID = @ProcessID  
ORDER BY H.ID  
GO
