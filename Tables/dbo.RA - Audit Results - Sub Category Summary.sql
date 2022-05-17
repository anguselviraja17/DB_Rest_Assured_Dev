SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Audit Results - Sub Category Summary] (
		[Audit_Results_Sub_Cat_ID]                            [int] IDENTITY(1, 1) NOT NULL,
		[Audit_Results_Sub_Cat_Type_ID]                       [int] NULL,
		[Audit_Results_Category_Type_ID]                      [int] NULL,
		[Audit_Summary_ID]                                    [int] NULL,
		[Audit_Results_Sub_Cat_Check_Status_ID]               [int] NULL,
		[Audit_Results_Sub_Cat_Check_Performed]               [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Audit_Results_Sub_Cat_Count_of_Successes]            [int] NULL,
		[Audit_Results_Sub_Cat_Count_of_Warnings]             [int] NULL,
		[Audit_Results_Sub_Cat_Count_of_Failures]             [int] NULL,
		[Audit_Results_Sub_Cat_Rest_Co_Approval_State]        [int] NULL,
		[Audit_Results_Sub_Cat_IA_Co_Approval_State]          [int] NULL,
		[Audit_Results_Sub_Cat_IC_Co_Approval_State]          [int] NULL,
		[Audit_Results_Sub_Cat_Types_of_Issues]               [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Audit_Results_Sub_Cat_Rest_Co_Reviewer_Comments]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Audit_Results_Sub_Cat_IA_Co_Reviewer_Comments]       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Audit_Results_Sub_Cat_Ins_Co_Reviewer_Comments]      [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Audit_Results_Total_Sub_Cat_Cost]                    [money] NULL,
		[Audit_Results_Total_Sub_Cat_Markup]                  [money] NULL,
		[Audit_Results_Total_Sub_Cat_Bill_Amt]                [money] NULL,
		[Audit_Results_Total_Sub_Cat_Warning_Cost]            [money] NULL,
		[Audit_Results_Total_Sub_Cat_Error_Cost]              [money] NULL,
		[Audit_Results_Total_Sub_Cat_Per_of_Bill]             [numeric](18, 2) NULL,
		[Audit_Results_Total_Sub_Cat_Per_of_Sub_Cat]          [numeric](18, 2) NULL,
		[Audit_Results_Total_Laborer_Cost]                    [money] NULL,
		[Audit_Results_Total_Number_of_Laborers]              [numeric](5, 2) NULL,
		[Audit_Results_Total_OT_Hours]                        [numeric](18, 2) NULL,
		[Audit_Results_Total_OT_Cost]                         [money] NULL,
		[Audit_Results_Rate_Impact]                           [money] NULL,
		CONSTRAINT [PK_RA - Audit Results - Sub Category Summary]
		PRIMARY KEY
		CLUSTERED
		([Audit_Results_Sub_Cat_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Audit Results - Sub Category Summary]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Audit Results - Sub Category Summary_RA - Audit Results - State Types2]
	FOREIGN KEY ([Audit_Results_Sub_Cat_IC_Co_Approval_State]) REFERENCES [dbo].[RA - Audit Results - State Types] ([Audit_Approval_State_Type_ID])
ALTER TABLE [dbo].[RA - Audit Results - Sub Category Summary]
	CHECK CONSTRAINT [FK_RA - Audit Results - Sub Category Summary_RA - Audit Results - State Types2]

GO
ALTER TABLE [dbo].[RA - Audit Results - Sub Category Summary]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Audit Results - Sub Category Summary_RA - Audit Results Sub Cat Types]
	FOREIGN KEY ([Audit_Results_Sub_Cat_Type_ID]) REFERENCES [dbo].[RA - Audit Results - Sub Cat Types] ([Audit_Results_Sub_Cat_Type_ID])
ALTER TABLE [dbo].[RA - Audit Results - Sub Category Summary]
	CHECK CONSTRAINT [FK_RA - Audit Results - Sub Category Summary_RA - Audit Results Sub Cat Types]

GO
ALTER TABLE [dbo].[RA - Audit Results - Sub Category Summary]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Audit Results - Sub Category Summary_RA - Audit Results - Summary]
	FOREIGN KEY ([Audit_Summary_ID]) REFERENCES [dbo].[RA - Audit Results - Summary] ([Audit_Summary_ID])
ALTER TABLE [dbo].[RA - Audit Results - Sub Category Summary]
	CHECK CONSTRAINT [FK_RA - Audit Results - Sub Category Summary_RA - Audit Results - Summary]

GO
ALTER TABLE [dbo].[RA - Audit Results - Sub Category Summary]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Audit Results - Sub Category Summary_RA - Audit_Results - Check Status ID]
	FOREIGN KEY ([Audit_Results_Sub_Cat_Check_Status_ID]) REFERENCES [dbo].[RA - Audit_Results - Check Status ID] ([Audit_Results_Check_Status_ID])
ALTER TABLE [dbo].[RA - Audit Results - Sub Category Summary]
	CHECK CONSTRAINT [FK_RA - Audit Results - Sub Category Summary_RA - Audit_Results - Check Status ID]

GO
ALTER TABLE [dbo].[RA - Audit Results - Sub Category Summary]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Audit Results - Sub Category Summary_RA - Audit Results - Category Types]
	FOREIGN KEY ([Audit_Results_Category_Type_ID]) REFERENCES [dbo].[RA - Audit Results - Category Types] ([Audit_Results_Category_Type_ID])
ALTER TABLE [dbo].[RA - Audit Results - Sub Category Summary]
	CHECK CONSTRAINT [FK_RA - Audit Results - Sub Category Summary_RA - Audit Results - Category Types]

GO
ALTER TABLE [dbo].[RA - Audit Results - Sub Category Summary]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Audit Results - Sub Category Summary_RA - Audit Results - State Types]
	FOREIGN KEY ([Audit_Results_Sub_Cat_Rest_Co_Approval_State]) REFERENCES [dbo].[RA - Audit Results - State Types] ([Audit_Approval_State_Type_ID])
ALTER TABLE [dbo].[RA - Audit Results - Sub Category Summary]
	CHECK CONSTRAINT [FK_RA - Audit Results - Sub Category Summary_RA - Audit Results - State Types]

GO
ALTER TABLE [dbo].[RA - Audit Results - Sub Category Summary]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Audit Results - Sub Category Summary_RA - Audit Results - State Types1]
	FOREIGN KEY ([Audit_Results_Sub_Cat_IA_Co_Approval_State]) REFERENCES [dbo].[RA - Audit Results - State Types] ([Audit_Approval_State_Type_ID])
ALTER TABLE [dbo].[RA - Audit Results - Sub Category Summary]
	CHECK CONSTRAINT [FK_RA - Audit Results - Sub Category Summary_RA - Audit Results - State Types1]

GO
ALTER TABLE [dbo].[RA - Audit Results - Sub Category Summary] SET (LOCK_ESCALATION = TABLE)
GO
