SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Jobs-ROMs - Exceptions by Sub Cat] (
		[Sub_Cat_Exception_ID]                         [int] IDENTITY(1, 1) NOT NULL,
		[Job_ID]                                       [int] NULL,
		[Exception_Bill_Category_Type_ID]              [int] NULL,
		[Exception_Bill_Sub_Category_Type_ID]          [int] NULL,
		[Exception_IA_Notes]                           [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Exception_RC_Response]                        [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Exception_Notes]                              [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Exception_Doc_URL]                            [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Exception_Estimated_Number_of_Items]          [int] NULL,
		[Exception_Estimated_Rate_of_Items]            [decimal](18, 2) NULL,
		[Exception_Estimated_Hours_of_Resources]       [int] NULL,
		[Exception_Estimated_Cost_of_Items]            [money] NULL,
		[Exception_Willing_to_Pay_Percent]             [decimal](5, 2) NULL,
		[Exception_Rest_Co_Submitter_Contact_ID]       [int] NULL,
		[Exception_Rest_Co_Submitter_User_ID]          [varbinary](50) NULL,
		[Exception_Rest_Co_Approver_User_ID]           [varbinary](50) NULL,
		[Exception_Rest_Co_Approval_State_Type_ID]     [int] NULL,
		[Exception_IA_Co_Approver_User_ID]             [varbinary](50) NULL,
		[Exception_IA_Co_Approval_State_Type_ID]       [int] NULL,
		[Exception_IC_Co_Approver_User_ID]             [varbinary](50) NULL,
		[Exception_IC_Co_Approval_State_Type_ID]       [int] NULL,
		CONSTRAINT [PK_RA - Jobs-ROMs - Exceptions by Sub Cat]
		PRIMARY KEY
		CLUSTERED
		([Sub_Cat_Exception_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Exceptions by Sub Cat]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs - Exceptions by Sub Cat_RA - Audit Results - State Types]
	FOREIGN KEY ([Exception_Rest_Co_Approval_State_Type_ID]) REFERENCES [dbo].[RA - Audit Results - State Types] ([Audit_Approval_State_Type_ID])
ALTER TABLE [dbo].[RA - Jobs-ROMs - Exceptions by Sub Cat]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs - Exceptions by Sub Cat_RA - Audit Results - State Types]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Exceptions by Sub Cat]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs - Exceptions by Sub Cat_RA - Audit Results - State Types1]
	FOREIGN KEY ([Exception_IC_Co_Approval_State_Type_ID]) REFERENCES [dbo].[RA - Audit Results - State Types] ([Audit_Approval_State_Type_ID])
ALTER TABLE [dbo].[RA - Jobs-ROMs - Exceptions by Sub Cat]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs - Exceptions by Sub Cat_RA - Audit Results - State Types1]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Exceptions by Sub Cat]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs - Exceptions by Sub Cat_RA - Audit Results - State Types2]
	FOREIGN KEY ([Exception_IA_Co_Approval_State_Type_ID]) REFERENCES [dbo].[RA - Audit Results - State Types] ([Audit_Approval_State_Type_ID])
ALTER TABLE [dbo].[RA - Jobs-ROMs - Exceptions by Sub Cat]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs - Exceptions by Sub Cat_RA - Audit Results - State Types2]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Exceptions by Sub Cat]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs - Exceptions by Sub Cat_RA - Audit Results - Sub Cat Types]
	FOREIGN KEY ([Exception_Bill_Sub_Category_Type_ID]) REFERENCES [dbo].[RA - Audit Results - Sub Cat Types] ([Audit_Results_Sub_Cat_Type_ID])
ALTER TABLE [dbo].[RA - Jobs-ROMs - Exceptions by Sub Cat]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs - Exceptions by Sub Cat_RA - Audit Results - Sub Cat Types]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Exceptions by Sub Cat]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs - Exceptions by Sub Cat_RA - Jobs-ROMs]
	FOREIGN KEY ([Job_ID]) REFERENCES [dbo].[RA - Jobs-ROMs] ([Job_ID])
ALTER TABLE [dbo].[RA - Jobs-ROMs - Exceptions by Sub Cat]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs - Exceptions by Sub Cat_RA - Jobs-ROMs]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Exceptions by Sub Cat]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs - Exceptions by Sub Cat_RA - Audit Results - Category Types]
	FOREIGN KEY ([Exception_Bill_Category_Type_ID]) REFERENCES [dbo].[RA - Audit Results - Category Types] ([Audit_Results_Category_Type_ID])
ALTER TABLE [dbo].[RA - Jobs-ROMs - Exceptions by Sub Cat]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs - Exceptions by Sub Cat_RA - Audit Results - Category Types]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Exceptions by Sub Cat] SET (LOCK_ESCALATION = TABLE)
GO
