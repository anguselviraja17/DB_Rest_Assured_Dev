SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Workflow - Valid WF States] (
		[State_ID]                [int] NOT NULL,
		[State_Name]              [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[State_Description]       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[State_Company_Actor]     [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Workflow - Valid WF States]
		PRIMARY KEY
		CLUSTERED
		([State_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Workflow - Valid WF States] SET (LOCK_ESCALATION = TABLE)
GO
