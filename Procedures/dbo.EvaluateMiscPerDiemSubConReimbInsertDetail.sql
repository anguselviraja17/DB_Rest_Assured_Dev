SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Anthony Troy>
-- Create date: <12-9-21>
-- Updated AT - 1-20-22: Added Hotel to Detail 
-- Description:	<Check Equipmemt Rates then insert into Detail Table>
-- =============================================
CREATE    PROCEDURE [dbo].[EvaluateMiscPerDiemSubConReimbInsertDetail] 
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

    -- Remove old records

    -- Insert Sub Contractor
INSERT INTO [RA - Audit Results - Detail] ( Rest_Bill_ID, Audit_Results_Total_Detail_Cost, Audit_Results_Total_Detail_Markup, Audit_Results_Total_Detail_Bill_Amt, Audit_Summary_ID, Audit_Results_Detail_Type_ID, Audit_Results_Sub_Cat_Type_ID, Audit_Results_Category_Type_ID, Audit_Results_Detail_Check_Status_ID, Audit_Results_Detail_Check_Performed, Audit_Results_Total_Laborer_Cost )
SELECT [RA - Rest Bills Unscrubbed-Subcontractor-Cost].Rest_Bill_ID, Sum([RA - Rest Bills Unscrubbed-Subcontractor-Cost].Total_Cost) AS SumOfTotal_Cost, Sum([RA - Rest Bills Unscrubbed-Subcontractor-Cost].Markup_Total_Cost) AS SumOfMarkup_Total_Cost, Sum([RA - Rest Bills Unscrubbed-Subcontractor-Cost].Total_Due) AS SumOfTotal_Due, [RA - Audit Results - Summary].Audit_Summary_ID, 15 AS Expr1, 16 AS Expr2, 8 AS Expr3, 1 AS Expr4, 'Y' AS Expr5, Sum([RA - Rest Bills Unscrubbed-Subcontractor-Cost].Total_Due) AS SumOfTotal_Due1
FROM [RA - Rest Bills Unscrubbed-Subcontractor-Cost] INNER JOIN [RA - Audit Results - Summary] ON ([RA - Rest Bills Unscrubbed-Subcontractor-Cost].Job_ID = [RA - Audit Results - Summary].Job_ID) AND ([RA - Rest Bills Unscrubbed-Subcontractor-Cost].Rest_Bill_ID = [RA - Audit Results - Summary].Rest_Bill_ID)
GROUP BY [RA - Rest Bills Unscrubbed-Subcontractor-Cost].Rest_Bill_ID, [RA - Audit Results - Summary].Audit_Summary_ID, [RA - Rest Bills Unscrubbed-Subcontractor-Cost].Job_ID
HAVING ((([RA - Rest Bills Unscrubbed-Subcontractor-Cost].Rest_Bill_ID)=@Bill_ID) AND (([RA - Rest Bills Unscrubbed-Subcontractor-Cost].Job_ID)=@Job_ID));

    -- Insert Per Diem
