SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Workflow - Bill Submission State] (
		[Submission_ID]                         [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Co_ID]                            [int] NULL,
		[Job_ID]                                [int] NULL,
		[Bill_ID]                               [int] NULL,
		[Submission_Sequence_Number]            [int] NULL,
		[Submission_Current_State]              [int] NULL,
		[Submission_Current_Status]             [int] NULL,
		[Submission_Current_Location]           [int] NULL,
		[Submission_Last_State_Change_Date]     [date] NULL,
		[Last_Update_User]                      [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IA_Co]                                 [int] NULL,
		[Insurance_Co]                          [int] NULL,
		[Submission_Audit_Report_URL]           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Workflow - Bill Submission State]
		PRIMARY KEY
		CLUSTERED
		([Submission_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Workflow - Bill Submission State]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Workflow - Bill Submission State_RA - Workflow - Valid WF Locations]
	FOREIGN KEY ([Submission_Current_Location]) REFERENCES [dbo].[RA - Workflow - Valid WF Locations] ([WF_Location_ID])
ALTER TABLE [dbo].[RA - Workflow - Bill Submission State]
	CHECK CONSTRAINT [FK_RA - Workflow - Bill Submission State_RA - Workflow - Valid WF Locations]

GO
ALTER TABLE [dbo].[RA - Workflow - Bill Submission State]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Workflow - Bill Submission State_RA - Workflow - Valid WF States]
	FOREIGN KEY ([Submission_Current_State]) REFERENCES [dbo].[RA - Workflow - Valid WF States] ([State_ID])
ALTER TABLE [dbo].[RA - Workflow - Bill Submission State]
	CHECK CONSTRAINT [FK_RA - Workflow - Bill Submission State_RA - Workflow - Valid WF States]

GO
ALTER TABLE [dbo].[RA - Workflow - Bill Submission State]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Workflow - Bill Submission State_RA - Workflow - Valid WF Statuses]
	FOREIGN KEY ([Submission_Current_Status]) REFERENCES [dbo].[RA - Workflow - Valid WF Statuses] ([Status_ID])
ALTER TABLE [dbo].[RA - Workflow - Bill Submission State]
	CHECK CONSTRAINT [FK_RA - Workflow - Bill Submission State_RA - Workflow - Valid WF Statuses]

GO
ALTER TABLE [dbo].[RA - Workflow - Bill Submission State] SET (LOCK_ESCALATION = TABLE)
GO
