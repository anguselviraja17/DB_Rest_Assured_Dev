SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Contracts-Roles] (
		[Role_ID]               [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Co_ID]            [int] NULL,
		[Contract_ID]           [int] NULL,
		[Role_Name]             [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Role_Abbreviation]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Role_Rate]             [money] NULL,
		[Rule_Source_Type]      [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Contracts-Roles]
		PRIMARY KEY
		CLUSTERED
		([Role_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Contracts-Roles] SET (LOCK_ESCALATION = TABLE)
GO
