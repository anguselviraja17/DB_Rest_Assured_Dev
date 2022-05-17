SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO






CREATE         VIEW [dbo].[RA - Industry - Role Range plus Alias - Max Rate Pri Role]
AS
SELECT        [RA - Industry - Role Range plus Alias].Industry_Role_Name, 
MAX(Role_High_Rate) AS MaxOfRole_High_Rate,
MIN(Role_High_Rate) AS MinOfRole_High_Rate,
AVG(Role_High_Rate) AS AVGOfRole_High_Rate,
COUNT(Role_High_Rate)  AS NumOfRole_High_Rate,
((MAX(Role_High_Rate) - AVG(Role_High_Rate)) / 2) + AVG(Role_High_Rate) AS Quart3OfRole_High_Rate_Day,
IIF(((MAX(Role_High_Rate) - AVG(Role_High_Rate)) / 2) + AVG(Role_High_Rate)   = MAX(Role_High_Rate), 0, MAX(Role_High_Rate) - (((MAX(Role_High_Rate) - AVG(Role_High_Rate)) / 2) + AVG(Role_High_Rate))) AS MaxQuatDiffRole_High_Rate
FROM            dbo.[RA - Industry - Role Range plus Alias]
WHERE        ([RA - Industry - Role Range plus Alias].Industry_Role_Name IS NOT NULL)
GROUP BY [RA - Industry - Role Range plus Alias].Industry_Role_Name
GO
