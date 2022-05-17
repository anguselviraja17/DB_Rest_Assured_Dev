SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spLoadBillingXActLabor](@ProcessID int) as      
  
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
  
-- [AT] 4-14-22   
-- Removed Category and added SF and LF since activities are peformed by labor  
-- I excluded these from Equipment and Materials  
-- New logic is:  
--     Labor = Specifically Hourly, Square, Linear or Cubic feet  
--     Equipment = Specifically a unit of time outside of Hourly...DAY, MO, WEEK and variations  
--     Materials = Everything else...EA, Box, Gallon, etc...  
-- There could be cases where Materials become a dumping ground, but until we have better AI, it is important to ensure we don't double numbers  
--  
-- [AT] 5-2-22  
-- Changed Case logic. It was adding Remove and Replace and Unit Price causing a doubling of Unit Cost.  
-- See ticket https://novadata-solutions.atlassian.net/browse/RABE-35  
--  
-- [AT] 5-9-2022  
-- Added Mark-up and Tax to the load to Unscrubbed  
--  
  
INSERT INTO [RA - Rest Bills Unscrubbed-Labor-Cost]   
(Rest_Bill_ID, Job_ID, Rest_Co, Staff_Name, Role_Name,   
Role_Hourly_Rate,   
Work_Date, Regular_Hours, Prevailing_Rate_Hours,   
Regular_Daily_Cost,   
Prevailing_Cost, Total_Cost,  
Tax_or_OandP,  
Mark_Up_Cost )      
SELECT @BillID BillID, @JobID JobID, @RestCo RestCo, 'Labor', left(L.[Description],255),   
CASE WHEN [Unit Price] IS NULL THEN   
     CASE WHEN [Replace] IS NULL THEN  
       CASE WHEN [Remove] IS NULL THEN  
         0   
   ELSE [Remove] END  
  ELSE [Replace] END  
ELSE [Unit Price] END,   
L.Date, L.Qty, NULL,   
CASE WHEN [Unit Price] IS NULL THEN   
     CASE WHEN [Replace] IS NULL THEN  
       CASE WHEN [Remove] IS NULL THEN  
         0   
   ELSE [Remove] END  
  ELSE [Replace] END  
ELSE [Unit Price] END,   
NULL, L.Total,  
L.Tax,  
L.[Mark Up]   
FROM [Staging-XAct-1-Detail] L (nolock)       
WHERE (([Unit] IN ('HR', 'HOUR', 'SF', 'LF', 'CF')) or (Activity_Word_Match = 1))  
AND  L.BillID = @ProcessID  
ORDER BY L.ID   
  
--INSERT INTO [RA - Rest Bills Unscrubbed-Labor-Cost] (Rest_Bill_ID, Job_ID, Rest_Co, Staff_Name, Role_Name, Role_Hourly_Rate, Work_Date, Regular_Hours, Prevailing_Rate_Hours, Regular_Daily_Cost, Prevailing_Cost, Total_Cost )      
--SELECT @BillID BillID, @JobID JobID, @RestCo RestCo, 'Labor', L.[Description],   
--CASE WHEN [Unit Price] IS NULL THEN 0 ELSE [Unit Price] END +  
--CASE WHEN [Remove] IS NULL THEN 0 ELSE [Remove] END +   
--CASE WHEN [Replace] IS NULL THEN 0 ELSE [Replace] END,   
--L.Date, L.Qty, NULL,   
--CASE WHEN [Unit Price] IS NULL THEN 0 ELSE [Unit Price] END +  
--CASE WHEN [Remove] IS NULL THEN 0 ELSE [Remove] END +   
--CASE WHEN [Replace] IS NULL THEN 0 ELSE [Replace] END,   
--NULL, L.Total      
--FROM [Staging-XAct-1-Detail] L (nolock)       
--WHERE (([Unit] IN ('HR', 'HOUR', 'SF', 'LF', 'CF')) or (Activity_Word_Match = 1))  
--AND  L.BillID = @ProcessID      
--ORDER BY L.ID   
  
INSERT INTO TempDave (BillID, XActDetail, ProcName)  
SELECT @BillID, ID, 'Labor'  
FROM [Staging-XAct-1-Detail] L (nolock)       
WHERE (([Unit] IN ('HR', 'HOUR', 'SF', 'LF', 'CF')) or (Activity_Word_Match = 1))  
AND  L.BillID = @ProcessID      
ORDER BY L.ID   
  
--INSERT INTO [RA - Rest Bills Unscrubbed-Labor-Cost] (Rest_Bill_ID, Job_ID, Rest_Co, Staff_Name, Role_Abbreviation, Role_Hourly_Rate, Work_Date, Regular_Hours, Prevailing_Rate_Hours, Regular_Daily_Cost, Prevailing_Cost, Total_Cost )      
--SELECT @BillID BillID, @JobID JobID, @RestCo RestCo, 'Labor', L.[Description],   
--CASE WHEN [Unit Price] IS NULL THEN 0 ELSE [Unit Price] END +  
--CASE WHEN [Remove] IS NULL THEN 0 ELSE [Remove] END +   
--CASE WHEN [Replace] IS NULL THEN 0 ELSE [Replace] END,   
--L.Date, L.Qty, NULL,   
--CASE WHEN [Unit Price] IS NULL THEN 0 ELSE [Unit Price] END +  
--CASE WHEN [Remove] IS NULL THEN 0 ELSE [Remove] END +   
--CASE WHEN [Replace] IS NULL THEN 0 ELSE [Replace] END,   
--NULL, L.Total      
--FROM [Staging-XAct-1-Detail] L (nolock)       
--WHERE (Category IN ('LABOR') OR [Unit] IN ('HR', 'HOUR'))  
--AND  L.BillID = @ProcessID      
--ORDER BY L.ID   
  
--INSERT INTO TempDave (BillID, XActDetail, ProcName)  
--SELECT @BillID, ID, 'Labor'  
--FROM [Staging-XAct-1-Detail] L (nolock)       
--WHERE (Category IN ('LABOR') OR [Unit] IN ('HR', 'HOUR'))  
--AND  L.BillID = @ProcessID      
--ORDER BY L.ID   
GO
