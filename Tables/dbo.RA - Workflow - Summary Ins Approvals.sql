SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Workflow - Summary Ins Approvals] (
		[Workflow_Summary_Ins_Approval_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Workflow_Summary_Approval_ID]         [int] NOT NULL,
		[Job_ID]                               [int] NULL,
		[Audit_Summary_ID]                     [int] NULL,
		[Insurance_Co_ID]                      [int] NULL,
		[Approval_Type]                        [int] NULL,
		[Approval_Notes]                       [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Approval_Date]                        [datetime] NULL,
		[IC_Approver_User_ID]                  [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Net_Adjusted_Bill_Amount]             [money] NULL,
		[Coverage_Pecent]                      [decimal](5, 2) NULL,
		[Approved_to_Pay]                      [money] NULL,
		CONSTRAINT [PK_RA - Workflow - Summary Ins Approvals]
		PRIMARY KEY
		CLUSTERED
		([Workflow_Summary_Ins_Approval_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Workflow - Summary Ins Approvals]
	WITH CHECK
	ADD CONSTRAINT [FK_RA - Workflow - Summary Ins Approvals_RA - Audit Results - State Types]
	FOREIGN KEY ([Approval_Type]) REFERENCES [dbo].[RA - Audit Results - State Types] ([Audit_Approval_State_Type_ID])
ALTER TABLE [dbo].[RA - Workflow - Summary Ins Approvals]
	CHECK CONSTRAINT [FK_RA - Workflow - Summary Ins Approvals_RA - Audit Results - State Types]

GO
ALTER TABLE [dbo].[RA - Workflow - Summary Ins Approvals]
	WITH CHECK
	ADD CONSTRAINT [FK_RA - Workflow - Summary Ins Approvals_RA - Audit Results - Summary]
	FOREIGN KEY ([Audit_Summary_ID]) REFERENCES [dbo].[RA - Audit Results - Summary] ([Audit_Summary_ID])
ALTER TABLE [dbo].[RA - Workflow - Summary Ins Approvals]
	CHECK CONSTRAINT [FK_RA - Workflow - Summary Ins Approvals_RA - Audit Results - Summary]

GO
ALTER TABLE [dbo].[RA - Workflow - Summary Ins Approvals]
	WITH CHECK
	ADD CONSTRAINT [FK_RA - Workflow - Summary Ins Approvals_RA - Insurance Companies]
	FOREIGN KEY ([Insurance_Co_ID]) REFERENCES [dbo].[RA - Insurance Companies] ([Insurance_Co_ID])
ALTER TABLE [dbo].[RA - Workflow - Summary Ins Approvals]
	CHECK CONSTRAINT [FK_RA - Workflow - Summary Ins Approvals_RA - Insurance Companies]

GO
ALTER TABLE [dbo].[RA - Workflow - Summary Ins Approvals]
	WITH CHECK
	ADD CONSTRAINT [FK_RA - Workflow - Summary Ins Approvals_RA - Jobs-ROMs]
	FOREIGN KEY ([Job_ID]) REFERENCES [dbo].[RA - Jobs-ROMs] ([Job_ID])
ALTER TABLE [dbo].[RA - Workflow - Summary Ins Approvals]
	CHECK CONSTRAINT [FK_RA - Workflow - Summary Ins Approvals_RA - Jobs-ROMs]

GO
ALTER TABLE [dbo].[RA - Workflow - Summary Ins Approvals]
	WITH CHECK
	ADD CONSTRAINT [FK_RA - Workflow - Summary Ins Approvals_RA - Workflow - Summary Ins Approvals]
	FOREIGN KEY ([Workflow_Summary_Approval_ID]) REFERENCES [dbo].[RA - Workflow - Summary Approvals] ([Workflow_Summary_Approval_ID])
ALTER TABLE [dbo].[RA - Workflow - Summary Ins Approvals]
	CHECK CONSTRAINT [FK_RA - Workflow - Summary Ins Approvals_RA - Workflow - Summary Ins Approvals]

GO
ALTER TABLE [dbo].[RA - Workflow - Summary Ins Approvals] SET (LOCK_ESCALATION = TABLE)
GO
