SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
  
/* Created from Access Query: 'FOTMP Load - Billing Labor Per Diem for ACE'   */  
  
CREATE PROC spLoadBillingPerDiem(@ProcessID int) as  
  
declare @JobID int,  
  @BillID int,  
  @RestCo int  
  
set nocount on  
  
select @JobID  = JobID,  
  @BillID = BillID,  
  @RestCo = RestCo  
from BillProcess  
where ID = @ProcessID  
  
delete  from [RA - Rest Bills Unscrubbed-Labor-Per-Diem]  
where Job_ID       = @JobID   
and  Rest_Bill_ID = @BillID  
and  Rest_Co      = @RestCo  
set nocount off  
  
INSERT INTO [RA - Rest Bills Unscrubbed-Labor-Per-Diem] (Rest_Bill_ID, Job_ID, Rest_Co, Staff_Name, Per_Diem, Work_Date, Small_Tools, PPE, Lodging, Total_Cost )  
SELECT @BillID BillID, @JobID JobID, @RestCo RestCo, PD.Name, PD.[A Per Diem], PD.[Date], [Small Tools], [PPE], [Lodging], PD.Total  
FROM [Staging-TM-1-LaborFees] PD  
WHERE PD.Name Is Not Null  
AND  PD.BillID = @ProcessID  
ORDER BY ID  
GO
