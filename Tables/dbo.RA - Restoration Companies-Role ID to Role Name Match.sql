SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Restoration Companies-Role ID to Role Name Match] (
		[Role_to_Name_Match_ID]         [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Co_ID]                    [int] NULL,
		[Role_Abbrev]                   [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Role_Name]                     [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Restoration_Labor_Role_ID]     [int] NULL,
		CONSTRAINT [PK_RA - Restoration Companies-Role ID to Role Name Match]
		PRIMARY KEY
		CLUSTERED
		([Role_to_Name_Match_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Restoration Companies-Role ID to Role Name Match]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Restoration Companies-Role ID to Role Name Match_RA - Restoration Companies-Roles]
	FOREIGN KEY ([Restoration_Labor_Role_ID]) REFERENCES [dbo].[RA - Restoration Companies-Roles] ([Restoration_Labor_Role_ID])
ALTER TABLE [dbo].[RA - Restoration Companies-Role ID to Role Name Match]
	CHECK CONSTRAINT [FK_RA - Restoration Companies-Role ID to Role Name Match_RA - Restoration Companies-Roles]

GO
ALTER TABLE [dbo].[RA - Restoration Companies-Role ID to Role Name Match] SET (LOCK_ESCALATION = TABLE)
GO
