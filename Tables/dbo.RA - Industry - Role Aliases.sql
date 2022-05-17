SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Industry - Role Aliases] (
		[Industry_Role_Alias_ID]               [int] IDENTITY(1, 1) NOT NULL,
		[Industry_Role_ID]                     [int] NULL,
		[Industry_Role_Name]                   [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Role_Abbrev]                 [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Role_Name_Alias]             [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Role_Abbrev_Alias]           [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Role_Name_Alias_Role_ID]     [int] NULL,
		[Industry_Role_Match_Status]           [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Role_Man_Staff_Ind]          [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Role_Desc]                   [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Industry - Role Aliases]
		PRIMARY KEY
		CLUSTERED
		([Industry_Role_Alias_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Industry - Role Aliases]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Industry - Role Aliases_RA - Industry - Role Aliases]
	FOREIGN KEY ([Industry_Role_Name_Alias_Role_ID]) REFERENCES [dbo].[RA - Industry - Role Rate Ranges] ([Industry_Role_ID])
ALTER TABLE [dbo].[RA - Industry - Role Aliases]
	CHECK CONSTRAINT [FK_RA - Industry - Role Aliases_RA - Industry - Role Aliases]

GO
ALTER TABLE [dbo].[RA - Industry - Role Aliases]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Industry - Role Aliases_RA - Industry - Role Rate Ranges]
	FOREIGN KEY ([Industry_Role_ID]) REFERENCES [dbo].[RA - Industry - Role Rate Ranges] ([Industry_Role_ID])
ALTER TABLE [dbo].[RA - Industry - Role Aliases]
	CHECK CONSTRAINT [FK_RA - Industry - Role Aliases_RA - Industry - Role Rate Ranges]

GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220504-172309]
	ON [dbo].[RA - Industry - Role Aliases] ([Industry_Role_Name])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220504-172333]
	ON [dbo].[RA - Industry - Role Aliases] ([Industry_Role_Name_Alias])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Industry - Role Aliases] SET (LOCK_ESCALATION = TABLE)
GO
