SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[IndustryLoadfromBill]
    @Bill_ID integer,
	@Job_ID integer,
	@Rest_Co_ID integer,
	@RatestoRun integer
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

IF @RatestoRun = 1 or @RatestoRun =4
Begin
    -- Insert Roles from Bill to Industry Role Table
INSERT INTO [RA - Industry - Role Rate Ranges] 
( Rule_Source_Bill_ID, Rule_Source_Job_ID, Rule_Source_Rest_Co, Role_Name, Role_Abbrev, Role_High_Rate, Geo_State_Prov, Geo_Zip, Rule_Source_Type, Date_Added, Geo_Scope, Geo_Country )
SELECT 
[RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Bill_ID,
[RA - Rest Bills Unscrubbed-Labor-Cost].Job_ID,
[RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Co,
[RA - Rest Bills Unscrubbed-Labor-Cost].Role_Name,
LEFT([RA - Rest Bills Unscrubbed-Labor-Cost].Role_Abbreviation, 10),
[RA - Rest Bills Unscrubbed-Labor-Cost].Role_Hourly_Rate,
[RA - Jobs-ROMs - Building].Building_State,
[RA - Jobs-ROMs - Building].Building_Zip,
3 AS Expr2,
GETDATE() AS Expr3,
5 AS Expr4,
1 AS Expr5
FROM 
([RA - Jobs-ROMs] LEFT JOIN
[RA - Jobs-ROMs - Building] ON [RA - Jobs-ROMs].Job_ID = [RA - Jobs-ROMs - Building].Job_ID) RIGHT JOIN
[RA - Rest Bills Unscrubbed-Labor-Cost] ON [RA - Jobs-ROMs].Job_ID = [RA - Rest Bills Unscrubbed-Labor-Cost].Job_ID
GROUP BY 
[RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Bill_ID,
[RA - Rest Bills Unscrubbed-Labor-Cost].Job_ID,
[RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Co,
[RA - Rest Bills Unscrubbed-Labor-Cost].Role_Name,
[RA - Rest Bills Unscrubbed-Labor-Cost].Role_Abbreviation,
[RA - Rest Bills Unscrubbed-Labor-Cost].Role_Hourly_Rate,
[RA - Jobs-ROMs - Building].Building_State,
[RA - Jobs-ROMs - Building].Building_Zip,
[RA - Jobs-ROMs - Building].Building_City
HAVING 
((([RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Bill_ID)= @Bill_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Cost].Job_ID)=@Job_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Cost].Rest_Co)=@Rest_Co_ID) AND
(([RA - Rest Bills Unscrubbed-Labor-Cost].Role_Hourly_Rate) Is Not Null));
END

-- Load Equipment Rates
-- Added 'EP' to Daily check for AXA. Means Each Per day?

IF @RatestoRun = 2 or @RatestoRun = 4
Begin
INSERT INTO [RA - Industry - Equipment Rate Ranges] ( Rule_Source_Bill_ID, Rule_Source_Job_ID, Rule_Source_Rest_Co, Equipment_Name, Equipment_Unit_Type, Equipment_High_Rate_Day, Geo_State_Prov, Geo_Zip, Rule_Source_Type, Date_Added, Geo_Scope, Geo_Country )
SELECT [RA - Rest Bills Unscrubbed-Equipment].Rest_Bill_ID,
[RA - Rest Bills Unscrubbed-Equipment].Job_ID,
[RA - Rest Bills Unscrubbed-Equipment].Rest_Co_ID,
[RA - Rest Bills Unscrubbed-Equipment].Equipment_Name,
'DAY' AS Expr6,
[RA - Rest Bills Unscrubbed-Equipment].Unit_Cost,
[RA - Jobs-ROMs - Building].Building_State,
[RA - Jobs-ROMs - Building].Building_Zip,
3 AS Expr2,
GetDate() AS Expr3,
5 AS Expr4,
1 AS Expr5
FROM ([RA - Rest Bills Unscrubbed-Equipment] 
LEFT JOIN [RA - Jobs-ROMs] ON [RA - Rest Bills Unscrubbed-Equipment].Job_ID = [RA - Jobs-ROMs].Job_ID) 
LEFT JOIN [RA - Jobs-ROMs - Building] ON [RA - Jobs-ROMs].Job_ID = [RA - Jobs-ROMs - Building].Job_ID
GROUP BY 
[RA - Rest Bills Unscrubbed-Equipment].Rest_Bill_ID,
[RA - Rest Bills Unscrubbed-Equipment].Job_ID,
[RA - Rest Bills Unscrubbed-Equipment].Rest_Co_ID,
[RA - Rest Bills Unscrubbed-Equipment].Equipment_Name,
[RA - Rest Bills Unscrubbed-Equipment].Unit_Cost,
[RA - Jobs-ROMs - Building].Building_State,
[RA - Jobs-ROMs - Building].Building_Zip, 
UPPER([Unit_Type]),
[RA - Rest Bills Unscrubbed-Equipment].Equipment_ID,
[RA - Jobs-ROMs - Building].Building_City
HAVING (((
[RA - Rest Bills Unscrubbed-Equipment].Rest_Bill_ID)=@Bill_ID) AND
(([RA - Rest Bills Unscrubbed-Equipment].Job_ID)=@Job_ID) AND
(([RA - Rest Bills Unscrubbed-Equipment].Rest_Co_ID)=@Rest_Co_ID)
AND ((UPPER([Unit_Type]))<>'WEEK' AND (UPPER([Unit_Type]))<>'MONTH' AND (UPPER([Unit_Type])) <> 'WK%'))

--AND ((UPPER([Unit_Type]))='DAY' Or (UPPER([Unit_Type]))like'EA%' Or (UPPER([Unit_Type]))='EPD'));
END


