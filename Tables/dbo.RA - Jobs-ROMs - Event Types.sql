SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Jobs-ROMs - Event Types] (
		[Job_Event_ID]           [int] IDENTITY(1, 1) NOT NULL,
		[Job_Event_Name]         [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Job_Event_Severity]     [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Jobs-ROMs - Event Types]
		PRIMARY KEY
		CLUSTERED
		([Job_Event_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Event Types] SET (LOCK_ESCALATION = TABLE)
GO
