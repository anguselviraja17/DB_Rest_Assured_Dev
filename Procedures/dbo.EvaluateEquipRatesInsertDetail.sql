SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Anthony Troy>
-- Create date: <12-9-21>
-- Description:	<Check Equipmemt Rates then insert into Detail Table>
-- =============================================
CREATE PROCEDURE [dbo].[EvaluateEquipRatesInsertDetail] 
	-- Add the parameters for the stored procedure here
	@Bill_ID integer,
	@Job_ID integer,
	@Summary_ID integer
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [RA - Audit Results - Detail] ( Audit_Results_Detail_Types_of_Issues, Audit_Results_Total_Detail_Error_Cost, Audit_Results_Total_Detail_Cost, Audit_Results_Detail_Check_Performed, Audit_Results_Detail_Check_Status_ID, Audit_Results_Count_of_Failures, Audit_Results_Sub_Cat_Type_ID, Audit_Results_Detail_Type_ID, Audit_Results_Category_Type_ID, Rest_Bill_ID, Audit_Summary_ID, Audit_Results_Total_Detail_Bill_Amt, Industry_High_Rate, Original_Rate, Original_Volume, Rate_Diff_Impact )
SELECT 'Equip found-Rate is higher then Industry Range: '+[RA - Rest Bills Unscrubbed-Equipment].[Equipment_Name] AS Expr1, 0 AS Expr9, Sum([RA - Rest Bills Unscrubbed-Equipment].Total_Cost) AS SumOfTotal_Cost1, 'Y' AS Expr7, 3 AS Expr6, 1 AS Expr2, 11 AS Expr4, 26 AS Expr5, 4 AS Expr3, [RA - Rest Bills Unscrubbed-Equipment].Rest_Bill_ID, @Summary_ID AS Expr8, Sum([RA - Rest Bills Unscrubbed-Equipment].Total_Cost) AS SumOfTotal_Cost2, [RA - Industry - Equip Range plus Alias - Max Rate].MaxOfEquipment_High_Rate_Day, [RA - Rest Bills Unscrubbed-Equipment].Unit_Cost, Sum([RA - Rest Bills Unscrubbed-Equipment].Quantity) AS SumOfQuantity, Sum(([MaxOfEquipment_High_Rate_Day]*[Quantity])-([Unit_Cost]*[Quantity])) AS Expr10
FROM [RA - Rest Bills Unscrubbed-Equipment] INNER JOIN [dbo].[RA - Industry - Equip Range plus Alias - Max Rate] ON [RA - Rest Bills Unscrubbed-Equipment].Equipment_Name = [RA - Industry - Equip Range plus Alias - Max Rate].Industry_Equip_Name_Alias
GROUP BY [RA - Rest Bills Unscrubbed-Equipment].Rest_Bill_ID, [dbo].[RA - Industry - Equip Range plus Alias - Max Rate].MaxOfEquipment_High_Rate_Day, [RA - Rest Bills Unscrubbed-Equipment].Unit_Cost, [RA - Rest Bills Unscrubbed-Equipment].Job_ID, [RA - Rest Bills Unscrubbed-Equipment].Equipment_Name, IIf((([Unit_Cost]-[MaxOfEquipment_High_Rate_Day])/[Unit_Cost])>0,'F','S')
HAVING ((([RA - Rest Bills Unscrubbed-Equipment].Rest_Bill_ID)= @Bill_ID) AND (([RA - Rest Bills Unscrubbed-Equipment].Job_ID)=@Job_ID) AND (([RA - Rest Bills Unscrubbed-Equipment].Equipment_Name) Is Not Null) AND ((IIf((([Unit_Cost]-[MaxOfEquipment_High_Rate_Day])/[Unit_Cost])>0,'F','S'))='F'));


END
GO
