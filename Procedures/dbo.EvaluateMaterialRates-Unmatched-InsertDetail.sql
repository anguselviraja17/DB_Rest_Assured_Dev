SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Anthony Troy>
-- Create date: <12-9-21>
-- Description:	<Check Equipmemt Rates then insert into Detail Table>
-- =============================================
CREATE PROCEDURE [dbo].[EvaluateMaterialRates-Unmatched-InsertDetail] 
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

    -- Insert statements for procedure here
INSERT INTO [RA - Audit Results - Detail] ( 
Rest_Bill_ID, 
Audit_Results_Total_Detail_Error_Cost, 
Audit_Results_Total_Detail_Bill_Amt, 
Audit_Results_Detail_Check_Performed, 
Audit_Results_Count_of_Failures, 
Audit_Results_Detail_Type_ID, 
Audit_Results_Category_Type_ID, 
Audit_Results_Sub_Cat_Type_ID, 
Audit_Results_Detail_Check_Status_ID, 
Audit_Results_Detail_Types_of_Issues, 
Audit_Summary_ID, 
Audit_Results_Total_Detail_Cost )
SELECT 
[RA - Rest Bills Unscrubbed-Materials].Rest_Bill_ID, 
Sum([RA - Rest Bills Unscrubbed-Materials].Total_Cost) AS SumOfTotal_Cost1, 
Sum([RA - Rest Bills Unscrubbed-Materials].Total_Cost) AS SumOfTotal_Cost, 
'Y' AS Expr7, 
1 AS Expr2, 
19 AS Expr5, 
3 AS Expr3, 
5 AS Expr4, 
3 AS Expr6, 
'Material Not in Industry Alias: '+[RA - Rest Bills Unscrubbed-Materials].[Material_Name] AS Expr1, 
@Summary_ID AS Expr8, Sum([RA - Rest Bills Unscrubbed-Materials].Total_Cost) AS SumOfTotal_Cost2
FROM [RA - Rest Bills Unscrubbed-Materials] 
LEFT JOIN [RA - Industry - Material Range plus Alias - Max Rate] 
ON [RA - Rest Bills Unscrubbed-Materials].Material_Name = [RA - Industry - Material Range plus Alias - Max Rate].Industry_Material_Name_Alias
GROUP BY [RA - Rest Bills Unscrubbed-Materials].Rest_Bill_ID, 'Material Not in Industry Alias: '+[RA - Rest Bills Unscrubbed-Materials].[Material_Name], [RA - Rest Bills Unscrubbed-Materials].Job_ID, [RA - Rest Bills Unscrubbed-Materials].Rest_Co_ID, [RA - Rest Bills Unscrubbed-Materials].Unit_Type, [RA - Industry - Material Range plus Alias - Max Rate].Industry_Material_Name_Alias
HAVING (((
[RA - Rest Bills Unscrubbed-Materials].Rest_Bill_ID)=@Bill_ID) AND
(([RA - Rest Bills Unscrubbed-Materials].Job_ID)=@Job_ID) AND
(([RA - Rest Bills Unscrubbed-Materials].Rest_Co_ID)=@Rest_Co_ID) AND
(([RA - Industry - Material Range plus Alias - Max Rate].Industry_Material_Name_Alias) Is Null));


END
GO
