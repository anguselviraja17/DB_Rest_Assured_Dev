SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Industry - Material Aliases] (
		[Industry_Material_Alias_ID]                   [int] IDENTITY(1, 1) NOT NULL,
		[Industry_Material_ID]                         [int] NULL,
		[Industry_Material_Name]                       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Material_Abbrev]                     [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Material_Name_Alias]                 [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Material_Abbrev_Alias]               [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Material_Name_Alias_Material_ID]     [int] NULL,
		[Industry_Material_Match_Status]               [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Material_Comments]                   [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Industry - Material Aliases]
		PRIMARY KEY
		CLUSTERED
		([Industry_Material_Alias_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Industry - Material Aliases]
	WITH CHECK
	ADD CONSTRAINT [FK_RA - Industry - Material Aliases_RA - Industry - Material Rate Ranges]
	FOREIGN KEY ([Industry_Material_ID]) REFERENCES [dbo].[RA - Industry - Material Rate Ranges] ([Industry_Material_ID])
ALTER TABLE [dbo].[RA - Industry - Material Aliases]
	CHECK CONSTRAINT [FK_RA - Industry - Material Aliases_RA - Industry - Material Rate Ranges]

GO
ALTER TABLE [dbo].[RA - Industry - Material Aliases]
	WITH CHECK
	ADD CONSTRAINT [FK_RA - Industry - Material Aliases_RA - Industry - Material Rate Ranges1]
	FOREIGN KEY ([Industry_Material_Name_Alias_Material_ID]) REFERENCES [dbo].[RA - Industry - Material Rate Ranges] ([Industry_Material_ID])
ALTER TABLE [dbo].[RA - Industry - Material Aliases]
	CHECK CONSTRAINT [FK_RA - Industry - Material Aliases_RA - Industry - Material Rate Ranges1]

GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220504-173029]
	ON [dbo].[RA - Industry - Material Aliases] ([Industry_Material_Name])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220504-173043]
	ON [dbo].[RA - Industry - Material Aliases] ([Industry_Material_Name_Alias])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Industry - Material Aliases] SET (LOCK_ESCALATION = TABLE)
GO
