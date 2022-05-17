SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Industry - Equip Audit Rates] (
		[Industry_Equip_Audit_ID]          [int] IDENTITY(1, 1) NOT NULL,
		[Industry_Equip_Audit_Version]     [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Equip_Name_Alias]        [nchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Equip_ID]                [int] NULL,
		[Industry_Equip_Name]              [nchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[MaxOfEquip_High_Rate]             [money] NULL,
		[MinOfEquip_High_Rate]             [money] NULL,
		[AVGOfEquip_High_Rate]             [money] NULL,
		[NumOfEquip_High_Rate]             [money] NULL,
		[Quart3OfEquip_High_Rate_Day]      [money] NULL,
		[MaxQuatDiff]                      [money] NULL,
		CONSTRAINT [PK_RA - Industry - Equip Audit Rates]
		PRIMARY KEY
		CLUSTERED
		([Industry_Equip_Audit_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Industry - Equip Audit Rates] SET (LOCK_ESCALATION = TABLE)
GO
