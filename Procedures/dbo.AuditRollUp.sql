SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Anthony Troy>
-- Create date: <12-9-21>
-- Description:	<Check Equipmemt Rates then insert into Detail Table>
-- =============================================
CREATE PROCEDURE [dbo].[AuditRollUp] 
	-- Add the parameters for the stored procedure here
	@Bill_ID integer,
	@Job_ID integer,
	@Rest_Co_ID integer,
	@Summary_ID integer
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Prime Roll-up Tables

	-- Delete Old records

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

    -- Insert Detail-to-SubCat Temp Table
INSERT INTO [RA - Audit Results Roll-up - Temp - Detail to Sub Cat] 
( Audit_Summary_ID,
Audit_Results_Sub_Cat_Type_ID,
SumOfAudit_Results_Total_Detail_Cost,
SumOfAudit_Results_Total_Detail_Markup,
SumOfAudit_Results_Total_Detail_Bill_Amt,
SumOfAudit_Results_Total_Detail_Warning_Cost,
SumOfAudit_Results_Total_Detail_Error_Cost,
Audit_Results_Category_Type_ID,
MaxOfAudit_Results_Detail_Check_Status_ID,
SumOfAudit_Results_Count_of_Successes,
SumOfAudit_Results_Count_of_Warnings,
SumOfAudit_Results_Count_of_Failures,
SumOfAudit_Results_Total_Laborer_Cost,
SumOfAudit_Results_Total_Number_of_Laborers,
SumOfAudit_Results_Total_OT_Hours,
SumOfAudit_Results_Total_OT_Cost,
SumOfRate_Diff_Impact )
SELECT 
[RA - Audit Results - Detail].Audit_Summary_ID,
[RA - Audit Results - Detail].Audit_Results_Sub_Cat_Type_ID,
Sum([RA - Audit Results - Detail].Audit_Results_Total_Detail_Cost) AS SumOfAudit_Results_Total_Detail_Cost,
Sum([RA - Audit Results - Detail].Audit_Results_Total_Detail_Markup) AS SumOfAudit_Results_Total_Detail_Markup,
Sum([RA - Audit Results - Detail].Audit_Results_Total_Detail_Bill_Amt) AS SumOfAudit_Results_Total_Detail_Bill_Amt,
Sum([RA - Audit Results - Detail].Audit_Results_Total_Detail_Warning_Cost) AS SumOfAudit_Results_Total_Detail_Warning_Cost,
Sum([RA - Audit Results - Detail].Audit_Results_Total_Detail_Error_Cost) AS SumOfAudit_Results_Total_Detail_Error_Cost,
[RA - Audit Results - Detail].Audit_Results_Category_Type_ID,
Max([RA - Audit Results - Detail].Audit_Results_Detail_Check_Status_ID) AS MaxOfAudit_Results_Detail_Check_Status_ID,
Sum([RA - Audit Results - Detail].Audit_Results_Count_of_Successes) AS SumOfAudit_Results_Count_of_Successes,
Sum([RA - Audit Results - Detail].Audit_Results_Count_of_Warnings) AS SumOfAudit_Results_Count_of_Warnings,
Sum([RA - Audit Results - Detail].Audit_Results_Count_of_Failures) AS SumOfAudit_Results_Count_of_Failures,
Sum([RA - Audit Results - Detail].Audit_Results_Total_Laborer_Cost) AS SumOfAudit_Results_Total_Laborer_Cost,
Sum([RA - Audit Results - Detail].Audit_Results_Total_Number_of_Laborers) AS SumOfAudit_Results_Total_Number_of_Laborers,
Sum([RA - Audit Results - Detail].Audit_Results_Total_OT_Hours) AS SumOfAudit_Results_Total_OT_Hours,
Sum([RA - Audit Results - Detail].Audit_Results_Total_OT_Cost) AS SumOfAudit_Results_Total_OT_Cost,
Sum([RA - Audit Results - Detail].Rate_Diff_Impact) AS SumOfRate_Diff_Impact
FROM [RA - Audit Results - Detail]
GROUP BY [RA - Audit Results - Detail].Audit_Summary_ID, [RA - Audit Results - Detail].Audit_Results_Sub_Cat_Type_ID, [RA - Audit Results - Detail].Audit_Results_Category_Type_ID, [RA - Audit Results - Detail].Rest_Bill_ID
HAVING ((([RA - Audit Results - Detail].Audit_Summary_ID)=@Summary_ID) AND (([RA - Audit Results - Detail].Rest_Bill_ID)=@Bill_ID));

    -- Update Sub Cat Audit Table

