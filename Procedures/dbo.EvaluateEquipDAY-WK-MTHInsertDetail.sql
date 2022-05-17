SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Anthony Troy>
-- Create date: <12-9-21>
-- Updated:
--  AT - 2-18-22: Changed logoc in calculating savings to use Total Cost instead of Quantity or Days
-- Description:	<Check Equipmemt Rates then insert into Detail Table>
-- =============================================
CREATE   PROCEDURE [dbo].[EvaluateEquipDAY-WK-MTHInsertDetail] 
	-- Add the parameters for the stored procedure here
	@Bill_ID integer,
	@Job_ID integer,
	@Rest_Co_ID integer,
	@Summary_ID integer,
	@WeeklyRatioRateMultiple decimal(5,2),
	@MonthlyRatioRateMultiple decimal(5,2)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
--INSERT INTO [RA - Audit Results - Detail] ( Audit_Results_Detail_Types_of_Issues, Audit_Results_Total_Detail_Error_Cost, Audit_Results_Total_Detail_Cost, Audit_Results_Detail_Check_Performed, Audit_Results_Detail_Check_Status_ID, Audit_Results_Count_of_Failures, Audit_Results_Sub_Cat_Type_ID, Audit_Results_Detail_Type_ID, Audit_Results_Category_Type_ID, Rest_Bill_ID, Audit_Summary_ID, Audit_Results_Total_Detail_Bill_Amt, Industry_High_Rate, Original_Rate, Original_Volume, Rate_Diff_Impact )
--SELECT 'Equip found-Rate is higher then Industry Range: '+[RA - Rest Bills Unscrubbed-Equipment].[Equipment_Name] AS Expr1, 0 AS Expr9, Sum([RA - Rest Bills Unscrubbed-Equipment].Total_Cost) AS SumOfTotal_Cost1, 'Y' AS Expr7, 3 AS Expr6, 1 AS Expr2, 11 AS Expr4, 26 AS Expr5, 4 AS Expr3, [RA - Rest Bills Unscrubbed-Equipment].Rest_Bill_ID, @Summary_ID AS Expr8, Sum([RA - Rest Bills Unscrubbed-Equipment].Total_Cost) AS SumOfTotal_Cost2, [RA - Industry - Equip Range plus Alias - Max Rate].MaxOfEquipment_High_Rate_Day, [RA - Rest Bills Unscrubbed-Equipment].Unit_Cost, Sum([RA - Rest Bills Unscrubbed-Equipment].Quantity) AS SumOfQuantity, Sum(([MaxOfEquipment_High_Rate_Day]*[Quantity])-([Unit_Cost]*[Quantity])) AS Expr10
--FROM [RA - Rest Bills Unscrubbed-Equipment] INNER JOIN [dbo].[RA - Industry - Equip Range plus Alias - Max Rate] ON [RA - Rest Bills Unscrubbed-Equipment].Equipment_Name = [RA - Industry - Equip Range plus Alias - Max Rate].Industry_Equip_Name_Alias
--GROUP BY [RA - Rest Bills Unscrubbed-Equipment].Rest_Bill_ID, [dbo].[RA - Industry - Equip Range plus Alias - Max Rate].MaxOfEquipment_High_Rate_Day, [RA - Rest Bills Unscrubbed-Equipment].Unit_Cost, [RA - Rest Bills Unscrubbed-Equipment].Job_ID, [RA - Rest Bills Unscrubbed-Equipment].Equipment_Name, IIf((([Unit_Cost]-[MaxOfEquipment_High_Rate_Day])/[Unit_Cost])>0,'F','S')
--HAVING ((([RA - Rest Bills Unscrubbed-Equipment].Rest_Bill_ID)= @Bill_ID) AND (([RA - Rest Bills Unscrubbed-Equipment].Job_ID)=@Job_ID) AND (([RA - Rest Bills Unscrubbed-Equipment].Equipment_Name) Is Not Null) AND ((IIf((([Unit_Cost]-[MaxOfEquipment_High_Rate_Day])/[Unit_Cost])>0,'F','S'))='F'));

