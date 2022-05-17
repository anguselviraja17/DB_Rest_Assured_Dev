SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Restoration Companies-Roles] (
		[Restoration_Labor_Role_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Co_ID]                    [int] NULL,
		[Role_Name]                     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Role_Abbreviation]             [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Role_Rate]                     [money] NULL,
		[Version]                       [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Load_Date]                     [datetime] NULL,
		CONSTRAINT [PK_RA - Restoration Companies-Roles]
		PRIMARY KEY
		CLUSTERED
		([Restoration_Labor_Role_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Restoration Companies-Roles]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Restoration Companies-Roles_RA - Restoration Companies]
	FOREIGN KEY ([Rest_Co_ID]) REFERENCES [dbo].[RA - Restoration Companies] ([Rest_Co_ID])
ALTER TABLE [dbo].[RA - Restoration Companies-Roles]
	CHECK CONSTRAINT [FK_RA - Restoration Companies-Roles_RA - Restoration Companies]

GO
ALTER TABLE [dbo].[RA - Restoration Companies-Roles] SET (LOCK_ESCALATION = TABLE)
GO