UPDATE [RA - Audit Results - Sub Category Summary] 
SET [RA - Audit Results - Sub Category Summary].Audit_Results_Sub_Cat_Check_Status_ID = [RA - Audit Results Roll-up - Temp - Detail to Sub Cat].[MaxOfAudit_Results_Detail_Check_Status_ID],
[RA - Audit Results - Sub Category Summary].Audit_Results_Sub_Cat_Check_Performed = 'Y',
[RA - Audit Results - Sub Category Summary].Audit_Results_Sub_Cat_IA_Co_Approval_State = IIF([RA - Audit Results Roll-up - Temp - Detail to Sub Cat].[SumOfAudit_Results_Total_Detail_Error_Cost] > 0 or [RA - Audit Results Roll-up - Temp - Detail to Sub Cat].[SumOfRate_Diff_Impact] > 0, 3, 5),
[RA - Audit Results - Sub Category Summary].Audit_Results_Sub_Cat_Count_of_Successes = [RA - Audit Results Roll-up - Temp - Detail to Sub Cat].[SumOfAudit_Results_Count_of_Successes],
[RA - Audit Results - Sub Category Summary].Audit_Results_Sub_Cat_Count_of_Warnings = [RA - Audit Results Roll-up - Temp - Detail to Sub Cat].[SumOfAudit_Results_Count_of_Warnings],
[RA - Audit Results - Sub Category Summary].Audit_Results_Sub_Cat_Count_of_Failures = [RA - Audit Results Roll-up - Temp - Detail to Sub Cat].[SumOfAudit_Results_Count_of_Failures],
[RA - Audit Results - Sub Category Summary].Audit_Results_Total_Sub_Cat_Cost = [RA - Audit Results Roll-up - Temp - Detail to Sub Cat].[SumOfAudit_Results_Total_Detail_Bill_Amt],
[RA - Audit Results - Sub Category Summary].Audit_Results_Total_Sub_Cat_Markup = [RA - Audit Results Roll-up - Temp - Detail to Sub Cat].[SumOfAudit_Results_Total_Detail_Markup],
[RA - Audit Results - Sub Category Summary].Audit_Results_Total_Sub_Cat_Bill_Amt = [RA - Audit Results Roll-up - Temp - Detail to Sub Cat].[SumOfAudit_Results_Total_Detail_Bill_Amt],
[RA - Audit Results - Sub Category Summary].Audit_Results_Total_Sub_Cat_Warning_Cost = [RA - Audit Results Roll-up - Temp - Detail to Sub Cat].[SumOfAudit_Results_Total_Detail_Warning_Cost],
[RA - Audit Results - Sub Category Summary].Audit_Results_Total_Sub_Cat_Error_Cost = [RA - Audit Results Roll-up - Temp - Detail to Sub Cat].[SumOfAudit_Results_Total_Detail_Error_Cost],
[RA - Audit Results - Sub Category Summary].Audit_Results_Rate_Impact = [RA - Audit Results Roll-up - Temp - Detail to Sub Cat].[SumOfRate_Diff_Impact],
[RA - Audit Results - Sub Category Summary].Audit_Results_Total_OT_Cost = [RA - Audit Results Roll-up - Temp - Detail to Sub Cat].[SumOfAudit_Results_Total_OT_Cost],
[RA - Audit Results - Sub Category Summary].Audit_Results_Total_OT_Hours = [RA - Audit Results Roll-up - Temp - Detail to Sub Cat].[SumOfAudit_Results_Total_OT_Hours]
FROM [RA - Audit Results - Sub Category Summary]
INNER JOIN [RA - Audit Results Roll-up - Temp - Detail to Sub Cat] 
ON ([RA - Audit Results - Sub Category Summary].Audit_Summary_ID = [RA - Audit Results Roll-up - Temp - Detail to Sub Cat].Audit_Summary_ID) AND ([RA - Audit Results - Sub Category Summary].Audit_Results_Sub_Cat_Type_ID = [RA - Audit Results Roll-up - Temp - Detail to Sub Cat].Audit_Results_Sub_Cat_Type_ID) 
WHERE ((([RA - Audit Results - Sub Category Summary].Audit_Summary_ID)=@Summary_ID));

    -- Insert SubCat-to-Cat Temp Table