INSERT INTO [RA - Audit Results - Detail] ( Audit_Results_Total_Detail_Cost, Audit_Results_Total_Detail_Bill_Amt, Audit_Summary_ID, Audit_Results_Detail_Type_ID, Audit_Results_Sub_Cat_Type_ID, Audit_Results_Category_Type_ID, Rest_Bill_ID, Audit_Results_Detail_Check_Status_ID, Audit_Results_Detail_Check_Performed )
SELECT Sum([RA - Rest Bills Unscrubbed-Labor-Per-Diem].Per_Diem) AS SumOfPer_Diem, Sum([RA - Rest Bills Unscrubbed-Labor-Per-Diem].Total_Cost) AS SumOfTotal_Cost, [RA - Audit Results - Summary].Audit_Summary_ID, 18 AS Expr1, 14 AS Expr2, 2 AS Expr3, [RA - Rest Bills Unscrubbed-Labor-Per-Diem].Rest_Bill_ID, 1 AS Expr4, 'Y' AS Expr5
FROM [RA - Rest Bills Unscrubbed-Labor-Per-Diem] INNER JOIN [RA - Audit Results - Summary] ON ([RA - Rest Bills Unscrubbed-Labor-Per-Diem].Rest_Co = [RA - Audit Results - Summary].Rest_Co_ID) AND ([RA - Rest Bills Unscrubbed-Labor-Per-Diem].Rest_Bill_ID = [RA - Audit Results - Summary].Rest_Bill_ID) AND ([RA - Rest Bills Unscrubbed-Labor-Per-Diem].Job_ID = [RA - Audit Results - Summary].Job_ID)
GROUP BY [RA - Audit Results - Summary].Audit_Summary_ID, [RA - Rest Bills Unscrubbed-Labor-Per-Diem].Rest_Bill_ID, [RA - Rest Bills Unscrubbed-Labor-Per-Diem].Job_ID, [RA - Rest Bills Unscrubbed-Labor-Per-Diem].Rest_Co
HAVING ((([RA - Rest Bills Unscrubbed-Labor-Per-Diem].Rest_Bill_ID)=@Bill_ID) AND (([RA - Rest Bills Unscrubbed-Labor-Per-Diem].Job_ID)=@Job_ID) AND (([RA - Rest Bills Unscrubbed-Labor-Per-Diem].Rest_Co)=@Rest_Co_ID));

    -- Insert Reimbursement (minus Markup)
	-- [AT] Updated to back-out Markup and add separate row on 4-10-22

INSERT INTO [RA - Audit Results - Detail] ( 
Audit_Results_Total_Detail_Cost,
Audit_Results_Total_Detail_Markup,
Audit_Results_Total_Detail_Bill_Amt,
Audit_Results_Total_Laborer_Cost,
Audit_Summary_ID,
Audit_Results_Detail_Type_ID,
Audit_Results_Sub_Cat_Type_ID,
Audit_Results_Category_Type_ID,
Rest_Bill_ID,
Audit_Results_Detail_Check_Status_ID,
Audit_Results_Detail_Check_Performed )
SELECT 
Sum([RA - Rest Bills Unscrubbed-Reimbursable-Items].Receipt_Total) AS SumOfReceipt_Total,
Sum([RA - Rest Bills Unscrubbed-Reimbursable-Items].Markup_Total_Cost) AS SumOfMarkup_Total_Cost,
Sum([RA - Rest Bills Unscrubbed-Reimbursable-Items].Total_Due) - Sum([RA - Rest Bills Unscrubbed-Reimbursable-Items].Markup_Total_Cost)  AS SumOfTotal_Due1,
Sum([RA - Rest Bills Unscrubbed-Reimbursable-Items].Total_Due) - Sum([RA - Rest Bills Unscrubbed-Reimbursable-Items].Markup_Total_Cost) AS SumOfTotal_Due,
[RA - Audit Results - Summary].Audit_Summary_ID,
25 AS Expr1,
18 AS Expr2,
9 AS Expr3,
[RA - Rest Bills Unscrubbed-Reimbursable-Items].Rest_Bill_ID,
1 AS Expr4,
'Y' AS Expr5
FROM [RA - Rest Bills Unscrubbed-Reimbursable-Items] INNER JOIN [RA - Audit Results - Summary] 
ON ([RA - Rest Bills Unscrubbed-Reimbursable-Items].Job_ID = [RA - Audit Results - Summary].Job_ID) AND
([RA - Rest Bills Unscrubbed-Reimbursable-Items].Rest_Bill_ID = [RA - Audit Results - Summary].Rest_Bill_ID)
GROUP BY 
[RA - Audit Results - Summary].Audit_Summary_ID,
[RA - Rest Bills Unscrubbed-Reimbursable-Items].Rest_Bill_ID,
[RA - Rest Bills Unscrubbed-Reimbursable-Items].Job_ID
HAVING ((([RA - Rest Bills Unscrubbed-Reimbursable-Items].Rest_Bill_ID)=@Bill_ID) AND (([RA - Rest Bills Unscrubbed-Reimbursable-Items].Job_ID)=@Job_ID));

    -- Insert Additional Reimbursement Row for Markup and "Flag" it
	-- [AT] Added on 4-10-22

