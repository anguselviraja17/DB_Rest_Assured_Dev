SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE       VIEW [dbo].[RA - Industry - Equip Range plus Alias - Max Rate Pri Equip]
AS

SELECT dbo.[RA - Industry - Equipment Range plus Alias].Industry_Equip_Name,
MAX(Equipment_High_Rate_Day) AS MaxOfEquipment_High_Rate_Day, 
MIN(Equipment_High_Rate_Day) AS MinOfEquipment_High_Rate_Day, 
AVG(Equipment_High_Rate_Day) AS AVGOfEquipment_High_Rate_Day, 
COUNT(Equipment_High_Rate_Day) AS NumOfEquipment_High_Rate_Day, 
((MAX(Equipment_High_Rate_Day) - AVG(Equipment_High_Rate_Day)) / 2) + AVG(Equipment_High_Rate_Day) AS Quart3OfEquipment_High_Rate_Day,
IIF(((MAX(Equipment_High_Rate_Day) - AVG(Equipment_High_Rate_Day)) / 2) + AVG(Equipment_High_Rate_Day) = MAX(Equipment_High_Rate_Day), 0, 
MAX(Equipment_High_Rate_Day) - (((MAX(Equipment_High_Rate_Day) - AVG(Equipment_High_Rate_Day)) / 2) + AVG(Equipment_High_Rate_Day))) AS MaxQuatDiff
FROM   dbo.[RA - Industry - Equipment Range plus Alias]
GROUP BY dbo.[RA - Industry - Equipment Range plus Alias].Industry_Equip_Name

GO
