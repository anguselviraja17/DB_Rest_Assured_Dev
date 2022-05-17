SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author, Anthony Troy>
-- Create date: <Create Date,3/27/2022>
-- Description:	<Loads and Roles, Equipment or Materials that do not yet exist in the ALias tables>
-- Parameter:   <Rates to Run..[1] Labor, [2] Equip, [3] Materials
-- =============================================
CREATE   PROCEDURE [dbo].[IndustryLoadAliasfromRanges]
    @RatestoRun integer
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

IF @RatestoRun = 1 or @RatestoRun =4
Begin
    -- Insert Roles from Role Range to Alias
	-- [AT] 4-19-22 - Cut Names to 100 charachters.

INSERT INTO [RA - Industry - Role Aliases] (
Industry_Role_Name,
Industry_Role_Abbrev,
Industry_Role_Match_Status,
Industry_Role_Name_Alias,
Industry_Role_Abbrev_Alias )
SELECT 
[RA - Industry - Role Rate Ranges].Role_Name,
[RA - Industry - Role Rate Ranges].Role_Abbrev,
'N' AS Expr1,
[RA - Industry - Role Rate Ranges].Role_Name,
[RA - Industry - Role Rate Ranges].Role_Abbrev
FROM [RA - Industry - Role Rate Ranges] LEFT JOIN [RA - Industry - Role Aliases] ON
[RA - Industry - Role Rate Ranges].Role_Name = [RA - Industry - Role Aliases].Industry_Role_Name_Alias
GROUP BY 
[RA - Industry - Role Rate Ranges].Role_Name,
[RA - Industry - Role Rate Ranges].Role_Abbrev,
[RA - Industry - Role Aliases].Industry_Role_Name_Alias,
[RA - Industry - Role Rate Ranges].Role_Name,
[RA - Industry - Role Rate Ranges].Role_Abbrev
HAVING (((
[RA - Industry - Role Aliases].Industry_Role_Name_Alias) Is Null) AND
(([RA - Industry - Role Rate Ranges].Role_Name) Is Not Null));

END

-- Load Equipment Alias from Equip rate Ranges

IF @RatestoRun = 2 or @RatestoRun = 4
Begin

INSERT INTO [RA - Industry - Equipment Aliases]
( Industry_Equip_Name_Alias,
Industry_Equip_Name_Alias_Equip_ID,
Industry_Equip_Name,
Industry_Equip_ID,
Industry_Equip_Match_Status )
SELECT 
LEFT([RA - Industry - Equipment Rate Ranges].Equipment_Name, 100),
Min([RA - Industry - Equipment Rate Ranges].Industry_Equipment_ID) AS MinOfIndustry_Equipment_ID,
LEFT([RA - Industry - Equipment Rate Ranges].Equipment_Name, 100),
Min([RA - Industry - Equipment Rate Ranges].Industry_Equipment_ID) AS MinOfIndustry_Equipment_ID1,
'N' AS Expr2
FROM [RA - Industry - Equipment Rate Ranges] LEFT JOIN [RA - Industry - Equipment Aliases] ON
[RA - Industry - Equipment Rate Ranges].Equipment_Name = [RA - Industry - Equipment Aliases].Industry_Equip_Name_Alias
GROUP BY 
[RA - Industry - Equipment Rate Ranges].Equipment_Name,
[RA - Industry - Equipment Aliases].Industry_Equip_Name,
[RA - Industry - Equipment Rate Ranges].Equipment_Name
HAVING (((
[RA - Industry - Equipment Aliases].Industry_Equip_Name) Is Null));
END


-- Load Materials from Rate Range to Alias

IF @RatestoRun = 3 or @RatestoRun =4
Begin

INSERT INTO [RA - Industry - Material Aliases]
( Industry_Material_Name,
Industry_Material_Abbrev,
Industry_Material_ID,
Industry_Material_Match_Status,
Industry_Material_Name_Alias,
Industry_Material_Abbrev_Alias )
SELECT 
[RA - Industry - Material Rate Ranges].Material_Name,
[RA - Industry - Material Rate Ranges].Material_Abbrev,
Min([RA - Industry - Material Rate Ranges].Industry_Material_ID) AS MinOfIndustry_Material_ID,
'N' AS Expr1,
[RA - Industry - Material Rate Ranges].Material_Name,
[RA - Industry - Material Rate Ranges].Material_Abbrev
FROM [RA - Industry - Material Rate Ranges] LEFT JOIN
[RA - Industry - Material Aliases] ON
[RA - Industry - Material Rate Ranges].Material_Name = [RA - Industry - Material Aliases].Industry_Material_Name_Alias
GROUP BY 
[RA - Industry - Material Rate Ranges].Material_Name,
[RA - Industry - Material Rate Ranges].Material_Abbrev,
[RA - Industry - Material Aliases].Industry_Material_Name_Alias,
[RA - Industry - Material Rate Ranges].Material_Name,
[RA - Industry - Material Rate Ranges].Material_Abbrev
HAVING ((([RA - Industry - Material Aliases].Industry_Material_Name_Alias) Is Null));

END

END

GO