INSERT INTO [RA - Audit Results - Detail] ( 
Audit_Results_Total_Detail_Cost,
Audit_Results_Total_Detail_Markup,
Audit_Results_Total_Detail_Bill_Amt,
Audit_Results_Total_Laborer_Cost,
Audit_Summary_ID,
Audit_Results_Detail_Type_ID,
Audit_Results_Sub_Cat_Type_ID,
Audit_Results_Category_Type_ID,
Rest_Bill_ID,
Audit_Results_Detail_Check_Status_ID,
Audit_Results_Detail_Check_Performed,
Rate_Diff_Impact,
Audit_Results_Detail_Types_of_Issues)
SELECT 
Sum([RA - Rest Bills Unscrubbed-Reimbursable-Items].Receipt_Total) AS SumOfReceipt_Total,
Sum([RA - Rest Bills Unscrubbed-Reimbursable-Items].Markup_Total_Cost) AS SumOfMarkup_Total_Cost,
Sum([RA - Rest Bills Unscrubbed-Reimbursable-Items].Markup_Total_Cost) AS SumOfTotal_Due1,
Sum([RA - Rest Bills Unscrubbed-Reimbursable-Items].Markup_Total_Cost) AS SumOfTotal_Due,
[RA - Audit Results - Summary].Audit_Summary_ID,
33 AS Expr1,
25 AS Expr2,
9 AS Expr3,
[RA - Rest Bills Unscrubbed-Reimbursable-Items].Rest_Bill_ID,
3 AS Expr4,
'Y' AS Expr5,
Sum([RA - Rest Bills Unscrubbed-Reimbursable-Items].Markup_Total_Cost) AS SumOfMarkUpRateImpact,
'Mark-up found on Reimbursable Items' AS ErrorDesc
FROM [RA - Rest Bills Unscrubbed-Reimbursable-Items] INNER JOIN [RA - Audit Results - Summary] 
ON ([RA - Rest Bills Unscrubbed-Reimbursable-Items].Job_ID = [RA - Audit Results - Summary].Job_ID) AND
([RA - Rest Bills Unscrubbed-Reimbursable-Items].Rest_Bill_ID = [RA - Audit Results - Summary].Rest_Bill_ID)
GROUP BY 
[RA - Audit Results - Summary].Audit_Summary_ID,
[RA - Rest Bills Unscrubbed-Reimbursable-Items].Rest_Bill_ID,
[RA - Rest Bills Unscrubbed-Reimbursable-Items].Job_ID
HAVING ((([RA - Rest Bills Unscrubbed-Reimbursable-Items].Rest_Bill_ID)=@Bill_ID)
AND (([RA - Rest Bills Unscrubbed-Reimbursable-Items].Job_ID)=@Job_ID));

    -- Insert Reimbursement from Hotels
