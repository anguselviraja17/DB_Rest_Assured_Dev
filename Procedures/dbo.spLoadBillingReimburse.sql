SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
  
/* Created from Access Query: 'CleanStorage-Agnes- Billing Reimb-Vendor-Sub Cont'   */  
  
CREATE PROC spLoadBillingReimburse(@ProcessID int) as  
  
declare @JobID int,  
  @BillID int,  
  @RestCo int  
  
set nocount on  
  
select @JobID  = JobID,  
  @BillID = BillID,  
  @RestCo = RestCo  
from BillProcess  
where ID = @ProcessID  
  
delete from [RA - Rest Bills Unscrubbed-Reimbursable-Items]  
where Job_ID       = @JobID   
and  Rest_Bill_ID = @BillID  
set nocount off  
  
INSERT INTO [RA - Rest Bills Unscrubbed-Reimbursable-Items] (Rest_Bill_ID, Job_ID, Labor_Company_Name, Description, Invoice_Receipt_Number, Receipt_Total, Markup, Markup_Total_Cost, Total_Due )  
SELECT @BillID BillID, @JobID JobID, R.[Labor/Company Name], R.Description, R.[Receipt #], R.[Receipt Total], R.[Mark Up %], R.[Mark Up Total], R.Total  
FROM [Staging-TM-1-Reimburse] (nolock) R  
WHERE R.[Labor/Company Name] Is Not Null  
AND  R.BillID = @ProcessID  
ORDER BY R.ID  
GO
