SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Jobs-ROMs - Exceptions by Summary] (
		[Summary_Exception_ID]                         [int] IDENTITY(1, 1) NOT NULL,
		[Job_ID]                                       [int] NULL,
		[Exception_Notes]                              [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Exception_Estimated_Number_of_Items]          [int] NULL,
		[Exception_Estimated_Rate_of_Items]            [decimal](18, 2) NULL,
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
		CONSTRAINT [PK_RA - Jobs-ROMs - Exceptions by Summary]
		PRIMARY KEY
		CLUSTERED
		([Summary_Exception_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Exceptions by Summary]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs - Exceptions by Summary_RA - Audit Results - State Types]
	FOREIGN KEY ([Exception_Rest_Co_Approval_State_Type_ID]) REFERENCES [dbo].[RA - Audit Results - State Types] ([Audit_Approval_State_Type_ID])
ALTER TABLE [dbo].[RA - Jobs-ROMs - Exceptions by Summary]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs - Exceptions by Summary_RA - Audit Results - State Types]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Exceptions by Summary]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs - Exceptions by Summary_RA - Audit Results - State Types1]
	FOREIGN KEY ([Exception_IC_Co_Approval_State_Type_ID]) REFERENCES [dbo].[RA - Audit Results - State Types] ([Audit_Approval_State_Type_ID])
ALTER TABLE [dbo].[RA - Jobs-ROMs - Exceptions by Summary]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs - Exceptions by Summary_RA - Audit Results - State Types1]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Exceptions by Summary]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs - Exceptions by Summary_RA - Audit Results - State Types2]
	FOREIGN KEY ([Exception_IA_Co_Approval_State_Type_ID]) REFERENCES [dbo].[RA - Audit Results - State Types] ([Audit_Approval_State_Type_ID])
ALTER TABLE [dbo].[RA - Jobs-ROMs - Exceptions by Summary]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs - Exceptions by Summary_RA - Audit Results - State Types2]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Exceptions by Summary] SET (LOCK_ESCALATION = TABLE)
GO
