SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Industry - Equipment Aliases] (
		[Industry_Equip_Alias_ID]                [int] IDENTITY(1, 1) NOT NULL,
		[Industry_Equip_ID]                      [int] NULL,
		[Industry_Equip_Name]                    [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Equip_Abbrev]                  [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Equip_Name_Alias]              [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Equip_Abbrev_Alias]            [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Equip_Name_Alias_Equip_ID]     [int] NULL,
		[Industry_Equip_Match_Status]            [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Equipment_Comments]            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Industry - Equipment Aliases]
		PRIMARY KEY
		CLUSTERED
		([Industry_Equip_Alias_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Industry - Equipment Aliases]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Industry - Equipment Aliases_RA - Industry - Equipment Rate Ranges]
	FOREIGN KEY ([Industry_Equip_ID]) REFERENCES [dbo].[RA - Industry - Equipment Rate Ranges] ([Industry_Equipment_ID])
ALTER TABLE [dbo].[RA - Industry - Equipment Aliases]
	CHECK CONSTRAINT [FK_RA - Industry - Equipment Aliases_RA - Industry - Equipment Rate Ranges]

GO
ALTER TABLE [dbo].[RA - Industry - Equipment Aliases]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Industry - Equipment Aliases_RA - Industry - Equipment Rate Ranges1]
	FOREIGN KEY ([Industry_Equip_Name_Alias_Equip_ID]) REFERENCES [dbo].[RA - Industry - Equipment Rate Ranges] ([Industry_Equipment_ID])
ALTER TABLE [dbo].[RA - Industry - Equipment Aliases]
	CHECK CONSTRAINT [FK_RA - Industry - Equipment Aliases_RA - Industry - Equipment Rate Ranges1]

GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220504-172932]
	ON [dbo].[RA - Industry - Equipment Aliases] ([Industry_Equip_Name])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220504-172957]
	ON [dbo].[RA - Industry - Equipment Aliases] ([Industry_Equip_Name_Alias])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Industry - Equipment Aliases] SET (LOCK_ESCALATION = TABLE)
GO
