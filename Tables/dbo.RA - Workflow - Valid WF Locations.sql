SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Workflow - Valid WF Locations] (
		[WF_Location_ID]                      [int] IDENTITY(1, 1) NOT NULL,
		[WF_Location_Name]                    [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[WF_Location_Description]             [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[WF_Location_State_Company_Actor]     [nchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Workflow - Valid WF Locations]
		PRIMARY KEY
		CLUSTERED
		([WF_Location_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Workflow - Valid WF Locations] SET (LOCK_ESCALATION = TABLE)
GO
