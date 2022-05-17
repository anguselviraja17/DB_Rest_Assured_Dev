SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Rest Bills - Role Mapping] (
		[Bill_Role_ID]                  [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Bill_ID]                  [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Contract_ID]                   [int] NULL,
		[Rest_Co_ID]                    [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_Name]                  [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Role_Name]                     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Role_Abbreviation]             [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Restoration_Labor_Role_ID]     [int] NULL,
		[Contract_Labor_Role_ID]        [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Rest Bills - Role Mapping] SET (LOCK_ESCALATION = TABLE)
GO