INSERT INTO [RA - Audit Results - Detail] 
( Audit_Results_Total_Detail_Cost, 
Audit_Results_Total_Detail_Markup, 
Audit_Results_Total_Detail_Bill_Amt, 
Audit_Results_Total_Laborer_Cost, 
Audit_Summary_ID, Audit_Results_Detail_Type_ID, 
Audit_Results_Sub_Cat_Type_ID, 
Audit_Results_Category_Type_ID, 
Rest_Bill_ID, 
Audit_Results_Detail_Check_Status_ID, 
Audit_Results_Detail_Check_Performed )
SELECT 
Sum([RA - Rest Bills Unscrubbed-Hotels].[Rate Billed]) AS SumOfReceipt_Total,
Sum([RA - Rest Bills Unscrubbed-Hotels].[Mark Up Total]) AS SumOfMarkup_Total_Cost, 
Sum([RA - Rest Bills Unscrubbed-Hotels].[Total]) AS SumOfTotal_Due1, 
Sum([RA - Rest Bills Unscrubbed-Hotels].[Total]) AS SumOfTotal_Due, 
[RA - Audit Results - Summary].Audit_Summary_ID,
29 AS Expr1,
21 AS Expr2, 
9 AS Expr3,
[RA - Rest Bills Unscrubbed-Hotels].Rest_Bill_ID,
1 AS Expr4,
'Y' AS Expr5
FROM [RA - Rest Bills Unscrubbed-Hotels] 
INNER JOIN [RA - Audit Results - Summary] ON
([RA - Rest Bills Unscrubbed-Hotels].Job_ID = [RA - Audit Results - Summary].Job_ID) 
AND ([RA - Rest Bills Unscrubbed-Hotels].Rest_Bill_ID = [RA - Audit Results - Summary].Rest_Bill_ID)
GROUP BY 
[RA - Audit Results - Summary].Audit_Summary_ID,
[RA - Rest Bills Unscrubbed-Hotels].Rest_Bill_ID,
[RA - Rest Bills Unscrubbed-Hotels].Job_ID
HAVING ((([RA - Rest Bills Unscrubbed-Hotels].Rest_Bill_ID)=@Bill_ID) AND (([RA - Rest Bills Unscrubbed-Hotels].Job_ID)=@Job_ID));


    -- Insert Reimbursement from Other-Fee-Total table
	-- If we find rows here we consider it an error to be flagged
    -- 
    -- [AT] 5-15-22 - Added a condition to exclude "Totals" from the insertion into the Detail Table
    --
INSERT INTO [RA - Audit Results - Detail] 
( Audit_Results_Total_Detail_Cost, 
Audit_Results_Total_Detail_Bill_Amt, 
Audit_Results_Total_Laborer_Cost, 
Audit_Summary_ID,
Audit_Results_Detail_Type_ID, 
Audit_Results_Sub_Cat_Type_ID, 
Audit_Results_Category_Type_ID, 
Rest_Bill_ID, 
Audit_Results_Detail_Check_Status_ID, 
Audit_Results_Detail_Check_Performed,
Audit_Results_Detail_Types_of_Issues)
SELECT 
Sum([RA - Rest Bills Unscrubbed-Other-Fee-Totals].Total_Due) AS SumOfTotal_Due, 
Sum([RA - Rest Bills Unscrubbed-Other-Fee-Totals].Total_Due) AS SumOfTotal_Due1, 
Sum([RA - Rest Bills Unscrubbed-Other-Fee-Totals].Total_Due) AS SumOfTotal_Due2, 
[RA - Audit Results - Summary].Audit_Summary_ID,
30 AS Expr1,
22 AS Expr2, 
12 AS Expr3,
[RA - Rest Bills Unscrubbed-Other-Fee-Totals].Rest_Bill_ID,
3 AS Expr4,
'Y' AS Expr5,
'Detail not found for Additional Fees' AS Exp6
FROM [RA - Rest Bills Unscrubbed-Other-Fee-Totals] 
INNER JOIN [RA - Audit Results - Summary] ON
([RA - Rest Bills Unscrubbed-Other-Fee-Totals].Job_ID = [RA - Audit Results - Summary].Job_ID) 
AND ([RA - Rest Bills Unscrubbed-Other-Fee-Totals].Rest_Bill_ID = [RA - Audit Results - Summary].Rest_Bill_ID)
 and 
(([RA - Rest Bills Unscrubbed-Other-Fee-Totals].Fee_Name Not like '%Total%') and ([RA - Rest Bills Unscrubbed-Other-Fee-Totals].Fee_Name Not Like '%Base Bill%'))
GROUP BY 
[RA - Audit Results - Summary].Audit_Summary_ID,
[RA - Rest Bills Unscrubbed-Other-Fee-Totals].Rest_Bill_ID,
[RA - Rest Bills Unscrubbed-Other-Fee-Totals].Job_ID
HAVING ((([RA - Rest Bills Unscrubbed-Other-Fee-Totals].Rest_Bill_ID)=@Bill_ID) AND (([RA - Rest Bills Unscrubbed-Other-Fee-Totals].Job_ID)=@Job_ID));

    -- Insert into Term Discount Credit into Detail Table

