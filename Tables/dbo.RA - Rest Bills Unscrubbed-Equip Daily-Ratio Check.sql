SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check] (
		[Rest_Bill_Equip_Daily_Ratio_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Bill_ID]                       [int] NOT NULL,
		[Rest_Co_ID]                         [int] NULL,
		[Job_ID]                             [int] NULL,
		[Unit_Type]                          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Equipment_ID]                       [int] NULL,
		[Equipment_Name]                     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Unit_Cost]                          [money] NULL,
		[Total Days Used]                    [int] NULL,
		[SumOfQuantity]                      [float] NULL,
		[SumOfTotal_Cost]                    [money] NULL,
		[CalcWeeklyCost]                     [money] NULL,
		[CalcWeeklySavings]                  [money] NULL,
		[CalcMonthlyCost]                    [money] NULL,
		[CalcMonthlySavings]                 [money] NULL,
		[LargestSavings]                     [money] NULL,
		[Days_in_use_unique]                 [float] NULL,
		CONSTRAINT [PK_RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check]
		PRIMARY KEY
		CLUSTERED
		([Rest_Bill_Equip_Daily_Ratio_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Equip Daily-Ratio Check] SET (LOCK_ESCALATION = TABLE)
GO