INSERT INTO [RA - Audit Results Roll-up - Temp - Sub Category to Cat] ( 
Audit_Results_Category_Type_ID, 
Audit_Summary_ID, 
MaxOfAudit_Results_Sub_Cat_Check_Status_ID, 
SumOfAudit_Results_Sub_Cat_Count_of_Successes, 
SumOfAudit_Results_Sub_Cat_Count_of_Warnings, 
SumOfAudit_Results_Sub_Cat_Count_of_Failures, 
SumOfAudit_Results_Total_Sub_Cat_Cost, 
SumOfAudit_Results_Total_Sub_Cat_Markup, 
SumOfAudit_Results_Total_Sub_Cat_Bill_Amt, 
SumOfAudit_Results_Total_Sub_Cat_Warning_Cost, 
SumOfAudit_Results_Total_Sub_Cat_Error_Cost, 
SumOfAudit_Results_Rate_Impact,
SumOfAudit_Results_OT_Hours,
SumOfAudit_Results_OT_Cost)
SELECT 
[RA - Audit Results - Sub Category Summary].Audit_Results_Category_Type_ID,
[RA - Audit Results - Sub Category Summary].Audit_Summary_ID, 
Max([RA - Audit Results - Sub Category Summary].Audit_Results_Sub_Cat_Check_Status_ID) AS MaxOfAudit_Results_Sub_Cat_Check_Status_ID, 
Sum([RA - Audit Results - Sub Category Summary].Audit_Results_Sub_Cat_Count_of_Successes) AS SumOfAudit_Results_Sub_Cat_Count_of_Successes, 
Sum([RA - Audit Results - Sub Category Summary].Audit_Results_Sub_Cat_Count_of_Warnings) AS SumOfAudit_Results_Sub_Cat_Count_of_Warnings, 
Sum([RA - Audit Results - Sub Category Summary].Audit_Results_Sub_Cat_Count_of_Failures) AS SumOfAudit_Results_Sub_Cat_Count_of_Failures, 
Sum([RA - Audit Results - Sub Category Summary].Audit_Results_Total_Sub_Cat_Cost) AS SumOfAudit_Results_Total_Sub_Cat_Cost, 
Sum([RA - Audit Results - Sub Category Summary].Audit_Results_Total_Sub_Cat_Markup) AS SumOfAudit_Results_Total_Sub_Cat_Markup, 
Sum([RA - Audit Results - Sub Category Summary].Audit_Results_Total_Sub_Cat_Bill_Amt) AS SumOfAudit_Results_Total_Sub_Cat_Bill_Amt, 
Sum([RA - Audit Results - Sub Category Summary].Audit_Results_Total_Sub_Cat_Warning_Cost) AS SumOfAudit_Results_Total_Sub_Cat_Warning_Cost, 
Sum([RA - Audit Results - Sub Category Summary].Audit_Results_Total_Sub_Cat_Error_Cost) AS SumOfAudit_Results_Total_Sub_Cat_Error_Cost, 
Sum([RA - Audit Results - Sub Category Summary].Audit_Results_Rate_Impact) AS SumOfAudit_Results_Rate_Impact,
Sum([RA - Audit Results - Sub Category Summary].Audit_Results_Total_OT_Hours) AS SumOfAudit_Results_OT_Hours,
Sum([RA - Audit Results - Sub Category Summary].Audit_Results_Total_OT_Cost) AS SumOfAudit_Results_OT_Cost
FROM [RA - Audit Results - Sub Category Summary] INNER JOIN [RA - Audit Results - Summary] ON [RA - Audit Results - Sub Category Summary].Audit_Summary_ID = [RA - Audit Results - Summary].Audit_Summary_ID
GROUP BY [RA - Audit Results - Sub Category Summary].Audit_Results_Category_Type_ID, [RA - Audit Results - Sub Category Summary].Audit_Summary_ID, [RA - Audit Results - Summary].Rest_Bill_ID, [RA - Audit Results - Summary].Job_ID, [RA - Audit Results - Summary].Rest_Co_ID
HAVING ((([RA - Audit Results - Sub Category Summary].Audit_Summary_ID)=@Summary_ID) AND (([RA - Audit Results - Summary].Rest_Bill_ID)=@Bill_ID) AND (([RA - Audit Results - Summary].Job_ID)=@Job_ID) AND (([RA - Audit Results - Summary].Rest_Co_ID)=@Rest_Co_ID));

    -- Update Cat Audit Table
