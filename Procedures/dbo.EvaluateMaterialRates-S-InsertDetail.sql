SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Anthony Troy>
-- Create date: <12-9-21>
-- Description:	<Check Equipmemt Rates then insert into Detail Table>
-- [3-6-22  AT Added Max rate View and @AllowablePercentOver
-- =============================================
CREATE PROCEDURE [dbo].[EvaluateMaterialRates-S-InsertDetail] 
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

INSERT INTO [RA - Audit Results - Detail] 
( Audit_Results_Detail_Types_of_Issues,
Audit_Results_Total_Detail_Cost,
Audit_Results_Detail_Check_Performed,
Audit_Results_Detail_Check_Status_ID,
Audit_Results_Count_of_Successes,
Audit_Results_Sub_Cat_Type_ID,
Audit_Results_Detail_Type_ID,
Audit_Results_Category_Type_ID,
Rest_Bill_ID,
Audit_Summary_ID,
Audit_Results_Total_Detail_Bill_Amt,
Industry_High_Rate,
Original_Rate,
Original_Volume )
SELECT 'Material found-Rate is not higher than Industry Range:  '+[RA - Rest Bills Unscrubbed-Materials].[Material_Name] AS Expr1,
Sum([RA - Rest Bills Unscrubbed-Materials].Total_Cost) AS SumOfTotal_Cost1,
'Y' AS Expr7,
1 AS Expr6,
1 AS Expr2,
5 AS Expr4,
19 AS Expr5,
3 AS Expr3,
[RA - Rest Bills Unscrubbed-Materials].Rest_Bill_ID,
@Summary_ID AS Expr8,
Sum([RA - Rest Bills Unscrubbed-Materials].Total_Cost) AS SumOfTotal_Cost2,
[RA - Industry - Material Range plus Alias - Max Rate].Quart3OfMaterial_High_Rate*@AllowablePercentOver,
[RA - Rest Bills Unscrubbed-Materials].Unit_Cost,
Sum([RA - Rest Bills Unscrubbed-Materials].Quantity) AS SumOfQuantity
FROM
[RA - Rest Bills Unscrubbed-Materials] INNER JOIN
[RA - Industry - Material Range plus Alias - Max Rate] 
ON [RA - Rest Bills Unscrubbed-Materials].Material_Name = [RA - Industry - Material Range plus Alias - Max Rate].Industry_Material_Name_Alias
GROUP BY
[RA - Rest Bills Unscrubbed-Materials].Rest_Bill_ID,
[RA - Industry - Material Range plus Alias - Max Rate].Quart3OfMaterial_High_Rate*@AllowablePercentOver,
[RA - Rest Bills Unscrubbed-Materials].Unit_Cost,
[RA - Rest Bills Unscrubbed-Materials].Job_ID,
[RA - Rest Bills Unscrubbed-Materials].Material_Name,
IIf((([Unit_Cost]-([Quart3OfMaterial_High_Rate]*@AllowablePercentOver)))>0 and [RA - Industry - Material Range plus Alias - Max Rate].[NumOfMaterial_High_Rate] > 2,'F','S')
HAVING (((
[RA - Rest Bills Unscrubbed-Materials].Rest_Bill_ID)=@Bill_ID) AND
(([RA - Rest Bills Unscrubbed-Materials].Job_ID)=@Job_ID) AND
(([RA - Rest Bills Unscrubbed-Materials].Material_Name) Is Not Null) AND
((IIf((([Unit_Cost]-([Quart3OfMaterial_High_Rate]*@AllowablePercentOver)))>0 and [RA - Industry - Material Range plus Alias - Max Rate].[NumOfMaterial_High_Rate] > 2,'F','S'))='S'));

    -- Insert statements for procedure here
--INSERT INTO [RA - Audit Results - Detail] 
--( Rest_Bill_ID, Audit_Results_Total_Detail_Bill_Amt,
--Audit_Results_Detail_Check_Performed,
--Audit_Results_Rest_Co_Approval_State,
--Audit_Results_Detail_Type_ID,
--Audit_Results_Category_Type_ID,
--Audit_Results_Sub_Cat_Type_ID,
--Audit_Results_Detail_Check_Status_ID,
--Audit_Results_Detail_Types_of_Issues,
--Audit_Summary_ID,
--Audit_Results_Total_Detail_Cost,
--Industry_High_Rate,
--Original_Volume,
--Original_Rate )
--SELECT 
--[RA - Rest Bills Unscrubbed-Materials].Rest_Bill_ID,
--Sum([RA - Rest Bills Unscrubbed-Materials].Total_Cost) AS SumOfTotal_Cost,
--'Y' AS Expr7,
--1 AS Expr2,
--19 AS Expr5,
--3 AS Expr3,
--5 AS Expr4,
--1 AS Expr6,
--'Equip found-Rate is NOT higher than Industry Range: '+[RA - Rest Bills Unscrubbed-Materials].[Material_Name] AS Expr1,
--@Summary_ID AS Expr8,
--Sum([RA - Rest Bills Unscrubbed-Materials].Total_Cost) AS SumOfTotal_Cost2,
--[RA - Industry - Material Range plus Alias - Max Rate].MaxOfMaterial_High_Rate,
--Sum([RA - Rest Bills Unscrubbed-Materials].Quantity) AS SumOfQuantity,
--[RA - Rest Bills Unscrubbed-Materials].Unit_Cost
--FROM 
--[RA - Rest Bills Unscrubbed-Materials] INNER JOIN
--[RA - Industry - Material Range plus Alias - Max Rate] ON
--[RA - Rest Bills Unscrubbed-Materials].Material_Name = [RA - Industry - Material Range plus Alias - Max Rate].Industry_Material_Name_Alias
--GROUP BY 
--[RA - Rest Bills Unscrubbed-Materials].Rest_Bill_ID,
--'Equip found-Rate is NOT higher than Industry Range: '+[RA - Rest Bills Unscrubbed-Materials].[Material_Name],
--[RA - Industry - Material Range plus Alias - Max Rate].MaxOfMaterial_High_Rate, [RA - Rest Bills Unscrubbed-Materials].Unit_Cost,
--IIf((([Unit_Cost]-[MaxOfMaterial_High_Rate])/[Unit_Cost])>0,'F','S'),
--[RA - Rest Bills Unscrubbed-Materials].Job_ID,
--[RA - Rest Bills Unscrubbed-Materials].Rest_Co_ID,
--[RA - Rest Bills Unscrubbed-Materials].Unit_Type,
--[RA - Rest Bills Unscrubbed-Materials].Material_Name,
--[RA - Industry - Material Range plus Alias - Max Rate].MaxOfMaterial_High_Rate
--HAVING 
--((([RA - Rest Bills Unscrubbed-Materials].Rest_Bill_ID)=@Bill_ID) AND
--((IIf((([Unit_Cost]-[MaxOfMaterial_High_Rate])/[Unit_Cost])>0,'F','S'))='S') AND
--(([RA - Rest Bills Unscrubbed-Materials].Job_ID)=@Job_ID) AND
--(([RA - Rest Bills Unscrubbed-Materials].Rest_Co_ID)=@Rest_Co_ID));


END
GO
