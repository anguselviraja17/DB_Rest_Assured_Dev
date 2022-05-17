SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE     VIEW [dbo].[RA - Industry - Equip Range plus Alias - Max Min Rate]
AS
--SELECT Industry_Equip_Name_Alias, MAX(Equipment_High_Rate_Day) AS MaxOfEquipment_High_Rate_Day, MIN(Equipment_High_Rate_Day) AS MinOfEquipment_High_Rate_Day, AVG(Equipment_High_Rate_Day) AS AVGOfEquipment_High_Rate_Day, COUNT(Equipment_High_Rate_Day) AS NumOfEquipment_High_Rate_Day
--FROM   dbo.[RA - Industry - Equipment Range plus Alias]
--GROUP BY Industry_Equip_Name_Alias

SELECT Industry_Equip_Name_Alias, 
MAX(Equipment_High_Rate_Day) AS MaxOfEquipment_High_Rate_Day, 
MIN(Equipment_High_Rate_Day) AS MinOfEquipment_High_Rate_Day, 
AVG(Equipment_High_Rate_Day) AS AVGOfEquipment_High_Rate_Day, 
COUNT(Equipment_High_Rate_Day) AS NumOfEquipment_High_Rate_Day, 
((MAX(Equipment_High_Rate_Day) - AVG(Equipment_High_Rate_Day)) / 2) + AVG(Equipment_High_Rate_Day) AS Quart3OfEquipment_High_Rate_Day,
IIF(((MAX(Equipment_High_Rate_Day) - AVG(Equipment_High_Rate_Day)) / 2) + AVG(Equipment_High_Rate_Day) = MAX(Equipment_High_Rate_Day), 0, 
MAX(Equipment_High_Rate_Day) - (((MAX(Equipment_High_Rate_Day) - AVG(Equipment_High_Rate_Day)) / 2) + AVG(Equipment_High_Rate_Day))) AS MaxQuatDiff
FROM   dbo.[RA - Industry - Equipment Range plus Alias]
GROUP BY Industry_Equip_Name_Alias


GO
