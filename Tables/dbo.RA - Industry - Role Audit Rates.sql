SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Industry - Role Audit Rates] (
		[Industry_Role_Audit_ID]               [int] IDENTITY(1, 1) NOT NULL,
		[Industry_Role_Audit_Version]          [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Role_Name_Alias]             [nchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Role_Name_Alias_Role_ID]     [int] NULL,
		[Industry_Role_Name]                   [nchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[MaxOfRole_High_Rate]                  [money] NULL,
		[MinOfRole_High_Rate]                  [money] NULL,
		[AVGOfRole_High_Rate]                  [money] NULL,
		[NumOfRole_High_Rate]                  [money] NULL,
		[Quart3OfRole_High_Rate_Day]           [money] NULL,
		[MaxQuatDiffRole_High_Rate]            [money] NULL,
		CONSTRAINT [PK_RA - Industry - Role Audit Rates]
		PRIMARY KEY
		CLUSTERED
		([Industry_Role_Audit_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Industry - Role Audit Rates] SET (LOCK_ESCALATION = TABLE)
GO