-- Load Materials
IF @RatestoRun = 3 or @RatestoRun =4
Begin
INSERT INTO [RA - Industry - Material Rate Ranges] ( Rule_Source_Bill_ID, Rule_Source_Job_ID, Rule_Source_Rest_Co, Material_Name, Material_Unit_Type, Material_High_Rate, Geo_State_Prov, Geo_Zip, Rule_Source_Type, Date_Added )
SELECT 
[RA - Rest Bills Unscrubbed-Materials].Rest_Bill_ID,
[RA - Rest Bills Unscrubbed-Materials].Job_ID,
[RA - Rest Bills Unscrubbed-Materials].Rest_Co_ID,
[RA - Rest Bills Unscrubbed-Materials].Material_Name,
UPPER([Unit_Type]) AS Expr1,
[RA - Rest Bills Unscrubbed-Materials].Unit_Cost,
[RA - Jobs-ROMs - Building].Building_State,
[RA - Jobs-ROMs - Building].Building_Zip,
3 AS Expr2,
GetDate() AS Expr3
FROM ([RA - Jobs-ROMs] LEFT JOIN
[RA - Jobs-ROMs - Building] ON [RA - Jobs-ROMs].Job_ID = [RA - Jobs-ROMs - Building].Job_ID) LEFT JOIN
[RA - Rest Bills Unscrubbed-Materials] ON [RA - Jobs-ROMs].Job_ID = [RA - Rest Bills Unscrubbed-Materials].Job_ID
GROUP BY 
[RA - Rest Bills Unscrubbed-Materials].Rest_Bill_ID,
[RA - Rest Bills Unscrubbed-Materials].Job_ID,
[RA - Rest Bills Unscrubbed-Materials].Rest_Co_ID,
[RA - Rest Bills Unscrubbed-Materials].Material_Name,
UPPER([Unit_Type]),
[RA - Rest Bills Unscrubbed-Materials].Unit_Cost,
[RA - Jobs-ROMs - Building].Building_State,
[RA - Jobs-ROMs - Building].Building_Zip 
HAVING (((
[RA - Rest Bills Unscrubbed-Materials].Rest_Bill_ID)=@Bill_ID) AND
(([RA - Rest Bills Unscrubbed-Materials].Job_ID)=@Job_ID) AND
(([RA - Rest Bills Unscrubbed-Materials].Rest_Co_ID)=@Rest_Co_ID));
END
END
GO
