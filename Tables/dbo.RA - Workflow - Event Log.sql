SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Workflow - Event Log] (
		[Workflow_Log_ID]                [int] IDENTITY(1, 1) NOT NULL,
		[Submission_ID]                  [int] NULL,
		[Submission_Sequence_Number]     [int] NULL,
		[Current_State]                  [int] NULL,
		[Current_Status]                 [int] NULL,
		[Current_Location]               [int] NULL,
		[Action_Taken]                   [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[User_ID]                        [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Bill_ID]                        [int] NULL,
		[Job_ID]                         [int] NULL,
		[Rest_Co]                        [int] NULL,
		[IA_Co]                          [int] NULL,
		[IC_Co]                          [int] NULL,
		[New_State]                      [int] NULL,
		[New_Status]                     [int] NULL,
		[New_Location]                   [int] NULL,
		[Log_Date_Time]                  [datetime] NULL,
		[Client_ID]                      [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Workflow - Event Log]
		PRIMARY KEY
		CLUSTERED
		([Workflow_Log_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Workflow - Event Log] SET (LOCK_ESCALATION = TABLE)
GO
