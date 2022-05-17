SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[RA - Industry - Material Range plus Alias - Max Min Rate]
AS
SELECT 
Industry_Material_Name_Alias,
MAX(Material_High_Rate) AS MaxOfMaterial_High_Rate, 
MIN(Material_High_Rate) AS MinOfMaterial_High_Rate, 
AVG(Material_High_Rate) AS AVGOfMaterial_High_Rate, 
COUNT(Material_High_Rate) AS NumOfMaterial_High_Rate, 
((MAX(Material_High_Rate) - AVG(Material_High_Rate)) / 2) + AVG(Material_High_Rate) AS Quart3OfMaterial_High_Rate,
IIF(((MAX(Material_High_Rate) - AVG(Material_High_Rate)) / 2) + AVG(Material_High_Rate) = MAX(Material_High_Rate), 0, 
MAX(Material_High_Rate) - (((MAX(Material_High_Rate) - AVG(Material_High_Rate)) / 2) + AVG(Material_High_Rate))) AS MaxQuatDiffMaterial_High_Rate
FROM   dbo.[RA - Industry - Material Range plus Alias]
GROUP BY Industry_Material_Name_Alias

GO
