SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[RA - Industry - Role Range plus Alias - Max Rate]
AS
SELECT        dbo.[RA - Industry - Role Range plus Alias].Industry_Role_Name_Alias, dbo.[RA - Industry - Role Range plus Alias].Industry_Role_Name_Alias_Role_ID, 
                         dbo.[RA - Industry - Role Range plus Alias - Max Rate Pri Role].Industry_Role_Name, dbo.[RA - Industry - Role Range plus Alias - Max Rate Pri Role].MaxOfRole_High_Rate, 
                         dbo.[RA - Industry - Role Range plus Alias - Max Rate Pri Role].MinOfRole_High_Rate, dbo.[RA - Industry - Role Range plus Alias - Max Rate Pri Role].AVGOfRole_High_Rate, 
                         dbo.[RA - Industry - Role Range plus Alias - Max Rate Pri Role].NumOfRole_High_Rate, dbo.[RA - Industry - Role Range plus Alias - Max Rate Pri Role].Quart3OfRole_High_Rate_Day, 
                         dbo.[RA - Industry - Role Range plus Alias - Max Rate Pri Role].MaxQuatDiffRole_High_Rate, dbo.[RA - Industry - Role Range plus Alias].Industry_Role_Man_Staff_Ind
FROM            dbo.[RA - Industry - Role Range plus Alias - Max Rate Pri Role] INNER JOIN
                         dbo.[RA - Industry - Role Range plus Alias] ON dbo.[RA - Industry - Role Range plus Alias - Max Rate Pri Role].Industry_Role_Name = dbo.[RA - Industry - Role Range plus Alias].Industry_Role_Name
GROUP BY dbo.[RA - Industry - Role Range plus Alias].Industry_Role_Name_Alias, dbo.[RA - Industry - Role Range plus Alias].Industry_Role_Name_Alias_Role_ID, 
                         dbo.[RA - Industry - Role Range plus Alias - Max Rate Pri Role].Industry_Role_Name, dbo.[RA - Industry - Role Range plus Alias - Max Rate Pri Role].MaxOfRole_High_Rate, 
                         dbo.[RA - Industry - Role Range plus Alias - Max Rate Pri Role].MinOfRole_High_Rate, dbo.[RA - Industry - Role Range plus Alias - Max Rate Pri Role].AVGOfRole_High_Rate, 
                         dbo.[RA - Industry - Role Range plus Alias - Max Rate Pri Role].NumOfRole_High_Rate, dbo.[RA - Industry - Role Range plus Alias - Max Rate Pri Role].Quart3OfRole_High_Rate_Day, 
                         dbo.[RA - Industry - Role Range plus Alias - Max Rate Pri Role].MaxQuatDiffRole_High_Rate, dbo.[RA - Industry - Role Range plus Alias].Industry_Role_Man_Staff_Ind
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[1] 2[25] 3) )"
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
         Begin Table = "RA - Industry - Role Range plus Alias - Max Rate Pri Role"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 445
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RA - Industry - Role Range plus Alias"
            Begin Extent = 
               Top = 147
               Left = 678
               Bottom = 277
               Right = 1102
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 3165
         Width = 2520
         Width = 990
         Width = 990
         Width = 990
         Width = 990
         Width = 990
         Width = 990
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 2535
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
', 'SCHEMA', N'dbo', 'VIEW', N'RA - Industry - Role Range plus Alias - Max Rate', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', 1, 'SCHEMA', N'dbo', 'VIEW', N'RA - Industry - Role Range plus Alias - Max Rate', NULL, NULL
GO
