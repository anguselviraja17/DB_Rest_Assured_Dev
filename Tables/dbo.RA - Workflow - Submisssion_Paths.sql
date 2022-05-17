SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Workflow - Submisssion_Paths] (
		[Submission_Path_ID]      [int] IDENTITY(1, 1) NOT NULL,
		[Current_Location_ID]     [int] NULL,
		[Current_State_ID]        [int] NULL,
		[Current_Status_ID]       [int] NULL,
		[Action_Type]             [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Next_Location_ID]        [int] NULL,
		[Next_State_ID]           [int] NULL,
		[Next_Status_ID]          [int] NULL,
		[BE_Approval_Rights]      [int] NULL,
		CONSTRAINT [PK_WF_Submisssion_Paths]
		PRIMARY KEY
		CLUSTERED
		([Submission_Path_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Workflow - Submisssion_Paths]
	ADD
	CONSTRAINT [DF_RA - Workflow - Submisssion_Paths_BE_Approval_Rights]
	DEFAULT ((0)) FOR [BE_Approval_Rights]
GO
ALTER TABLE [dbo].[RA - Workflow - Submisssion_Paths]
	WITH NOCHECK
	ADD CONSTRAINT [FK_WF_Submisssion_Paths_RA - Workflow - Valid WF Locations]
	FOREIGN KEY ([Current_Location_ID]) REFERENCES [dbo].[RA - Workflow - Valid WF Locations] ([WF_Location_ID])
ALTER TABLE [dbo].[RA - Workflow - Submisssion_Paths]
	CHECK CONSTRAINT [FK_WF_Submisssion_Paths_RA - Workflow - Valid WF Locations]

GO
ALTER TABLE [dbo].[RA - Workflow - Submisssion_Paths]
	WITH NOCHECK
	ADD CONSTRAINT [FK_WF_Submisssion_Paths_RA - Workflow - Valid WF Locations1]
	FOREIGN KEY ([Next_Location_ID]) REFERENCES [dbo].[RA - Workflow - Valid WF Locations] ([WF_Location_ID])
ALTER TABLE [dbo].[RA - Workflow - Submisssion_Paths]
	CHECK CONSTRAINT [FK_WF_Submisssion_Paths_RA - Workflow - Valid WF Locations1]

GO
ALTER TABLE [dbo].[RA - Workflow - Submisssion_Paths]
	WITH NOCHECK
	ADD CONSTRAINT [FK_WF_Submisssion_Paths_RA - Workflow - Valid WF Statuses]
	FOREIGN KEY ([Current_Status_ID]) REFERENCES [dbo].[RA - Workflow - Valid WF Statuses] ([Status_ID])
ALTER TABLE [dbo].[RA - Workflow - Submisssion_Paths]
	CHECK CONSTRAINT [FK_WF_Submisssion_Paths_RA - Workflow - Valid WF Statuses]

GO
ALTER TABLE [dbo].[RA - Workflow - Submisssion_Paths]
	WITH NOCHECK
	ADD CONSTRAINT [FK_WF_Submisssion_Paths_RA - Workflow - Valid WF Statuses1]
	FOREIGN KEY ([Next_Status_ID]) REFERENCES [dbo].[RA - Workflow - Valid WF Statuses] ([Status_ID])
ALTER TABLE [dbo].[RA - Workflow - Submisssion_Paths]
	CHECK CONSTRAINT [FK_WF_Submisssion_Paths_RA - Workflow - Valid WF Statuses1]

GO
ALTER TABLE [dbo].[RA - Workflow - Submisssion_Paths]
	WITH NOCHECK
	ADD CONSTRAINT [FK_WF_Submisssion_Paths_RA - Workflow - Valid WF States1]
	FOREIGN KEY ([Next_State_ID]) REFERENCES [dbo].[RA - Workflow - Valid WF States] ([State_ID])
ALTER TABLE [dbo].[RA - Workflow - Submisssion_Paths]
	CHECK CONSTRAINT [FK_WF_Submisssion_Paths_RA - Workflow - Valid WF States1]

GO
ALTER TABLE [dbo].[RA - Workflow - Submisssion_Paths]
	WITH NOCHECK
	ADD CONSTRAINT [FK_WF_Submisssion_Paths_RA - Workflow - Valid WF States]
	FOREIGN KEY ([Current_State_ID]) REFERENCES [dbo].[RA - Workflow - Valid WF States] ([State_ID])
ALTER TABLE [dbo].[RA - Workflow - Submisssion_Paths]
	CHECK CONSTRAINT [FK_WF_Submisssion_Paths_RA - Workflow - Valid WF States]

GO
ALTER TABLE [dbo].[RA - Workflow - Submisssion_Paths] SET (LOCK_ESCALATION = TABLE)
GO
