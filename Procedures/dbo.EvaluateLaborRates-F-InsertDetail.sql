SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Anthony Troy>
-- Create date: <12-9-21>
-- Description:	<Check Equipmemt Rates then insert into Detail Table>
-- =============================================
CREATE PROCEDURE [dbo].[EvaluateLaborRates-F-InsertDetail] 
	-- Add the parameters for the stored procedure here
	@Bill_ID integer,
	@Job_ID integer,
	@Rest_Co_ID integer,
	@Summary_ID integer,
	@AllowablePercentOver float = 1.00
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
Declare @AllowablePercentOver1 float

--Set @AllowablePercentOver1 = 1.00
--SET @AllowablePercentOver = @AllowablePercentOver + @AllowablePercentOver1

	-- Look for Nulls in Role Name and copy Abbrev into it if it is also not Null
UPDATE [RA - Rest Bills Unscrubbed-Labor-Cost] 
SET [RA - Rest Bills Unscrubbed-Labor-Cost].[Role_Name] = IIf(Len([Role_Abbreviation])>0,[Role_Abbreviation],'')
WHERE ((([RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Bill_ID)=@Bill_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Cost].Role_Name) Is Null));

	-- Look for Abbreviations in Role Name anc copy to Abbrev Field
UPDATE [RA - Rest Bills Unscrubbed-Labor-Cost] 
SET [RA - Rest Bills Unscrubbed-Labor-Cost].Role_Abbreviation = IIf(Len([Role_Name])<=3 And Len([Role_Name])>0,[Role_Name],'')
WHERE ((([RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Bill_ID)=@Bill_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Cost].Role_Abbreviation) Is Null));


    -- Insert into Audit Details from Unscrubbed Labor By Role Name and look for FAILED Rate Check
	--
	-- [AT] Added OT/PR Hours and Cost to Detail Table Insert
	--