UPDATE [RA - Audit Results - Category Summary] 
SET 
[RA - Audit Results - Category Summary].Audit_Results_Category_Check_Status_ID = [RA - Audit Results Roll-up - Temp - Sub Category to Cat].[MaxOfAudit_Results_Sub_Cat_Check_Status_ID],
[RA - Audit Results - Category Summary].Audit_Results_Category_Check_Performed = 'Y',
[RA - Audit Results - Category Summary].Audit_Results_IA_Co_Approval_State_Type_ID = IIF([RA - Audit Results Roll-up - Temp - Sub Category to Cat].[SumOfAudit_Results_Total_Sub_Cat_Error_Cost] > 0 or [RA - Audit Results Roll-up - Temp - Sub Category to Cat].[SumOfAudit_Results_Rate_Impact] > 0, 3, 5),
[RA - Audit Results - Category Summary].Audit_Results_Count_of_Successes = [RA - Audit Results Roll-up - Temp - Sub Category to Cat].[SumOfAudit_Results_Sub_Cat_Count_of_Successes],
[RA - Audit Results - Category Summary].Audit_Results_Count_of_Warnings = [RA - Audit Results Roll-up - Temp - Sub Category to Cat].[SumOfAudit_Results_Sub_Cat_Count_of_Warnings],
[RA - Audit Results - Category Summary].Audit_Results_Count_of_Failures = [RA - Audit Results Roll-up - Temp - Sub Category to Cat].[SumOfAudit_Results_Sub_Cat_Count_of_Failures],
[RA - Audit Results - Category Summary].Audit_Results_Total_Category_Cost = [RA - Audit Results Roll-up - Temp - Sub Category to Cat].[SumOfAudit_Results_Total_Sub_Cat_Cost],
[RA - Audit Results - Category Summary].Audit_Results_Total_Category_Markup = [RA - Audit Results Roll-up - Temp - Sub Category to Cat].[SumOfAudit_Results_Total_Sub_Cat_Markup],
[RA - Audit Results - Category Summary].Audit_Results_Total_Category_Bill_Amt = [RA - Audit Results Roll-up - Temp - Sub Category to Cat].[SumOfAudit_Results_Total_Sub_Cat_Bill_Amt],
[RA - Audit Results - Category Summary].Audit_Results_Total_Category_Warning_Cost = [RA - Audit Results Roll-up - Temp - Sub Category to Cat].[SumOfAudit_Results_Total_Sub_Cat_Warning_Cost],
[RA - Audit Results - Category Summary].Audit_Results_Total_Category_Error_Cost = [RA - Audit Results Roll-up - Temp - Sub Category to Cat].[SumOfAudit_Results_Total_Sub_Cat_Error_Cost],
[RA - Audit Results - Category Summary].Audit_Results_Rate_Impact = [RA - Audit Results Roll-up - Temp - Sub Category to Cat].[SumOfAudit_Results_Rate_Impact],
[RA - Audit Results - Category Summary].Audit_Results_Total_OT_Hours = [RA - Audit Results Roll-up - Temp - Sub Category to Cat].[SumOfAudit_Results_OT_Hours],
[RA - Audit Results - Category Summary].Audit_Results_Total_OT_Cost = [RA - Audit Results Roll-up - Temp - Sub Category to Cat].[SumOfAudit_Results_OT_Cost]
FROM [RA - Audit Results - Category Summary]
INNER JOIN [RA - Audit Results Roll-up - Temp - Sub Category to Cat] 
ON ([RA - Audit Results - Category Summary].Audit_Summary_ID = [RA - Audit Results Roll-up - Temp - Sub Category to Cat].Audit_Summary_ID) AND ([RA - Audit Results - Category Summary].Audit_Results_Category_Type_ID = [RA - Audit Results Roll-up - Temp - Sub Category to Cat].Audit_Results_Category_Type_ID) 
WHERE ((([RA - Audit Results - Category Summary].Audit_Summary_ID)=@Summary_ID));

    -- Insert SubCat-to-Cat Temp Table