-- [AT] 4-24-22 - Added code to move Equip Term Discount into Detail Table

INSERT INTO [RA - Audit Results - Detail]
 ( Rest_Bill_ID,
  Audit_Summary_ID,
  Audit_Results_Detail_Type_ID,
  Audit_Results_Sub_Cat_Type_ID,
  Audit_Results_Category_Type_ID,
  Audit_Results_Detail_Check_Status_ID,
  Audit_Results_Detail_Check_Performed,
  Audit_Results_Rest_Co_Approval_State,
  Audit_Results_Detail_Types_of_Issues,
  Rate_Diff_Impact,
  Audit_Results_Total_Detail_Cost,
  Audit_Results_Total_Detail_Bill_Amt)
  SELECT 
[RA - Rest Bills Unscrubbed-Equip-Credit].Rest_Bill_ID,
@Summary_ID,
 28 AS Expr3,
 20 AS Expr2,
 10 AS Expr1,
 1 AS Expr4,
  'Y' AS Expr5,
   2 AS Expr6,
'Term Discount' AS Expr7, 
[RA - Rest Bills Unscrubbed-Equip-Credit].Total_Credit AS SumOfLargestSavings1,
[RA - Rest Bills Unscrubbed-Equip-Credit].Total_Credit,
[RA - Rest Bills Unscrubbed-Equip-Credit].Total_Credit
FROM [RA - Rest Bills Unscrubbed-Equip-Credit]
WHERE ((([RA - Rest Bills Unscrubbed-Equip-Credit].Rest_Bill_ID)=@Bill_ID) AND
(([RA - Rest Bills Unscrubbed-Equip-Credit].Job_ID)=@Job_ID) 
AND (([RA - Rest Bills Unscrubbed-Equip-Credit].Rest_Co_ID)=@Rest_Co_ID));

--INSERT INTO [RA - Audit Results - Detail]
-- ( Rest_Bill_ID,
--  Audit_Summary_ID,
--  Audit_Results_Detail_Type_ID,
--  Audit_Results_Sub_Cat_Type_ID,
--  Audit_Results_Category_Type_ID,
--  Audit_Results_Detail_Check_Status_ID,
--  Audit_Results_Detail_Check_Performed,
--  Audit_Results_Rest_Co_Approval_State,
--  Audit_Results_Detail_Types_of_Issues,
--  Rate_Diff_Impact,
--  Original_Rate )
--SELECT 
--[RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Bill_ID,
--[RA - Audit Results - Summary].Audit_Summary_ID,
-- 28 AS Expr3,
-- 20 AS Expr2,
-- 10 AS Expr1,
-- IIf([LargestSavings]>0,3,1) AS Expr4,
--  'Y' AS Expr5,
--   2 AS Expr6,
--    IIf([LargestSavings]>0,'Equip Term Discount is insufficient compared to  industry ratio for - '+[Equipment_Name],'Equip Term Discount is sufficient compared to  industry ratio for- '+[Equipment_Name]) AS Expr7, 
--	Sum([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].LargestSavings) AS SumOfLargestSavings1, 
---	[RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Unit_Cost
--FROM [RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check] INNER JOIN [RA - Audit Results - Summary] ON ([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Bill_ID = [RA - Audit Results - Summary].Rest_Bill_ID) AND ([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Co_ID = [RA - Audit Results - Summary].Rest_Co_ID) AND ([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Job_ID = [RA - Audit Results - Summary].Job_ID)
--GROUP BY [RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Bill_ID, [RA - Audit Results - Summary].Audit_Summary_ID, IIf([LargestSavings]>0,3,1), IIf([LargestSavings]>0,'Equip Term Discount is insufficient compared to  industry ratio for - '+[Equipment_Name],'Equip Term Discount is sufficient compared to  industry ratio for- '+[Equipment_Name]), [RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Unit_Cost, [RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Job_ID, [RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Co_ID
--HAVING ((([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Bill_ID)=@Bill_ID) AND (([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Job_ID)=@Job_ID) AND (([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Co_ID)=@Rest_Co_ID));

END

GO
