SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Jobs-ROMs - Exceptions] (
		[Exception_ID]                                 [int] IDENTITY(1, 1) NOT NULL,
		[Job_ID]                                       [int] NULL,
		[Exception_Bill_Category_Type_ID]              [int] NULL,
		[Exception_Notes]                              [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Exception_Estimated_Number_of_Items]          [int] NULL,
		[Exception_Estimated_Rate_of_Items]            [money] NULL,
		[Exception_Estimated_Hours_of_Resources]       [int] NULL,
		[Exception_Estimated_Cost_of_Items]            [money] NULL,
		[Exception_Rest_Co_Submitter_Contact_ID]       [int] NULL,
		[Exception_Rest_Co_Submitter_User_ID]          [varbinary](50) NULL,
		[Exception_Rest_Co_Approver_User_ID]           [varbinary](50) NULL,
		[Exception_Rest_Co_Approval_State_Type_ID]     [int] NULL,
		[Exception_IA_Co_Approver_User_ID]             [varbinary](50) NULL,
		[Exception_IA_Co_Approval_State_Type_ID]       [int] NULL,
		[Exception_IC_Co_Approver_User_ID]             [varbinary](50) NULL,
		[Exception_IC_Co_Approval_State_Type_ID]       [int] NULL,
		CONSTRAINT [PK_Jobs-ROMs - Exceptions]
		PRIMARY KEY
		CLUSTERED
		([Exception_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Jobs-ROMs - Exceptions]
	WITH CHECK
	ADD CONSTRAINT [FK_Jobs-ROMs - Exceptions_RA - Audit Results - Category Types]
	FOREIGN KEY ([Exception_Bill_Category_Type_ID]) REFERENCES [dbo].[RA - Audit Results - Category Types] ([Audit_Results_Category_Type_ID])
ALTER TABLE [dbo].[Jobs-ROMs - Exceptions]
	CHECK CONSTRAINT [FK_Jobs-ROMs - Exceptions_RA - Audit Results - Category Types]

GO
ALTER TABLE [dbo].[Jobs-ROMs - Exceptions]
	WITH CHECK
	ADD CONSTRAINT [FK_Jobs-ROMs - Exceptions_RA - Jobs-ROMs]
	FOREIGN KEY ([Job_ID]) REFERENCES [dbo].[RA - Jobs-ROMs] ([Job_ID])
ALTER TABLE [dbo].[Jobs-ROMs - Exceptions]
	CHECK CONSTRAINT [FK_Jobs-ROMs - Exceptions_RA - Jobs-ROMs]

GO
ALTER TABLE [dbo].[Jobs-ROMs - Exceptions] SET (LOCK_ESCALATION = TABLE)
GO
