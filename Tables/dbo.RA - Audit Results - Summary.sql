SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Audit Results - Summary] (
		[Audit_Summary_ID]                                  [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Bill_ID]                                      [int] NULL,
		[Job_ID]                                            [int] NULL,
		[Rest_Co_ID]                                        [int] NULL,
		[Submission_ID]                                     [int] NULL,
		[Submission_Sequence_Number]                        [int] NULL,
		[Audit_Date]                                        [date] NULL,
		[Audit_User_ID]                                     [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Overall_Score]                                     [int] NULL,
		[Overall_Result]                                    [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Audit_Summary_Check_Status_ID]                     [int] NULL,
		[Overall_Result_Comments]                           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_Reviewer_Comments1]                        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IA_Co_Reviewer_Comments1]                          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Ins_Co_Reviewer_Comments1]                         [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_Reviewer_Comments]                         [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IA_Co_Reviewer_Comments]                           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Ins_Co_Reviewer_Comments]                          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Audit_Results_Total_Job_Cost]                      [money] NULL,
		[Audit_Results_Total_Prior_Payments]                [money] NULL,
		[Audit_Results_Current_Bill_Amount]                 [money] NULL,
		[Audit_Results_Total_Cat_Rollup_Cost]               [money] NULL,
		[Audit_Results_Total_Cat_Rollup_Markup]             [money] NULL,
		[Audit_Results_Total_Cat_Rollup_Bill_Amt]           [money] NULL,
		[Audit_Results_Total_Summary_Cost]                  [money] NULL,
		[Audit_Results_Total_Summary_Warning_Cost]          [money] NULL,
		[Audit_Results_Total_Summary_Error_Cost]            [money] NULL,
		[Audit_Results_Total_Summary_Error_Per_of_Bill]     [numeric](18, 2) NULL,
		[Audit_Results_Total_Summary_Warn_Per_of_Bill]      [numeric](18, 2) NULL,
		[Audit_Results_Total_Summary_EW_Per_of_Bill]        [numeric](18, 2) NULL,
		[Audit_Results_Total_Rate_Impact]                   [money] NULL,
		[Audit_S3_File_Name]                                [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Audit_S3_Bucket_Name]                              [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Audit Results - Summary]
		PRIMARY KEY
		CLUSTERED
		([Audit_Summary_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Audit Results - Summary]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Audit Results - Summary_RA - Jobs-ROMs]
	FOREIGN KEY ([Job_ID]) REFERENCES [dbo].[RA - Jobs-ROMs] ([Job_ID])
ALTER TABLE [dbo].[RA - Audit Results - Summary]
	CHECK CONSTRAINT [FK_RA - Audit Results - Summary_RA - Jobs-ROMs]

GO
ALTER TABLE [dbo].[RA - Audit Results - Summary]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Audit Results - Summary_RA - Restoration Companies]
	FOREIGN KEY ([Rest_Co_ID]) REFERENCES [dbo].[RA - Restoration Companies] ([Rest_Co_ID])
ALTER TABLE [dbo].[RA - Audit Results - Summary]
	CHECK CONSTRAINT [FK_RA - Audit Results - Summary_RA - Restoration Companies]

GO
ALTER TABLE [dbo].[RA - Audit Results - Summary]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Audit Results - Summary_RA - Workflow - Bill Submission State]
	FOREIGN KEY ([Submission_ID]) REFERENCES [dbo].[RA - Workflow - Bill Submission State] ([Submission_ID])
ALTER TABLE [dbo].[RA - Audit Results - Summary]
	CHECK CONSTRAINT [FK_RA - Audit Results - Summary_RA - Workflow - Bill Submission State]

GO
ALTER TABLE [dbo].[RA - Audit Results - Summary]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Audit Results - Summary_RA - Rest Bills]
	FOREIGN KEY ([Rest_Bill_ID]) REFERENCES [dbo].[RA - Rest Bills] ([Rest_Bill_ID])
ALTER TABLE [dbo].[RA - Audit Results - Summary]
	CHECK CONSTRAINT [FK_RA - Audit Results - Summary_RA - Rest Bills]

GO
ALTER TABLE [dbo].[RA - Audit Results - Summary]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Audit Results - Summary_RA - Audit_Results - Check Status ID]
	FOREIGN KEY ([Audit_Summary_Check_Status_ID]) REFERENCES [dbo].[RA - Audit_Results - Check Status ID] ([Audit_Results_Check_Status_ID])
ALTER TABLE [dbo].[RA - Audit Results - Summary]
	CHECK CONSTRAINT [FK_RA - Audit Results - Summary_RA - Audit_Results - Check Status ID]

GO
ALTER TABLE [dbo].[RA - Audit Results - Summary] SET (LOCK_ESCALATION = TABLE)
GO