DELETE 
FROM [RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check]
WHERE ((([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Bill_ID)=@Bill_ID) AND (([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Co_ID)=@Rest_Co_ID) AND (([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Job_ID)=@Job_ID));


-- [AT] Added code to accomodate rows for "Days in Use" with a valid values in it. Likey used for number of peices of equipment in a room
--      Mostly seen in Xactimate
-- [AT] 4-19-22
--      Lowered the threshold to apply a weekly rate to > 5 days (per FO Beta Partner)
--

INSERT INTO [RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check] 
( Rest_Bill_ID,
Rest_Co_ID,
Job_ID,
Unit_Type,
Equipment_ID,
Equipment_Name,
Unit_Cost,
Days_in_use_unique,
[Total Days Used],
SumOfQuantity,
SumOfTotal_Cost,
CalcWeeklyCost,
CalcWeeklySavings,
CalcMonthlyCost,
CalcMonthlySavings,
LargestSavings )
SELECT 
[RA - Rest Bills Unscrubbed-Equipment].Rest_Bill_ID,
[RA - Rest Bills Unscrubbed-Equipment].Rest_Co_ID,
[RA - Rest Bills Unscrubbed-Equipment].Job_ID,
[RA - Rest Bills Unscrubbed-Equipment].Unit_Type,
[RA - Rest Bills Unscrubbed-Equipment].Equipment_ID,
[RA - Rest Bills Unscrubbed-Equipment].Equipment_Name,
[RA - Rest Bills Unscrubbed-Equipment].Unit_Cost,
[RA - Rest Bills Unscrubbed-Equipment].Days_in_Use,

IIF( Sum([RA - Rest Bills Unscrubbed-Equipment].Days_in_Use) > Count([RA - Rest Bills Unscrubbed-Equipment].Work_Date), 
Sum([RA - Rest Bills Unscrubbed-Equipment].Days_in_Use), 
Count([RA - Rest Bills Unscrubbed-Equipment].Work_Date))  AS [Total Days Used],
--Count([RA - Rest Bills Unscrubbed-Equipment].Work_Date) AS [Total Days Used],

Sum([RA - Rest Bills Unscrubbed-Equipment].Quantity) AS [SumOfQuantity],
Sum([RA - Rest Bills Unscrubbed-Equipment].Total_Cost) AS SumOfTotal_Cost,

IIf(Count([RA - Rest Bills Unscrubbed-Equipment].Work_Date)>5,
Sum([RA - Rest Bills Unscrubbed-Equipment].Total_Cost)*@WeeklyRatioRateMultiple/7,0) AS CalcWeeklyCost,

IIf(Count([RA - Rest Bills Unscrubbed-Equipment].Work_Date)>5,
IIf(Sum([RA - Rest Bills Unscrubbed-Equipment].Total_Cost)*@WeeklyRatioRateMultiple/7<0,0,Sum([RA - Rest Bills Unscrubbed-Equipment].Total_Cost)-Sum([RA - Rest Bills Unscrubbed-Equipment].Total_Cost)*@WeeklyRatioRateMultiple/7),0) AS CalcWeeklySavings,

IIf(Count([RA - Rest Bills Unscrubbed-Equipment].Work_Date)>29,
Sum([RA - Rest Bills Unscrubbed-Equipment].Total_Cost)*@MonthlyRatioRateMultiple/30,0) AS CalcMonthlyCost,

IIf(Count([RA - Rest Bills Unscrubbed-Equipment].Work_Date)>29,
IIf(Sum([RA - Rest Bills Unscrubbed-Equipment].Total_Cost)-((Sum([RA - Rest Bills Unscrubbed-Equipment].Total_Cost)*@MonthlyRatioRateMultiple/30))<0,0,Sum([RA - Rest Bills Unscrubbed-Equipment].Total_Cost)-((Sum([RA - Rest Bills Unscrubbed-Equipment].Total_Cost)*@MonthlyRatioRateMultiple/30))),0) AS CalcMonthlySavings,

0 AS LargestSavings
FROM [RA - Rest Bills Unscrubbed-Equipment]
GROUP BY 
[RA - Rest Bills Unscrubbed-Equipment].Rest_Bill_ID,
[RA - Rest Bills Unscrubbed-Equipment].Rest_Co_ID,
[RA - Rest Bills Unscrubbed-Equipment].Job_ID,
[RA - Rest Bills Unscrubbed-Equipment].Unit_Type,
[RA - Rest Bills Unscrubbed-Equipment].Equipment_ID,
[RA - Rest Bills Unscrubbed-Equipment].Equipment_Name,
[RA - Rest Bills Unscrubbed-Equipment].Unit_Cost,
[RA - Rest Bills Unscrubbed-Equipment].Days_in_Use
HAVING (
(([RA - Rest Bills Unscrubbed-Equipment].Rest_Bill_ID)=@Bill_ID) AND
(([RA - Rest Bills Unscrubbed-Equipment].Rest_Co_ID)=@Rest_Co_ID) AND
(([RA - Rest Bills Unscrubbed-Equipment].Job_ID)=@Job_ID) AND

(([RA - Rest Bills Unscrubbed-Equipment].Unit_Type Like 'EA%') or ([RA - Rest Bills Unscrubbed-Equipment].Unit_Type Like 'PAIR%') or
([RA - Rest Bills Unscrubbed-Equipment].Unit_Type Like 'DA%') or ([RA - Rest Bills Unscrubbed-Equipment].Unit_Type Like 'WKLY%'))

);

-- [AT] Replaced "Day" with Like of EA and DA on 3-27
--(([RA - Rest Bills Unscrubbed-Equipment].Unit_Type)='DAY')

-- [AT] 4-11-22
-- Update Ratios to accomodate for Xactimate's approach to counting days
-- @WeeklyRatioRateMultiple

UPDATE [RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check] 

SET CalcWeeklyCost = IIf([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].[Total Days Used] >5, 
([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].SumOfTotal_Cost)*@WeeklyRatioRateMultiple/7,CalcWeeklyCost),

CalcWeeklySavings = IIf([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].[Total Days Used] > 5,
IIf(([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].SumOfTotal_Cost)*@WeeklyRatioRateMultiple/7<0,0,([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].SumOfTotal_Cost)-([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].SumOfTotal_Cost)*@WeeklyRatioRateMultiple/7),CalcWeeklySavings),

CalcMonthlyCost = IIf([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].[Total Days Used] > 29, ([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].SumOfTotal_Cost)*@MonthlyRatioRateMultiple/30,CalcMonthlyCost),

CalcMonthlySavings = IIf([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].[Total Days Used]>29,
IIf(([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].SumOfTotal_Cost)-((([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].SumOfTotal_Cost)*@MonthlyRatioRateMultiple/30))<0,0,([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].SumOfTotal_Cost)-((([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].SumOfTotal_Cost)*@MonthlyRatioRateMultiple/30))),CalcMonthlySavings)
WHERE (
(([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Bill_ID)=@Bill_ID) AND
(([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Co_ID)=@Rest_Co_ID) AND
(([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Job_ID)=@Job_ID) AND

((([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Unit_Type Like 'EA%') or([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Unit_Type Like 'PAIR%') or
([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Unit_Type Like 'DA%')) or

((([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Unit_Type)='WEEK') or ([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Unit_Type Like 'WKLY%')) OR
((([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Unit_Type)='MONTH'))));


   -- Update Ratios
   -- Updated on 3-27 - Changed "DAY" check to Like EA or DA
UPDATE [RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check] 
SET 
[RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].LargestSavings =
IIf([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].[CalcWeeklySavings]>[RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].[CalcMonthlySavings],[RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].[CalcWeeklySavings],[RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].[CalcMonthlySavings])
WHERE (
(([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Bill_ID)=@Bill_ID) AND
(([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Co_ID)=@Rest_Co_ID) AND
(([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Job_ID)=@Job_ID) AND

((([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Unit_Type Like 'EA%') or
([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Unit_Type Like 'DA%')) or

((([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Unit_Type)='WEEK')or ([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Unit_Type Like 'WKLY%')) OR
((([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Unit_Type)='MONTH'))));

    -- Insert Term Credit from Bill into Term Discount Credit Table
    -- [AT] 4-25-22 Removed this statement since I added code to move equip term discount from the bill to the "fees" table so it can be added to the audit

--INSERT INTO [RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check] ( Rest_Co_ID, Rest_Bill_ID, Job_ID, Equipment_Name, LargestSavings )
--SELECT [RA - Rest Bills Unscrubbed-Equip-Credit].Rest_Co_ID, [RA - Rest Bills Unscrubbed-Equip-Credit].Rest_Bill_ID, [RA - Rest Bills Unscrubbed-Equip-Credit].Job_ID, [RA - Rest Bills Unscrubbed-Equip-Credit].Equipment_Name, [RA - Rest Bills Unscrubbed-Equip-Credit].Total_Credit
--FROM [RA - Rest Bills Unscrubbed-Equip-Credit]
--WHERE ((([RA - Rest Bills Unscrubbed-Equip-Credit].Rest_Co_ID)=@Rest_Co_ID) AND (([RA - Rest Bills Unscrubbed-Equip-Credit].Rest_Bill_ID)=@Bill_ID) AND (([RA - Rest Bills Unscrubbed-Equip-Credit].Job_ID)=@Job_ID));

   -- Insert DAY, WEEK, MONTH into Detail Table
   -- Updated on 3-27 - Changed "DAY" check to Like EA or DA
INSERT INTO [RA - Audit Results - Detail] ( Rest_Bill_ID, Audit_Summary_ID, Audit_Results_Detail_Type_ID, Audit_Results_Sub_Cat_Type_ID, Audit_Results_Category_Type_ID, Audit_Results_Detail_Check_Status_ID, Audit_Results_Detail_Check_Performed, Audit_Results_Rest_Co_Approval_State, Audit_Results_Detail_Types_of_Issues, Rate_Diff_Impact, Original_Rate )
SELECT [RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Bill_ID, [RA - Audit Results - Summary].Audit_Summary_ID, 28 AS Expr3, 20 AS Expr2, 10 AS Expr1, IIf([LargestSavings]>0,3,1) AS Expr4, 'Y' AS Expr5, 2 AS Expr6, IIf([LargestSavings]>0,'Equip Term Discount is insufficient compared to  industry ratio for - '+[Equipment_Name],'Equip Term Discount is sufficient compared to  industry ratio for- '+[Equipment_Name]) AS Expr7, Sum([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].LargestSavings) AS SumOfLargestSavings1, [RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Unit_Cost
FROM [RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check] INNER JOIN [RA - Audit Results - Summary] ON ([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Bill_ID = [RA - Audit Results - Summary].Rest_Bill_ID) AND ([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Co_ID = [RA - Audit Results - Summary].Rest_Co_ID) AND ([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Job_ID = [RA - Audit Results - Summary].Job_ID)
GROUP BY [RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Bill_ID, [RA - Audit Results - Summary].Audit_Summary_ID, IIf([LargestSavings]>0,3,1), IIf([LargestSavings]>0,'Equip Term Discount is insufficient compared to  industry ratio for - '+[Equipment_Name],'Equip Term Discount is sufficient compared to  industry ratio for- '+[Equipment_Name]), [RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Unit_Cost, [RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Job_ID, [RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Co_ID, [RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Unit_Type
HAVING (((
[RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Bill_ID)=@Bill_ID) AND
(([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Job_ID)=@Job_ID) AND
(([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Co_ID)=@Rest_Co_ID)) and
(
(([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Unit_Type Like 'EA%') or
([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Unit_Type Like 'DA%')) or

([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].[Unit_Type] = 'WEEK') or
([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Unit_Type Like 'WKLY%') or 
([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].[Unit_Type] = 'MONTH'));

   -- Insert Term Credit into Detail Table
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
Original_Rate,
Audit_Results_Total_Detail_Bill_Amt,
Audit_Results_Total_Detail_Cost)
SELECT 
[RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Bill_ID,
[RA - Audit Results - Summary].Audit_Summary_ID,
28 AS Expr3,
20 AS Expr2,
10 AS Expr1,IIf([LargestSavings]>0,3,1) AS Expr4,
'Y' AS Expr5,
2 AS Expr6,
[Equipment_Name] AS Expr7, 
Sum([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].[LargestSavings]) AS SumOfLargestSavings1,
[RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Unit_Cost,
Sum([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].[LargestSavings]) AS SumOfLargestSavings2,
Sum([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].[LargestSavings]) AS SumOfLargestSavings3
FROM 
[RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check] INNER JOIN [RA - Audit Results - Summary] ON ([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Bill_ID = [RA - Audit Results - Summary].Rest_Bill_ID) AND ([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Co_ID = [RA - Audit Results - Summary].Rest_Co_ID) AND ([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Job_ID = [RA - Audit Results - Summary].Job_ID)
GROUP BY [RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Bill_ID,
[RA - Audit Results - Summary].Audit_Summary_ID,
IIf([LargestSavings]>0,3,1),[Equipment_Name],
[RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Unit_Cost,
[RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Job_ID,
[RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Co_ID,
[RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Unit_Type
HAVING ((([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Bill_ID)=@Bill_ID) AND (([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Job_ID)=@Job_ID) AND (([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].Rest_Co_ID)=@Rest_Co_ID)) and ([RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check].[Equipment_Name] = 'Term Discount');


END

GO
