SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [dbo].[RA - Industry - Material Range plus Alias - Max Rate Pri Mat]
AS
SELECT dbo.[RA - Industry - Material Range plus Alias].Industry_Material_Name,
MAX(Material_High_Rate) AS MaxOfMaterial_High_Rate, 
MIN(Material_High_Rate) AS MinOfMaterial_High_Rate, 
AVG(Material_High_Rate) AS AVGOfMaterial_High_Rate, 
COUNT(Material_High_Rate) AS NumOfMaterial_High_Rate, 
((MAX(Material_High_Rate) - AVG(Material_High_Rate)) / 2) + AVG(Material_High_Rate) AS Quart3OfMaterial_High_Rate,
IIF(((MAX(Material_High_Rate) - AVG(Material_High_Rate)) / 2) + AVG(Material_High_Rate) = MAX(Material_High_Rate), 0, 
MAX(Material_High_Rate) - (((MAX(Material_High_Rate) - AVG(Material_High_Rate)) / 2) + AVG(Material_High_Rate))) AS MaxQuatDiff
FROM   dbo.[RA - Industry - Material Range plus Alias]
GROUP BY dbo.[RA - Industry - Material Range plus Alias].Industry_Material_Name
GO
