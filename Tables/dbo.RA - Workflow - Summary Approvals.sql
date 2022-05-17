SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Workflow - Summary Approvals] (
		[Workflow_Summary_Approval_ID]               [int] IDENTITY(1, 1) NOT NULL,
		[Submission_ID]                              [int] NULL,
		[Job_ID]                                     [int] NULL,
		[Audit_Summary_ID]                           [int] NULL,
		[Approval_Type]                              [int] NULL,
		[Approval_Notes]                             [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Approval_Amount]                            [money] NULL,
		[Percent_Approval]                           [decimal](3, 2) NULL,
		[Original_Amount]                            [money] NULL,
		[Approval_Date]                              [datetime] NULL,
		[IA_Approver_User_ID]                        [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Ind_Adjuster_Co_ID]                         [int] NULL,
		[IC_Approver_User_ID]                        [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insurance_Co_ID]                            [int] NULL,
		[Manual_Override_Adjustment_Amount]          [money] NULL,
		[Approved_to_Pay_after_Coverage_Percent]     [money] NULL,
		[IA_Approval_Date]                           [datetime] NULL,
		[Disputed_Line_Items]                        [money] NULL,
		[Disputed_Rates_Ratios]                      [money] NULL,
		[Disputed_Total]                             [money] NULL,
		[Disputed_Approved_Exception]                [money] NULL,
		[Offsets_on_Bill]                            [money] NULL,
		[Top_Line_Adjustment]                        [money] NULL,
		[Net_Adjusted_Bill_Amount]                   [money] NULL,
		[Coverage_Pecent]                            [decimal](5, 2) NULL,
		[Approved_to_Pay]                            [money] NULL,
		CONSTRAINT [PK_RA - Workflow - Summary Approvals]
		PRIMARY KEY
		CLUSTERED
		([Workflow_Summary_Approval_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Workflow - Summary Approvals]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Workflow - Summary Approvals_RA - Audit Results - Summary]
	FOREIGN KEY ([Audit_Summary_ID]) REFERENCES [dbo].[RA - Audit Results - Summary] ([Audit_Summary_ID])
ALTER TABLE [dbo].[RA - Workflow - Summary Approvals]
	CHECK CONSTRAINT [FK_RA - Workflow - Summary Approvals_RA - Audit Results - Summary]

GO
ALTER TABLE [dbo].[RA - Workflow - Summary Approvals]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Workflow - Summary Approvals_RA - Independent-Adjuster-Companies]
	FOREIGN KEY ([Ind_Adjuster_Co_ID]) REFERENCES [dbo].[RA - Independent-Adjuster-Companies] ([Ind_Adjuster_Co_ID])
ALTER TABLE [dbo].[RA - Workflow - Summary Approvals]
	CHECK CONSTRAINT [FK_RA - Workflow - Summary Approvals_RA - Independent-Adjuster-Companies]

GO
ALTER TABLE [dbo].[RA - Workflow - Summary Approvals]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Workflow - Summary Approvals_RA - Insurance Companies]
	FOREIGN KEY ([Insurance_Co_ID]) REFERENCES [dbo].[RA - Insurance Companies] ([Insurance_Co_ID])
ALTER TABLE [dbo].[RA - Workflow - Summary Approvals]
	CHECK CONSTRAINT [FK_RA - Workflow - Summary Approvals_RA - Insurance Companies]

GO
ALTER TABLE [dbo].[RA - Workflow - Summary Approvals]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Workflow - Summary Approvals_RA - Jobs-ROMs]
	FOREIGN KEY ([Job_ID]) REFERENCES [dbo].[RA - Jobs-ROMs] ([Job_ID])
ALTER TABLE [dbo].[RA - Workflow - Summary Approvals]
	CHECK CONSTRAINT [FK_RA - Workflow - Summary Approvals_RA - Jobs-ROMs]

GO
ALTER TABLE [dbo].[RA - Workflow - Summary Approvals]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Workflow - Summary Approvals_RA - Workflow - Bill Submission State]
	FOREIGN KEY ([Submission_ID]) REFERENCES [dbo].[RA - Workflow - Bill Submission State] ([Submission_ID])
ALTER TABLE [dbo].[RA - Workflow - Summary Approvals]
	CHECK CONSTRAINT [FK_RA - Workflow - Summary Approvals_RA - Workflow - Bill Submission State]

GO
ALTER TABLE [dbo].[RA - Workflow - Summary Approvals]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Workflow - Summary Approvals_RA - Audit Results - State Types]
	FOREIGN KEY ([Approval_Type]) REFERENCES [dbo].[RA - Audit Results - State Types] ([Audit_Approval_State_Type_ID])
ALTER TABLE [dbo].[RA - Workflow - Summary Approvals]
	CHECK CONSTRAINT [FK_RA - Workflow - Summary Approvals_RA - Audit Results - State Types]

GO
ALTER TABLE [dbo].[RA - Workflow - Summary Approvals] SET (LOCK_ESCALATION = TABLE)
GO
