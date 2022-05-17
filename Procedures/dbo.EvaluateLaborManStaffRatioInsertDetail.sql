SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Anthony Troy>
-- Create date: <12-9-21>
-- Description:	<Check Equipmemt Rates then insert into Detail Table>
-- [AT] 4-9 - Remove "%MAN%" and "%SUP%" update and replace with Alias Table Check
-- [AT] 4-10 - Add Overtime Ratio Audit Feature
-- [AT] 4-10 - Added Mark-up Audit
-- =============================================
CREATE PROCEDURE [dbo].[EvaluateLaborManStaffRatioInsertDetail] 
	-- Add the parameters for the stored procedure here
	@Bill_ID integer,
	@Job_ID integer,
	@Rest_Co_ID integer,
	@Summary_ID integer,
	@ManStaffRatioMultiple decimal(5,2),
	@PRRatioMultiple decimal(5,2) = 0.10
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare	@ManStaffRatio	decimal(5,2)
	declare	@PRRatio	decimal(5,2)

	-- SET @ManStaffRatio = 1 / @ManStaffRatioMultiple
	SET @ManStaffRatio = @ManStaffRatioMultiple
	SET @PRRatio = @PRRatioMultiple

    -- Remove old records
DELETE 
FROM [dbo].[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check]
WHERE [RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Bill_ID=@Bill_ID AND
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Co =@Rest_Co_ID AND
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Job_ID=@Job_ID;

   -- Default Man Ind to Staff in Unscrubbed labor Cost table
UPDATE [RA - Rest Bills Unscrubbed-Labor-Cost] SET [RA - Rest Bills Unscrubbed-Labor-Cost].Management_Staff_Ind = 'S'
WHERE ((([RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Bill_ID)=@Bill_ID));

   -- Set Man Ind based on Abbreviation to Unscrubbed labor Cost table
   -- Added EM (Exec Man), PE (Project Estimator)LLPM, PA, OPM,SPM, PDS, CMS, ADM, WHS as Management...also DSA (front desk Admin) Not Management
   -- Will move Man/Staff designation to Alias Table
UPDATE [RA - Rest Bills Unscrubbed-Labor-Cost] SET [RA - Rest Bills Unscrubbed-Labor-Cost].Management_Staff_Ind = 'M'
WHERE ((
([RA - Rest Bills Unscrubbed-Labor-Cost].Role_Abbreviation)='PM' Or
([RA - Rest Bills Unscrubbed-Labor-Cost].Role_Abbreviation)='APM' Or
([RA - Rest Bills Unscrubbed-Labor-Cost].Role_Abbreviation)='EM' Or
([RA - Rest Bills Unscrubbed-Labor-Cost].Role_Abbreviation)='PE' Or
([RA - Rest Bills Unscrubbed-Labor-Cost].Role_Abbreviation)='PDS' Or
([RA - Rest Bills Unscrubbed-Labor-Cost].Role_Abbreviation)='PDS' Or
([RA - Rest Bills Unscrubbed-Labor-Cost].Role_Abbreviation)='SPM' Or
([RA - Rest Bills Unscrubbed-Labor-Cost].Role_Abbreviation)='OPM' Or
([RA - Rest Bills Unscrubbed-Labor-Cost].Role_Abbreviation)='LLPM' Or
([RA - Rest Bills Unscrubbed-Labor-Cost].Role_Abbreviation)='CMS' Or
([RA - Rest Bills Unscrubbed-Labor-Cost].Role_Abbreviation)='ADM' Or
([RA - Rest Bills Unscrubbed-Labor-Cost].Role_Abbreviation)='WHS' Or
([RA - Rest Bills Unscrubbed-Labor-Cost].Role_Abbreviation)='DSA' Or
([RA - Rest Bills Unscrubbed-Labor-Cost].Role_Abbreviation)='PA' Or
([RA - Rest Bills Unscrubbed-Labor-Cost].Role_Abbreviation)='PC') 
AND (([RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Bill_ID)=@Bill_ID));

   -- Set Man Ind based on Abbreviation in role field to Unscrubbed labor Cost table
UPDATE [RA - Rest Bills Unscrubbed-Labor-Cost] SET [RA - Rest Bills Unscrubbed-Labor-Cost].Management_Staff_Ind = 'M'
WHERE ((
(IIf(Len([Role_Name])<=3,[Role_Name],''))='PM' Or (IIf(Len([Role_Name])<=3,[Role_Name],''))='APM' Or 
(IIf(Len([Role_Name])<=3,[Role_Name],''))='PD' Or (IIf(Len([Role_Name])<=3,[Role_Name],''))='SPM' Or 
(IIf(Len([Role_Name])<=3,[Role_Name],''))='PC') AND
(([RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Bill_ID)=@Bill_ID));

   -- Set Man Ind based on Role Name to Unscrubbed labor Cost table
--UPDATE [RA - Rest Bills Unscrubbed-Labor-Cost] SET [RA - Rest Bills Unscrubbed-Labor-Cost].Management_Staff_Ind = 'M'
--WHERE ((
--([RA - Rest Bills Unscrubbed-Labor-Cost].Role_Name) Like '%Man%' Or
--([RA - Rest Bills Unscrubbed-Labor-Cost].Role_Name) Like '%Sup%') AND
--(([RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Bill_ID)=@Bill_ID));

   -- Set Man Ind based on Alias Tables/Views
   -- [AT] Added the Update below to use the Alias Views for the Man Staff Check
   -- Ultimately, this would be all we would need to set Management appropriately
   --

UPDATE [RA - Rest Bills Unscrubbed-Labor-Cost] 
SET [RA - Rest Bills Unscrubbed-Labor-Cost].Management_Staff_Ind = 'M'
WHERE [RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Bill_ID = @Bill_ID and
[RA - Rest Bills Unscrubbed-Labor-Cost].Role_Name in 
(select [RA - Industry - Role Range plus Alias - Max Rate].Industry_Role_Name_Alias
from [RA - Industry - Role Range plus Alias - Max Rate]
where [RA - Industry - Role Range plus Alias - Max Rate].Industry_Role_Man_Staff_Ind = 'M');


    -- Insert Management Time
INSERT INTO [RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check] ( 
Rest_Bill_ID, Job_ID, Rest_Co, Management_Staff_Ind, 
Man_Regular_Hours,
Man_Prevailing_Rate_Hours,
Man_Regular_Daily_Cost,
Man_Prevailing_Cost,
Man_Total_Cost,
Man_OT_Hours,
Man_Total_Estimate_Cost_All_Laborers,
Man_Number_Of_Laborers,
Man_Markup_Cost)
SELECT 
[RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Bill_ID, [RA - Rest Bills Unscrubbed-Labor-Cost].Job_ID, [RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Co, [RA - Rest Bills Unscrubbed-Labor-Cost].Management_Staff_Ind,
Sum([RA - Rest Bills Unscrubbed-Labor-Cost].Regular_Hours) AS SumOfRegular_Hours,
Sum([RA - Rest Bills Unscrubbed-Labor-Cost].Prevailing_Rate_Hours) AS SumOfPrevailing_Rate_Hours,
Sum([RA - Rest Bills Unscrubbed-Labor-Cost].Regular_Daily_Cost) AS SumOfRegular_Daily_Cost,
Sum([RA - Rest Bills Unscrubbed-Labor-Cost].Prevailing_Cost) AS SumOfPrevailing_Cost,
Sum([RA - Rest Bills Unscrubbed-Labor-Cost].Total_Cost) AS SumOfTotal_Cost,
Sum([RA - Rest Bills Unscrubbed-Labor-Cost].OT_Hours) AS SumOfOT_Hours,
IIF(Sum([RA - Rest Bills Unscrubbed-Labor-Cost].Total_Estimate_Cost_All_Laborers) > 0,Sum([RA - Rest Bills Unscrubbed-Labor-Cost].Total_Estimate_Cost_All_Laborers), Sum([RA - Rest Bills Unscrubbed-Labor-Cost].Total_Cost)) AS SumOfTotal_Estimate_Cost_All_Laborers,
Sum([RA - Rest Bills Unscrubbed-Labor-Cost].Number_of_Laborers),
Sum([RA - Rest Bills Unscrubbed-Labor-Cost].Mark_Up_Cost)
FROM [RA - Rest Bills Unscrubbed-Labor-Cost]
GROUP BY [RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Bill_ID, [RA - Rest Bills Unscrubbed-Labor-Cost].Job_ID, [RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Co, [RA - Rest Bills Unscrubbed-Labor-Cost].Management_Staff_Ind
HAVING ((([RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Bill_ID)=@Bill_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Cost].Job_ID)=@Job_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Co)=@Rest_Co_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Cost].Management_Staff_Ind)='M'));

    -- Insert Staff Time

INSERT INTO [RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check] ( 
Rest_Bill_ID,
Job_ID,
Rest_Co,
Management_Staff_Ind,
Staff_Regular_Hours,
Staff_Prevailing_Rate_Hours,
Staff_Regular_Daily_Cost,
Staff_Prevailing_Cost,
Staff_Total_Cost,
Staff_OT_Hours,
Staff_Total_Estimate_Cost_All_Laborers,
Staff_Number_Of_Laborers,
Staff_Markup_Cost)
SELECT 
[RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Bill_ID, [RA - Rest Bills Unscrubbed-Labor-Cost].Job_ID, [RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Co, [RA - Rest Bills Unscrubbed-Labor-Cost].Management_Staff_Ind,
Sum([RA - Rest Bills Unscrubbed-Labor-Cost].Regular_Hours) AS SumOfRegular_Hours,
Sum([RA - Rest Bills Unscrubbed-Labor-Cost].Prevailing_Rate_Hours) AS SumOfPrevailing_Rate_Hours,
Sum([RA - Rest Bills Unscrubbed-Labor-Cost].Regular_Daily_Cost) AS SumOfRegular_Daily_Cost,
Sum([RA - Rest Bills Unscrubbed-Labor-Cost].Prevailing_Cost) AS SumOfPrevailing_Cost,
Sum([RA - Rest Bills Unscrubbed-Labor-Cost].Total_Cost) AS SumOfTotal_Cost,
Sum([RA - Rest Bills Unscrubbed-Labor-Cost].OT_Hours) AS SumOfOT_Hours,
IIF(Sum([RA - Rest Bills Unscrubbed-Labor-Cost].Total_Estimate_Cost_All_Laborers) > 0,Sum([RA - Rest Bills Unscrubbed-Labor-Cost].Total_Estimate_Cost_All_Laborers), Sum([RA - Rest Bills Unscrubbed-Labor-Cost].Total_Cost)) AS SumOfTotal_Estimate_Cost_All_Laborers,
Sum([RA - Rest Bills Unscrubbed-Labor-Cost].Number_of_Laborers) AS SumOfNumber_of_Laborers,
Sum([RA - Rest Bills Unscrubbed-Labor-Cost].Mark_Up_Cost)
FROM [RA - Rest Bills Unscrubbed-Labor-Cost]
GROUP BY [RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Bill_ID, [RA - Rest Bills Unscrubbed-Labor-Cost].Job_ID, [RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Co, [RA - Rest Bills Unscrubbed-Labor-Cost].Management_Staff_Ind
HAVING ((([RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Bill_ID)=@Bill_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Cost].Job_ID)=@Job_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Co)=@Rest_Co_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Cost].Management_Staff_Ind)='S'));

    -- Consolidate and Calculate

INSERT INTO [RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check] 
( Rest_Bill_ID,
Job_ID,
Rest_Co,
Man_Regular_Hours,
Man_Prevailing_Rate_Hours,
Man_Regular_Daily_Cost,
Man_Prevailing_Cost,
Man_Total_Cost,
Man_Number_Of_Laborers,
Man_OT_Hours,
Man_Total_Estimate_Cost_All_Laborers,
Staff_Regular_Hours,
Staff_Prevailing_Rate_Hours,
Staff_Regular_Daily_Cost,
Staff_Prevailing_Cost,
Staff_Total_Cost,
Staff_OT_Hours,
Staff_Total_Estimate_Cost_All_Laborers,
Management_Staff_Ind, 
Industry_Man_to_Staff_Ratio,
Ratio_Est_Savings, 
Staff_Number_Of_Laborers,
Man_Markup_Cost,
Staff_Markup_Cost,
Total_Markup_Cost)
SELECT [RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Bill_ID, 
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Job_ID, 
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Co, 
Sum([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Man_Regular_Hours) AS SumOfMan_Regular_Hours, 
Sum([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Man_Prevailing_Rate_Hours) AS SumOfMan_Prevailing_Rate_Hours, 
Sum([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Man_Regular_Daily_Cost) AS SumOfMan_Regular_Daily_Cost, 
Sum([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Man_Prevailing_Cost) AS SumOfMan_Prevailing_Cost, 
Sum([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Man_Total_Cost) AS SumOfMan_Total_Cost, 
Sum([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Man_Number_Of_Laborers) AS SumOfMan_Number_Of_Laborers, 
Sum([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Man_OT_Hours) AS SumOfMan_OT_Hours, 
Sum([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Man_Total_Estimate_Cost_All_Laborers) AS SumOfMan_Total_Estimate_Cost_All_Laborers, 
Sum([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Staff_Regular_Hours) AS SumOfStaff_Regular_Hours, 
Sum([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Staff_Prevailing_Rate_Hours) AS SumOfStaff_Prevailing_Rate_Hours, 
Sum([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Staff_Regular_Daily_Cost) AS SumOfStaff_Regular_Daily_Cost, 
Sum([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Staff_Prevailing_Cost) AS SumOfStaff_Prevailing_Cost, 
Sum([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Staff_Total_Cost) AS SumOfStaff_Total_Cost, 
Sum([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Staff_OT_Hours) AS SumOfStaff_OT_Hours, 
Sum([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Staff_Total_Estimate_Cost_All_Laborers) AS SumOfStaff_Total_Estimate_Cost_All_Laborers, 
'R' AS Man_Staff_Ind, 
@ManStaffRatio,
IIF(Sum([Man_Total_Estimate_Cost_All_Laborers]-([Staff_Total_Estimate_Cost_All_Laborers]*@ManStaffRatio)/(1-@ManStaffRatio)) < 0, 0, Sum([Man_Total_Estimate_Cost_All_Laborers]-([Staff_Total_Estimate_Cost_All_Laborers]*@ManStaffRatio)/(1-@ManStaffRatio)))  AS Expr1, 
Sum([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Staff_Number_Of_Laborers) AS SumOfStaff_Number_Of_Laborers,
Sum([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Man_Markup_Cost) AS SumOfManMarkupCost,
Sum([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Staff_Markup_Cost) AS SumOfStaffMarkupCost,
Sum([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Staff_Markup_Cost) + Sum([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Man_Markup_Cost) AS SumOfMarkupCost
FROM [RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check]
GROUP BY [RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Bill_ID, [RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Job_ID, [RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Co
HAVING ((([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Bill_ID)=@Bill_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Job_ID)=@Job_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Co)=@Rest_Co_ID));

   -- Update Ratios
   -- [AT] 4-10 Added PR Ratio and PR Savings

UPDATE [RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check] 
SET [RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Man_to_Staff_Ratio = [Man_Total_Estimate_Cost_All_Laborers]/([Staff_Total_Estimate_Cost_All_Laborers]+[Man_Total_Estimate_Cost_All_Laborers]),
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Total_Cost_Ratio = [Man_Total_Cost]/[Staff_Total_Cost],
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Regular_Hours_Ratio = [Man_Regular_Hours]/[Staff_Regular_Hours],

[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].OT_Hours_Ratio = IIf(([Man_Prevailing_Cost]+[Staff_Prevailing_Cost])>0,([Man_Prevailing_Cost]+[Staff_Prevailing_Cost])/([Staff_Total_Estimate_Cost_All_Laborers]+[Man_Total_Estimate_Cost_All_Laborers]),0),

[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].PR_Cost_Ratio = IIf(([Man_Prevailing_Cost]+[Staff_Prevailing_Cost])>0,([Man_Prevailing_Cost]+[Staff_Prevailing_Cost])/([Staff_Total_Estimate_Cost_All_Laborers]+[Man_Total_Estimate_Cost_All_Laborers]),0),

[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Ratio_Est_Savings = IIF(([Man_Total_Estimate_Cost_All_Laborers]-([Staff_Total_Estimate_Cost_All_Laborers]*@ManStaffRatio)/(1-@ManStaffRatio)) > 0, ([Man_Total_Estimate_Cost_All_Laborers]-([Staff_Total_Estimate_Cost_All_Laborers]*@ManStaffRatio)/(1-@ManStaffRatio)), 0),

[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].PR_Ratio_Est_Savings = IIF(( ([Man_Prevailing_Cost]+[Staff_Prevailing_Cost]) - (([Staff_Total_Estimate_Cost_All_Laborers]+[Man_Total_Estimate_Cost_All_Laborers])*@PRRatio/(1-@PRRatio)) > 0), ([Man_Prevailing_Cost]+[Staff_Prevailing_Cost]) - (([Staff_Total_Estimate_Cost_All_Laborers]+[Man_Total_Estimate_Cost_All_Laborers])*@PRRatio/(1-@PRRatio)), 0),
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Markup_Ratio_Est_Savings = [RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Total_Markup_Cost

WHERE ((([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Bill_ID)=@Bill_ID)
AND (([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Job_ID)=@Job_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Co)=@Rest_Co_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Management_Staff_Ind)='R'));


   -- May need a delete of Detail Table rows here

   -- Insert in Audit Detail Table
   -- Man to Staff Ratio
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
Industry_High_Rate,
Original_Rate )
SELECT [RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Bill_ID,
[RA - Audit Results - Summary].Audit_Summary_ID,
27 AS Expr3,
19 AS Expr2,
2 AS Expr1,
IIf([Ratio_Est_Savings]>0,3,1) AS Expr4,
'Y' AS Expr5,
2 AS Expr6,
IIf([Ratio_Est_Savings]>0,'Management to Staff Ratio is higher then industry','Management to Staff Ratio is not higher then industry') AS Expr7,
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Ratio_Est_Savings,
@ManStaffRatio AS Expr8,
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Industry_Man_to_Staff_Ratio
FROM [RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check] INNER JOIN 
[RA - Audit Results - Summary] ON ([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Co = [RA - Audit Results - Summary].Rest_Co_ID) AND
([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Job_ID = [RA - Audit Results - Summary].Job_ID) AND
([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Bill_ID = [RA - Audit Results - Summary].Rest_Bill_ID)
GROUP BY [RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Bill_ID, 
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Job_ID, 
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Co, 
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Management_Staff_Ind, 
[RA - Audit Results - Summary].Audit_Summary_ID, 
IIf([Ratio_Est_Savings]>0,'Management to Staff Ratio is higher then industry','Management to Staff Ratio is not higher then industry'), 
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Ratio_Est_Savings, 
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Industry_Man_to_Staff_Ratio
HAVING ((([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Bill_ID)=@Bill_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Job_ID)=@Job_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Co)=@Rest_Co_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Management_Staff_Ind)='R'));

   -- Insert in Audit Detail Table
   -- [AT] 4-10 Added PR Ratio and PR Savings Record to Detail Table

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
Industry_High_Rate,
Original_Rate )
SELECT [RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Bill_ID,
[RA - Audit Results - Summary].Audit_Summary_ID,
32 AS Expr3,
24 AS Expr2,
2 AS Expr1,
IIf([PR_Ratio_Est_Savings]>0,3,1) AS Expr4,
'Y' AS Expr5,
2 AS Expr6,
IIf([PR_Ratio_Est_Savings]>0,'Overtime-Premium Ratio is higher then industry','Overtime-Premium Ratio is not higher then industry') AS Expr7,
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].PR_Ratio_Est_Savings,
@PRRatio AS Expr8,
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].PR_Cost_Ratio
FROM [RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check] INNER JOIN 
[RA - Audit Results - Summary] ON ([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Co = [RA - Audit Results - Summary].Rest_Co_ID) AND
([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Job_ID = [RA - Audit Results - Summary].Job_ID) AND
([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Bill_ID = [RA - Audit Results - Summary].Rest_Bill_ID)
GROUP BY [RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Bill_ID, 
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Job_ID, 
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Co, 
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Management_Staff_Ind, 
[RA - Audit Results - Summary].Audit_Summary_ID, 
IIf([PR_Ratio_Est_Savings]>0,'Overtime-Premium Ratio is higher then industry','Overtime-Premium Ratio is not higher then industry'), 
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].PR_Ratio_Est_Savings, 
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].PR_Cost_Ratio
HAVING ((([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Bill_ID)=@Bill_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Job_ID)=@Job_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Co)=@Rest_Co_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Management_Staff_Ind)='R'));

   -- Insert in Audit Detail Table
   -- [AT] 4-10 Added Labor Markup Record to Detail Table

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
Rate_Diff_Impact)
SELECT [RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Bill_ID,
[RA - Audit Results - Summary].Audit_Summary_ID,
34 AS Expr3,
26 AS Expr2,
2 AS Expr1,
IIf([Markup_Ratio_Est_Savings]>0,3,1) AS Expr4,
'Y' AS Expr5,
2 AS Expr6,
IIf([Markup_Ratio_Est_Savings]>0,'Mark-up was found on Labor entries.','Mark-up was not found on Labor entries.') AS Expr7,
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Markup_Ratio_Est_Savings
FROM [RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check] INNER JOIN 
[RA - Audit Results - Summary] ON ([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Co = [RA - Audit Results - Summary].Rest_Co_ID) AND
([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Job_ID = [RA - Audit Results - Summary].Job_ID) AND
([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Bill_ID = [RA - Audit Results - Summary].Rest_Bill_ID)
GROUP BY [RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Bill_ID, 
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Job_ID, 
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Co, 
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Management_Staff_Ind, 
[RA - Audit Results - Summary].Audit_Summary_ID, 
IIf([PR_Ratio_Est_Savings]>0,'Mark-up was found on Labor entries.','Mark-up was not found on Labor entries.'), 
[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Markup_Ratio_Est_Savings
HAVING ((([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Bill_ID)=@Bill_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Job_ID)=@Job_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Rest_Co)=@Rest_Co_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check].Management_Staff_Ind)='R'));
END
GO
