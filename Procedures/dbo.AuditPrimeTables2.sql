SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  <Anthony Troy>  
-- Create date: <1-26-22>  
-- Description: <Prime a new set of Audit records for a new Bill>  
-- =============================================  
CREATE PROCEDURE [dbo].[AuditPrimeTables2]   
 -- Add the parameters for the stored procedure here  
 @Bill_ID integer,  
 @Job_ID integer,  
 @Rest_Co_ID integer,  
 @Submission_ID integer   

AS  
BEGIN  
  
 DECLARE @Summary_ID integer

    -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
  
    -- Prime Roll-up Audit Summary Table  
INSERT INTO [RA - Audit Results - Summary]   
( Rest_Bill_ID,  
Job_ID,  
Rest_Co_ID,  
Audit_Date,  
Audit_User_ID,  
Audit_Results_Total_Job_Cost,  
Audit_Results_Current_Bill_Amount,  
Submission_ID,  
Submission_Sequence_Number,  
Audit_Results_Total_Summary_Error_Cost,  
Audit_Results_Total_Rate_Impact )  
SELECT   
[RA - Rest Bills].Rest_Bill_ID,  
[RA - Rest Bills].Job_ID,  
[RA - Jobs-ROMs].Rest_Co_ID, getDate() AS Expr1,  
'System' AS Expr2,  
[RA - Rest Bills].Billing_Amount,  
[RA - Rest Bills].Billing_Total,  
[RA - Workflow - Bill Submission State].Submission_ID,  
[RA - Workflow - Bill Submission State].Submission_Sequence_Number,  
0 AS Expr3,  
0 AS Expr4  
FROM   
([RA - Rest Bills] INNER JOIN   
[RA - Jobs-ROMs] ON [RA - Rest Bills].Job_ID = [RA - Jobs-ROMs].Job_ID) INNER JOIN  
[RA - Workflow - Bill Submission State] ON [RA - Jobs-ROMs].Job_ID = [RA - Workflow - Bill Submission State].Job_ID  
WHERE   
((([RA - Rest Bills].Rest_Bill_ID)=@Bill_ID) AND  
(([RA - Rest Bills].Job_ID)=@Job_ID) AND  
(([RA - Jobs-ROMs].Rest_Co_ID)=@Rest_Co_ID) AND  
(([RA - Workflow - Bill Submission State].Submission_ID)=@Submission_ID));  
  
   -- Get Summary ID  
  
select @Summary_ID  = [RA - Audit Results - Summary].Audit_Summary_ID  
from [RA - Audit Results - Summary]  
where [RA - Audit Results - Summary].Job_ID = @Job_ID and  
        [RA - Audit Results - Summary].Rest_Bill_ID = @Bill_ID and  
        [RA - Audit Results - Summary].Rest_Co_ID = @Rest_Co_ID  
  
  
 -- Delete Old Cat and Sub-Cat records just in case  
  
DELETE   
FROM [RA - Audit Results - Sub Category Summary]  
WHERE [RA - Audit Results - Sub Category Summary].Audit_Summary_ID =@Summary_ID;  
  
DELETE   
FROM [RA - Audit Results - Category Summary]  
WHERE [RA - Audit Results - Category Summary].Audit_Summary_ID =@Summary_ID;  
  
 -- Prime New Category records  
  
INSERT INTO [RA - Audit Results - Category Summary]   
(Audit_Results_Category_Type_ID,   
Audit_Summary_ID,   
Audit_Results_Category_Check_Performed,   
Audit_Results_Category_Check_Status_ID )  
SELECT   
[RA - Audit Results - Category Types].Audit_Results_Category_Type_ID,   
@Summary_ID AS Expr1,   
'N' AS Expr2,  
4 AS Expr3  
FROM [RA - Audit Results - Category Types];  
  
 -- Prime New Sub-Category records  
  
INSERT INTO [RA - Audit Results - Sub Category Summary]   
( Audit_Results_Sub_Cat_Type_ID,   
Audit_Results_Sub_Cat_Check_Performed,   
Audit_Results_Sub_Cat_Check_Status_ID,   
Audit_Summary_ID,   
Audit_Results_Category_Type_ID )  
SELECT   
[RA - Audit Results - Sub Cat Types].Audit_Results_Sub_Cat_Type_ID,  
'N' AS Expr2,  
4 AS Expr3,  
[RA - Audit Results - Category Summary].Audit_Summary_ID,  
[RA - Audit Results - Sub Cat Types].Audit_Results_Category_Type_ID  
FROM   
[RA - Audit Results - Sub Cat Types] INNER JOIN [RA - Audit Results - Category Summary]   
ON [RA - Audit Results - Sub Cat Types].Audit_Results_Category_Type_ID = [RA - Audit Results - Category Summary].Audit_Results_Category_Type_ID  
WHERE   
((([RA - Audit Results - Category Summary].Audit_Summary_ID)=@Summary_ID));  
  
    -- Remove old records from Detail, Sub Cat and Cat Temp Roll-up Tables  
  
DELETE  
FROM [RA - Audit Results Roll-up - Temp - Detail to Sub Cat]  
WHERE [RA - Audit Results Roll-up - Temp - Detail to Sub Cat].[Audit_Summary_ID] = @Summary_ID  
  
DELETE  
FROM [RA - Audit Results Roll-up - Temp - Sub Category to Cat]  
WHERE [RA - Audit Results Roll-up - Temp - Sub Category to Cat].[Audit_Summary_ID] = @Summary_ID  
  
DELETE  
FROM [RA - Audit Results Roll-up - Temp - Cat to Sum]  
WHERE [RA - Audit Results Roll-up - Temp - Cat to Sum].[Audit_Summary_ID] = @Summary_ID  

SET NOCOUNT OFF

RETURN @Summary_ID

END  
GO
