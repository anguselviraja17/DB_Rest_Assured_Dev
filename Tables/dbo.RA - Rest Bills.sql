SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Rest Bills] (
		[Rest_Bill_ID]                      [int] IDENTITY(1, 1) NOT NULL,
		[Job_ID]                            [int] NULL,
		[Submission_Number]                 [int] NULL,
		[Submissions_Expected]              [int] NULL,
		[Submission_date]                   [date] NULL,
		[Job_Number]                        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Invoice_Number]                    [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Invoice_Date]                      [date] NULL,
		[Customer_ID]                       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_Federal_ID_Num]            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Customer_Address]                  [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Customer_City]                     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Customer_State]                    [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Customer_Zip]                      [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Customer_County]                   [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Customer_Country]                  [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Job_Building_Location_Address]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Job_Building_Location_City]        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Job_Building_Location_State]       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Job_Building_Location_Zip]         [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Job_Building_Location_County]      [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Job_Building_Location_Country]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Billing_Amount]                    [money] NULL,
		[Billing_Tax]                       [money] NULL,
		[Billing_Total]                     [money] NULL,
		[Billing_Phone_number]              [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Billing_E-Mail]                    [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Payment_Terms]                     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Billing_Labor_Cost]                [money] NULL,
		[Associated_Labor_Fees]             [money] NULL,
		[Material_Cost]                     [money] NULL,
		[Equipment_Tools_Cost]              [money] NULL,
		[Subcontract_and_Vendors]           [money] NULL,
		[Reimbursable_Items]                [money] NULL,
		[Equipment_Term_Discount]           [money] NULL,
		[TM_Sub_Total]                      [money] NULL,
		[Off-Site_Logistical_Fee]           [money] NULL,
		[Indirect_Expense_Allocation]       [money] NULL,
		[Applied_Credits]                   [money] NULL,
		[Previous_Payments]                 [money] NULL,
		[Pre-Tax_Total_Amount_Due]          [money] NULL,
		[Bill_URL]                          [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[CAT_Named_Event_Ind]               [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[CAT_Name]                          [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[CAT_Fee_Percent]                   [decimal](5, 2) NULL,
		[CAT_Fee]                           [money] NULL,
		[Bill_Is_Active]                    [bit] NULL,
		[Bill_Original_File_Name]           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Bill_New_File_Name]                [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Bill_New_File_S3_Bucket_Name]      [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Last_Update_Date]                  [datetime] NULL,
		[RA_Invoice_Produced]               [bit] NULL,
		[RA_Invoice_Produced_Datetime]      [datetime] NULL,
		[RA_Invoice_Sent]                   [bit] NULL,
		[RA_Invoice_Sent_Datetime]          [datetime] NULL,
		[RA_Bill_Ready_to_Invoice]          [bit] NULL,
		[RA_Bill_Eligible_to_Invoice]       [bit] NULL,
		[Invoice_Status]                    [int] NULL,
		[RA_Analyst_Comments]               [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[RA_Invoice_Exported_User_ID]       [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[RA_Invoice_Exported_File_Name]     [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Rest Bills]
		PRIMARY KEY
		CLUSTERED
		([Rest_Bill_ID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Rest Bills]
	ADD
	CONSTRAINT [DF_RA - Rest Bills_Bill_Is_Active]
	DEFAULT ((1)) FOR [Bill_Is_Active]
GO
ALTER TABLE [dbo].[RA - Rest Bills]
	ADD
	CONSTRAINT [DF_RA - Rest Bills_RA_Invoice_Produced]
	DEFAULT ((0)) FOR [RA_Invoice_Produced]
GO
ALTER TABLE [dbo].[RA - Rest Bills]
	ADD
	CONSTRAINT [DF_RA - Rest Bills_RA_Invoice_Sent]
	DEFAULT ((0)) FOR [RA_Invoice_Sent]
GO
ALTER TABLE [dbo].[RA - Rest Bills]
	ADD
	CONSTRAINT [DF_RA - Rest Bills_Last_Update_Date]
	DEFAULT (getdate()) FOR [Last_Update_Date]
GO
ALTER TABLE [dbo].[RA - Rest Bills]
	ADD
	CONSTRAINT [DF_RA - Rest Bills_RA_Bill_Ready_to_Invoice]
	DEFAULT ((0)) FOR [RA_Bill_Ready_to_Invoice]
GO
ALTER TABLE [dbo].[RA - Rest Bills]
	ADD
	CONSTRAINT [DF_RA - Rest Bills_RA_Bill_Eligible_to_Invoice]
	DEFAULT ((-1)) FOR [RA_Bill_Eligible_to_Invoice]
GO
ALTER TABLE [dbo].[RA - Rest Bills]
	ADD
	CONSTRAINT [DF_RA - Rest Bills_Invoice_Status_1]
	DEFAULT ((0)) FOR [Invoice_Status]
GO
ALTER TABLE [dbo].[RA - Rest Bills]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Rest Bills_RA - Jobs-ROMs]
	FOREIGN KEY ([Job_ID]) REFERENCES [dbo].[RA - Jobs-ROMs] ([Job_ID])
ALTER TABLE [dbo].[RA - Rest Bills]
	CHECK CONSTRAINT [FK_RA - Rest Bills_RA - Jobs-ROMs]

GO
ALTER TABLE [dbo].[RA - Rest Bills] SET (LOCK_ESCALATION = TABLE)
GO