INSERT INTO [RA - Audit Results - Detail] ( 
Rest_Bill_ID, Audit_Results_Detail_Types_of_Issues, 
Audit_Results_Total_Detail_Cost, 
Audit_Results_Detail_Type_ID, 
Audit_Results_Sub_Cat_Type_ID, 
Audit_Results_Category_Type_ID, 
Audit_Results_Detail_Check_Performed, 
Audit_Results_Detail_Check_Status_ID, 
Audit_Summary_ID, 
Audit_Results_Total_Detail_Bill_Amt, 
Industry_High_Rate, 
Original_Volume, 
Original_Rate, 
Rate_Diff_Impact,
Audit_Results_Total_OT_Hours,
Audit_Results_Total_OT_Cost)
SELECT 
[RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Bill_ID,
'Role found-Rate is higher than Industry Range: '+[RA - Rest Bills Unscrubbed-Labor-Cost].[Role_Name] AS RoleDesc, 
Sum(IIf([Total_Estimate_Cost_All_Laborers]>0,[Total_Estimate_Cost_All_Laborers],
[Total_Cost])) AS TotalCostCalc,
14 AS Expr2,
15 AS Expr3,
2 AS Expr4,
'Y' AS Expr5,
3 AS Expr1,
@Summary_ID AS Expr6,
Sum(IIf([Total_Estimate_Cost_All_Laborers]>0,[Total_Estimate_Cost_All_Laborers],[Total_Cost])) AS Expr8,
Max([RA - Industry - Role Range plus Alias - Max Rate].Quart3OfRole_High_Rate_Day)*@AllowablePercentOver AS Industry_Rate_Q3, 
Sum([RA - Rest Bills Unscrubbed-Labor-Cost].Regular_Hours) AS SumOfRegular_Hours,
[RA - Rest Bills Unscrubbed-Labor-Cost].Role_Hourly_Rate, 
Sum(([Quart3OfRole_High_Rate_Day]*@AllowablePercentOver*[Regular_Hours])-([Role_Hourly_Rate]*[Regular_Hours]))*-1 AS Expr10,
Sum([RA - Rest Bills Unscrubbed-Labor-Cost].Prevailing_Rate_Hours) AS SumOfPR_Hours,
Sum([RA - Rest Bills Unscrubbed-Labor-Cost].Prevailing_Cost) SumOfPR_Cost 
FROM [RA - Rest Bills Unscrubbed-Labor-Cost] INNER JOIN [RA - Industry - Role Range plus Alias - Max Rate] 
ON [RA - Rest Bills Unscrubbed-Labor-Cost].Role_Name = [RA - Industry - Role Range plus Alias - Max Rate].Industry_Role_Name_Alias
GROUP BY 
[RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Bill_ID, 
'Role found-Rate is higher than Industry Range: '+[RA - Rest Bills Unscrubbed-Labor-Cost].[Role_Name],
[RA - Rest Bills Unscrubbed-Labor-Cost].Role_Hourly_Rate,
[RA - Rest Bills Unscrubbed-Labor-Cost].Job_ID,
[RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Co,
IIf(([Role_Hourly_Rate]-[Quart3OfRole_High_Rate_Day]*@AllowablePercentOver)>0,'F','S')
HAVING ((([RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Bill_ID)=@Bill_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Cost].Job_ID)=@Job_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Co)=@Rest_Co_ID) AND
((IIf(([Role_Hourly_Rate]-[Quart3OfRole_High_Rate_Day]*@AllowablePercentOver)>0,'F','S'))='F'));


-- Back-up after making change to Top Quarttile from "Max" Labor Rate
--
--SELECT 
--[RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Bill_ID,
--'Role found-Rate is higher than Industry Range: '+[RA - Rest Bills Unscrubbed-Labor-Cost].[Role_Name] AS RoleDesc, 
--Sum(IIf([Total_Estimate_Cost_All_Laborers]>0,[Total_Estimate_Cost_All_Laborers],
--[Total_Cost])) AS TotalCostCalc,
--14 AS Expr2,
--15 AS Expr3,
--2 AS Expr4,
--'Y' AS Expr5,
--3 AS Expr1,
--@Summary_ID AS Expr6,
--Sum(IIf([Total_Estimate_Cost_All_Laborers]>0,[Total_Estimate_Cost_All_Laborers],[Total_Cost])) AS Expr8,
--Max([RA - Industry - Role Range plus Alias - Max Rate].MaxOfRole_High_Rate), 
--Sum([RA - Rest Bills Unscrubbed-Labor-Cost].Regular_Hours) AS SumOfRegular_Hours,
--[RA - Rest Bills Unscrubbed-Labor-Cost].Role_Hourly_Rate, 
--Sum(([MaxOfRole_High_Rate]*[Regular_Hours])-([Role_Hourly_Rate]*[Regular_Hours]))*-1 AS Expr10
--FROM [RA - Rest Bills Unscrubbed-Labor-Cost] INNER JOIN [RA - Industry - Role Range plus Alias - Max Rate] 
--ON [RA - Rest Bills Unscrubbed-Labor-Cost].Role_Name = [RA - Industry - Role Range plus Alias - Max Rate].Industry_Role_Name_Alias
--GROUP BY 
--[RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Bill_ID, 
--'Role found-Rate is higher than Industry Range: '+[RA - Rest Bills Unscrubbed-Labor-Cost].[Role_Name],
--[RA - Rest Bills Unscrubbed-Labor-Cost].Role_Hourly_Rate,
--[RA - Rest Bills Unscrubbed-Labor-Cost].Job_ID,
--[RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Co,
--IIf((([Role_Hourly_Rate]-[MaxOfRole_High_Rate])/[Role_Hourly_Rate])>0,'F','S')
--HAVING ((([RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Bill_ID)=@Bill_ID) AND
--(([RA - Rest Bills Unscrubbed-Labor-Cost].Job_ID)=@Job_ID)
--AND (([RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Co)=@Rest_Co_ID)
--AND ((IIf((([Role_Hourly_Rate]-[MaxOfRole_High_Rate])/[Role_Hourly_Rate])>0,'F','S'))='F'));



END
GO
