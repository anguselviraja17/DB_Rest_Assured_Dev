SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE     VIEW [dbo].[RA - Industry - Equip Range plus Alias - Max Rate]
AS

SELECT
[RA - Industry - Equipment Range plus Alias].Industry_Equip_Name_Alias,
[RA - Industry - Equipment Range plus Alias].Industry_Equip_ID,
[RA - Industry - Equip Range plus Alias - Max Rate Pri Equip].Industry_Equip_Name, 
[RA - Industry - Equip Range plus Alias - Max Rate Pri Equip].MaxOfEquipment_High_Rate_Day,
[RA - Industry - Equip Range plus Alias - Max Rate Pri Equip].MinOfEquipment_High_Rate_Day, 
[RA - Industry - Equip Range plus Alias - Max Rate Pri Equip].AVGOfEquipment_High_Rate_Day,
[RA - Industry - Equip Range plus Alias - Max Rate Pri Equip].NumOfEquipment_High_Rate_Day, 
[RA - Industry - Equip Range plus Alias - Max Rate Pri Equip].Quart3OfEquipment_High_Rate_Day,
[RA - Industry - Equip Range plus Alias - Max Rate Pri Equip].MaxQuatDiff
FROM dbo.[RA - Industry - Equip Range plus Alias - Max Rate Pri Equip] INNER JOIN
     [RA - Industry - Equipment Range plus Alias] ON
	 [RA - Industry - Equip Range plus Alias - Max Rate Pri Equip].Industry_Equip_Name = [RA - Industry - Equipment Range plus Alias].Industry_Equip_Name
GROUP BY
[RA - Industry - Equipment Range plus Alias].Industry_Equip_Name_Alias,
[RA - Industry - Equipment Range plus Alias].Industry_Equip_ID,
[RA - Industry - Equip Range plus Alias - Max Rate Pri Equip].Industry_Equip_Name, 
[RA - Industry - Equip Range plus Alias - Max Rate Pri Equip].MaxOfEquipment_High_Rate_Day,
[RA - Industry - Equip Range plus Alias - Max Rate Pri Equip].MinOfEquipment_High_Rate_Day, 
[RA - Industry - Equip Range plus Alias - Max Rate Pri Equip].AVGOfEquipment_High_Rate_Day,
[RA - Industry - Equip Range plus Alias - Max Rate Pri Equip].NumOfEquipment_High_Rate_Day, 
[RA - Industry - Equip Range plus Alias - Max Rate Pri Equip].Quart3OfEquipment_High_Rate_Day,
[RA - Industry - Equip Range plus Alias - Max Rate Pri Equip].MaxQuatDiff

--SELECT Industry_Equip_Name_Alias, MAX(Equipment_High_Rate_Day) AS MaxOfEquipment_High_Rate_Day
--FROM   dbo.[RA - Industry - Equipment Range plus Alias]
--GROUP BY Industry_Equip_Name_Alias
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "RA - Industry - Equipment Range plus Alias"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 410
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'RA - Industry - Equip Range plus Alias - Max Rate', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', 1, 'SCHEMA', N'dbo', 'VIEW', N'RA - Industry - Equip Range plus Alias - Max Rate', NULL, NULL
GO
