SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Workflow - Valid WF Statuses] (
		[Status_ID]                [int] IDENTITY(1, 1) NOT NULL,
		[Status_Name]              [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Status_Description]       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Status_Company_Actor]     [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Workflow - Valid WF Statuses]
		PRIMARY KEY
		CLUSTERED
		([Status_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Workflow - Valid WF Statuses] SET (LOCK_ESCALATION = TABLE)
GO