INSERT INTO [RA - Audit Results Roll-up - Temp - Cat to Sum] ( 
Audit_Summary_ID,
MaxOfAudit_Results_Category_Check_Status_ID, 
SumOfAudit_Results_Count_of_Successes,
SumOfAudit_Results_Count_of_Warnings,
SumOfAudit_Results_Count_of_Failures,
SumOfAudit_Results_Total_Category_Cost,
SumOfAudit_Results_Total_Category_Markup,
SumOfAudit_Results_Total_Category_Bill_Amt,
SumOfAudit_Results_Total_Category_Warning_Cost,
SumOfAudit_Results_Total_Category_Error_Cost,
SumOfAudit_Results_Rate_Impact )
SELECT [RA - Audit Results - Category Summary].Audit_Summary_ID, 
Max([RA - Audit Results - Category Summary].Audit_Results_Category_Check_Status_ID) AS MaxOfAudit_Results_Category_Check_Status_ID,
Sum([RA - Audit Results - Category Summary].Audit_Results_Count_of_Successes) AS SumOfAudit_Results_Count_of_Successes,
Sum([RA - Audit Results - Category Summary].Audit_Results_Count_of_Warnings) AS SumOfAudit_Results_Count_of_Warnings,
Sum([RA - Audit Results - Category Summary].Audit_Results_Count_of_Failures) AS SumOfAudit_Results_Count_of_Failures,
Sum([RA - Audit Results - Category Summary].Audit_Results_Total_Category_Cost) AS SumOfAudit_Results_Total_Category_Cost,
Sum([RA - Audit Results - Category Summary].Audit_Results_Total_Category_Markup) AS SumOfAudit_Results_Total_Category_Markup,
Sum([RA - Audit Results - Category Summary].Audit_Results_Total_Category_Bill_Amt) AS SumOfAudit_Results_Total_Category_Bill_Amt,
Sum([RA - Audit Results - Category Summary].Audit_Results_Total_Category_Warning_Cost) AS SumOfAudit_Results_Total_Category_Warning_Cost,
Sum([RA - Audit Results - Category Summary].Audit_Results_Total_Category_Error_Cost) AS SumOfAudit_Results_Total_Category_Error_Cost,
Sum([RA - Audit Results - Category Summary].Audit_Results_Rate_Impact) AS SumOfAudit_Results_Rate_Impact
FROM [RA - Audit Results - Category Summary]
GROUP BY [RA - Audit Results - Category Summary].Audit_Summary_ID
HAVING ((([RA - Audit Results - Category Summary].Audit_Summary_ID)=@Summary_ID));

    -- Update Summary Audit Table
UPDATE [RA - Audit Results - Summary] 
SET [RA - Audit Results - Summary].Audit_Results_Total_Cat_Rollup_Cost = [RA - Audit Results Roll-up - Temp - Cat to Sum].[SumOfAudit_Results_Total_Category_Cost],
[RA - Audit Results - Summary].Audit_Results_Total_Cat_Rollup_Markup = [RA - Audit Results Roll-up - Temp - Cat to Sum].[SumOfAudit_Results_Total_Category_Markup],
[RA - Audit Results - Summary].Audit_Results_Total_Cat_Rollup_Bill_Amt = [RA - Audit Results Roll-up - Temp - Cat to Sum].[SumOfAudit_Results_Total_Category_Bill_Amt],
[RA - Audit Results - Summary].Audit_Results_Total_Summary_Cost = [RA - Audit Results Roll-up - Temp - Cat to Sum].[SumOfAudit_Results_Total_Category_Cost],
[RA - Audit Results - Summary].Audit_Results_Total_Summary_Warning_Cost = [RA - Audit Results Roll-up - Temp - Cat to Sum].[SumOfAudit_Results_Total_Category_Warning_Cost],
[RA - Audit Results - Summary].Audit_Results_Total_Summary_Error_Cost = IIF([RA - Audit Results Roll-up - Temp - Cat to Sum].[SumOfAudit_Results_Total_Category_Error_Cost] > 0, [RA - Audit Results Roll-up - Temp - Cat to Sum].[SumOfAudit_Results_Total_Category_Error_Cost], 0),
[RA - Audit Results - Summary].Audit_Results_Total_Rate_Impact = [RA - Audit Results Roll-up - Temp - Cat to Sum].[SumOfAudit_Results_Rate_Impact]

FROM [RA - Audit Results - Summary]
INNER JOIN [RA - Audit Results Roll-up - Temp - Cat to Sum] 
ON [RA - Audit Results - Summary].Audit_Summary_ID = [RA - Audit Results Roll-up - Temp - Cat to Sum].Audit_Summary_ID 
WHERE ((([RA - Audit Results - Summary].Audit_Summary_ID)=@Summary_ID));

END
GO
