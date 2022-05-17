SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
    
/* Created from Access Query: 'BR-TMP Load - Billing Labor for Blue River and Bunk'   */    
    
CREATE PROC [dbo].[spLoadBillingLabor](@ProcessID int) as    
    
declare @JobID int,    
  @BillID int,    
  @RestCo int    
    
set nocount on    
    
select @JobID  = JobID,    
  @BillID = BillID,    
  @RestCo = RestCo    
from BillProcess    
where ID = @ProcessID    
    
    
delete from [RA - Rest Bills Unscrubbed-Labor-Cost]    
where Job_ID       = @JobID     
and  Rest_Bill_ID = @BillID    
and  Rest_Co      = @RestCo    
set nocount off    
    
-- [AT] -4-10-22 Added Mark-up Cost to Insert to Labor Unscrubbed
    
INSERT INTO [RA - Rest Bills Unscrubbed-Labor-Cost] (
Rest_Bill_ID,
Job_ID,
Rest_Co,
Staff_Name,
Role_Abbreviation,
Role_Hourly_Rate,
Work_Date,
Regular_Hours,
Prevailing_Rate_Hours,
Regular_Daily_Cost,
Prevailing_Cost,
Total_Cost,
Work_Description,
Mark_Up_Cost)    
SELECT @BillID BillID,
@JobID JobID,
@RestCo RestCo,
L.Name,
L.Title,
L.[Hourly Rate],
L.Date,
L.[Reg Hours],
L.[PR Hours],
L.[Reg Rate],
L.[PR Rate],
L.Total,
[Work Description],
L.[Mark Up]
FROM [Staging-TM-1-LaborReg] L (nolock)     
WHERE L.Name Is Not Null    
AND  L.BillID = @ProcessID    
ORDER BY L.ID 
GO
